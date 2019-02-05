# Includes
!include "x64.nsh"

# Defines
!define PROJECT     "bdelock"
!define VERSION     "0.0.1"
!define REVISION    "0"
!define WEBPAGE     "https://github.com/dleidert/bde-lock"
!define INSTALLER   "${PROJECT}-${VERSION}-setup.exe"
!define UNINSTALLER "uninstall.exe"

!define CTXT_ENTRY    "lock-bde"

!define REG_DRIVECTXT "Drive\shell\${CTXT_ENTRY}"
!define REG_UNINSTALL "Software\Microsoft\Windows\CurrentVersion\Uninstall\bdelock"

# Variables

# Installer configuration
Name "BDELock v${VERSION}"
InstallDir "$PROGRAMFILES64\${PROJECT}"
ManifestSupportedOS Win10
RequestExecutionLevel admin
InstallColors /windows
XPStyle on
SetCompressor /SOLID lzma
LicenseData public-domain.txt
ShowInstDetails   hide
ShowUninstDetails hide

# Installer version information
VIProductVersion "${VERSION}.${REVISION}"
VIAddVersionKey  "ProductName"     "${PROJECT}"
VIAddVersionKey  "ProductVersion"  "${VERSION}"

!include "locale\languages.nsh"

OutFile "${INSTALLER}"

LicenseText $(LicenseHeaderText) $(LicenseButtonText)
Page license
Page instfiles
UninstPage uninstConfirm
UninstPage instfiles

# Default section
Section
  SetOverwrite ifnewer
  SetOutPath "$INSTDIR"
  File "script\bdelock.vbs"
  WriteUninstaller "$INSTDIR\${UNINSTALLER}"
  # registry context menu entries
  # TODO: test for key!
  WriteRegStr HKCR "${REG_DRIVECTXT}" ""                  "$(ContextMenuEntry)"
  WriteRegStr HKCR "${REG_DRIVECTXT}" "AppliesTo"         "(System.Volume.BitLockerProtection:=1 OR System.Volume.BitLockerProtection:=3 OR System.Volume.BitLockerProtection:=5) AND NOT C:"
  WriteRegStr HKCR "${REG_DRIVECTXT}" "HasLUAShield"      ""
  WriteRegStr HKCR "${REG_DRIVECTXT}" "MultiSelectModel"  "Single"
  # registry context menu command
  ${If} ${RunningX64}
  SetRegView 64
  ${EndIf}
  WriteRegExpandStr  HKCR "${REG_DRIVECTXT}\command" ""   "%SystemRoot%\System32\wscript.exe $\"%ProgramFiles%\${PROJECT}\bdelock.vbs$\" %1"
  # registry uninstaller entries
  WriteRegStr   HKLM "${REG_UNINSTALL}" "DisplayName"     "${PROJECT} ${VERSION}"
  WriteRegStr   HKLM "${REG_UNINSTALL}" "DisplayVersion"  "${VERSION}"
  WriteRegStr   HKLM "${REG_UNINSTALL}" "UninstallString" "$INSTDIR\${UNINSTALLER}"
  WriteRegStr   HKLM "${REG_UNINSTALL}" "Publisher"       "Daniel Leidert"
  WriteRegStr   HKLM "${REG_UNINSTALL}" "Contact"         "https://github.com/dleidert"
  WriteRegStr   HKLM "${REG_UNINSTALL}" "URLInfoAbout"    "${WEBPAGE}"
  WriteRegStr   HKLM "${REG_UNINSTALL}" "HelpLink"        "${WEBPAGE}/wiki"
  WriteRegStr   HKLM "${REG_UNINSTALL}" "Readme"          "${WEBPAGE}/blob/master/README.md"
  WriteRegDWORD HKLM "${REG_UNINSTALL}" "NoModify"        "1"
  WriteRegDWORD HKLM "${REG_UNINSTALL}" "NoRepair"        "1"
  WriteRegDWORD HKLM "${REG_UNINSTALL}" "EstimatedSize"   "40"
  WriteRegDWORD HKLM "${REG_UNINSTALL}" "Language"        $(UserLanguageId)
#  WriteRegStr   HKLM "${REG_UNINSTALL}" "Comments"        ""
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
