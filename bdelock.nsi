# Includes
!include WinVer.nsh
!include x64.nsh
!include FileFunc.nsh

# Defines
!define PROJECT     "bdelock"
!define VERSION     "0.0.5"
!define REVISION    "0"
!define LEGALNOTE   "Public Domain"
!define WEBPAGE     "https://github.com/dleidert/bde-lock"
!define INSTALLER   "${PROJECT}-${VERSION}-setup.exe"
!define UNINSTALLER "uninstall.exe"

!define CTXT_ENTRY    "lock-bde"

!define REG_DRIVECTXT "Drive\shell\${CTXT_ENTRY}"
!define REG_UNINSTALL "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\bdelock"
!define REG_BITLOCKER "SOFTWARE\Microsoft\Windows\CurrentVersion\BitLocker"

# Variables
Var SystemDrive

# Installer configuration
CRCCheck on
InstallColors /windows
InstallDir "$PROGRAMFILES64\${PROJECT}"
LicenseData LICENSE
!if ${NSIS_PACKEDVERSION} > 0x02ffffff ; NSIS 3+:
ManifestSupportedOS WinVista Win7 Win8 Win8.1 Win10
!endif
ManifestSupportedOS WinVista Win7 Win8 Win8.1 Win10
Name "BDELock v${VERSION}"
RequestExecutionLevel admin
SetCompressor /SOLID lzma
ShowInstDetails   hide
ShowUninstDetails hide
!if ${NSIS_PACKEDVERSION} > 0x02ffffff ; NSIS 3+:
Unicode true
!endif
XPStyle on

# Installer version information
VIProductVersion "${VERSION}.${REVISION}"
VIFileVersion "${VERSION}.${REVISION}"

!include "locale\languages.nsh"

OutFile "${INSTALLER}"

LicenseText $(LicenseHeaderText) $(LicenseButtonText)
Page license
Page instfiles
UninstPage uninstConfirm
UninstPage instfiles

# onInit
Function .onInit
  ${IfNot} ${AtLeastWinVista}
    MessageBox MB_OK $(MsgWindowsVersion)
    Quit
  ${EndIf}
  ${If} ${RunningX64}
  SetRegView 64
  ${EndIf}
  ClearErrors
  ReadRegDWORD $R0 HKLM "${REG_BITLOCKER}" "IsBdeDriverPresent"
  ${If} ${Errors}
  ${OrIf} $R0 <> 1
    MessageBox MB_OKCANCEL $(MsgBitlockerError) IDOK OK IDCANCEL CANCEL
    CANCEL:
      Quit
    OK:
  ${EndIf}
  ClearErrors
  ReadEnvStr $R0 SystemDrive
  ${If} ${Errors}
    MessageBox MB_OK "Error getting system drive letter from %SystemDrive%"
    StrCpy $SystemDrive "C:"
  ${Else}
    StrCpy $SystemDrive "$R0"
  ${EndIf}
FunctionEnd

# onInit
Function un.onInit
  ${If} ${RunningX64}
  SetRegView 64
  ${EndIf}
FunctionEnd

# Default section
Section
  SetOverwrite ifnewer
  SetOutPath "$INSTDIR"
  File "script\bdelock.vbs"
  WriteUninstaller "$INSTDIR\${UNINSTALLER}"
  # registry context menu entries
  # TODO: test for key!
  WriteRegStr HKCR "${REG_DRIVECTXT}" ""                  "$(RegContextMenuEntry)"
  WriteRegStr HKCR "${REG_DRIVECTXT}" "AppliesTo"         "(System.Volume.BitLockerProtection:=1 OR System.Volume.BitLockerProtection:=3 OR System.Volume.BitLockerProtection:=5) AND NOT $SystemDrive"
  WriteRegStr HKCR "${REG_DRIVECTXT}" "HasLUAShield"      ""
  WriteRegStr HKCR "${REG_DRIVECTXT}" "MultiSelectModel"  "Single"
  # registry context menu command
  WriteRegExpandStr  HKCR "${REG_DRIVECTXT}\command" ""   "%SystemRoot%\System32\wscript.exe $\"%ProgramFiles%\${PROJECT}\bdelock.vbs$\" %1"
  # registry uninstaller entries
  WriteRegStr   HKLM "${REG_UNINSTALL}" "DisplayName"     "$(RegUninstallDispNam) (${PROJECT})"
  WriteRegStr   HKLM "${REG_UNINSTALL}" "DisplayVersion"  "${VERSION}"
  WriteRegStr   HKLM "${REG_UNINSTALL}" "InstallLocation" "$INSTDIR"
  WriteRegStr   HKLM "${REG_UNINSTALL}" "UninstallString" "$INSTDIR\${UNINSTALLER}"
  WriteRegStr   HKLM "${REG_UNINSTALL}" "QuietUninstallString" "$INSTDIR\${UNINSTALLER} /S"
  WriteRegStr   HKLM "${REG_UNINSTALL}" "Comments"        "$(RegUninstallComment)"
  WriteRegStr   HKLM "${REG_UNINSTALL}" "Publisher"       "Daniel Leidert"
  WriteRegStr   HKLM "${REG_UNINSTALL}" "Contact"         "https://github.com/dleidert"
  WriteRegStr   HKLM "${REG_UNINSTALL}" "URLInfoAbout"    "${WEBPAGE}"
  WriteRegStr   HKLM "${REG_UNINSTALL}" "URLUpdateInfo"   "${WEBPAGE}/releases"
  WriteRegStr   HKLM "${REG_UNINSTALL}" "HelpLink"        "${WEBPAGE}/wiki"
  WriteRegStr   HKLM "${REG_UNINSTALL}" "Readme"          "${WEBPAGE}/blob/master/$(RegUninstallReadme)"
  WriteRegDWORD HKLM "${REG_UNINSTALL}" "Language"        $(UserLanguageId)
  WriteRegDWORD HKLM "${REG_UNINSTALL}" "NoModify"        "1"
  WriteRegDWORD HKLM "${REG_UNINSTALL}" "NoRepair"        "1"
  ${GetSize} "$INSTDIR" "/S=0K" $0 $1 $2
  IntFmt $0 "0x%08X" $0
  WriteRegDWORD HKLM "${REG_UNINSTALL}" "EstimatedSize"   "$0"
SectionEnd

# Uninstaller section
Section "uninstall"
  DeleteRegKey HKCR "${REG_DRIVECTXT}"
  Delete "$INSTDIR\bdelock.vbs"
  Delete "$INSTDIR\${UNINSTALLER}"
  RMDir  "$INSTDIR"
  DeleteRegKey HKLM "${REG_UNINSTALL}"
SectionEnd
