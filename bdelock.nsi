# Includes
!include WinVer.nsh
!include x64.nsh

# Defines
!define PROJECT     "bdelock"
!define VERSION     "0.0.2"
!define REVISION    "0"
!define WEBPAGE     "https://github.com/dleidert/bde-lock"
!define INSTALLER   "${PROJECT}-${VERSION}-setup.exe"
!define UNINSTALLER "uninstall.exe"

!define CTXT_ENTRY    "lock-bde"

!define REG_DRIVECTXT "Drive\shell\${CTXT_ENTRY}"
!define REG_UNINSTALL "Software\Microsoft\Windows\CurrentVersion\Uninstall\bdelock"
!define REG_BITLOCKER "SOFTWARE\Microsoft\Windows\CurrentVersion\BitLocker"

# Variables

# Installer configuration
CRCCheck on
InstallColors /windows
InstallDir "$PROGRAMFILES64\${PROJECT}"
LicenseData public-domain.txt
ManifestSupportedOS WinVista Win7 Win8 Win8.1 Win10
Name "BDELock v${VERSION}"
RequestExecutionLevel admin
SetCompressor /SOLID lzma
ShowInstDetails   hide
ShowUninstDetails hide
XPStyle on

# Installer version information
VIProductVersion "${VERSION}.${REVISION}"

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
  WriteRegStr HKCR "${REG_DRIVECTXT}" "AppliesTo"         "(System.Volume.BitLockerProtection:=1 OR System.Volume.BitLockerProtection:=3 OR System.Volume.BitLockerProtection:=5) AND NOT C:"
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
  WriteRegStr   HKLM "${REG_UNINSTALL}" "Readme"          "${WEBPAGE}/blob/master/README.md"
  WriteRegDWORD HKLM "${REG_UNINSTALL}" "EstimatedSize"   "40"
  WriteRegDWORD HKLM "${REG_UNINSTALL}" "Language"        $(UserLanguageId)
  WriteRegDWORD HKLM "${REG_UNINSTALL}" "NoModify"        "1"
  WriteRegDWORD HKLM "${REG_UNINSTALL}" "NoRepair"        "1"
  SetOverwrite on
SectionEnd

# Uninstaller section
Section "uninstall"
  Delete "$INSTDIR\bdelock.vbs"
  Delete "$INSTDIR\${UNINSTALLER}"
  RMDir  "$INSTDIR"
  DeleteRegKey HKCR "${REG_DRIVECTXT}"
  DeleteRegKey HKLM "${REG_UNINSTALL}"
SectionEnd
