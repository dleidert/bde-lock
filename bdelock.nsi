OutFile "bdelock-setup.exe"

# Defines
!define PROJECT "bdelock"
!define VERSION "0.0.1"
!define WEBPAGE "https://github.com/dleidert/bde-lock"
!define REG_UNINSTALL	"Software\Microsoft\Windows\CurrentVersion\Uninstall\bdelock"

# Variables

# Installer configuration
Name "BDELock v${VERSION}"
InstallDir "$PROGRAMFILES32\bdelock"
RequestExecutionLevel admin
SetCompressor /SOLID lzma
ShowInstDetails   hide
ShowUninstDetails hide

# Installer version information
VIProductVersion "${VERSION}"
VIAddVersionKey  "ProductName"     "${PROJECT}"
VIAddVersionKey  "FileVersion"     "${VERSION}"
VIAddVersionKey  "ProductVersion"  "${VERSION}"
VIAddVersionKey  "LegalCopyright"  ""
VIAddVersionKey  "FileDescription" "BDELock Installer"

# Default section
Section
  SetOutPath "$INSTDIR"
  SetOverwrite on
  File "script\bdelock.vbs"
  WriteUninstaller "$INSTDIR\uninstall.exe"
  WriteRegStr   HKLM "${REG_UNINSTALL}" "DisplayName" 		"${PROJECT} ${VERSION}"
	WriteRegStr   HKLM "${REG_UNINSTALL}" "UninstallString" "$INSTDIR\${UNINSTALL_EXE}"
	WriteRegStr   HKLM "${REG_UNINSTALL}" "Publisher" 		  "Daniel Leidert"
	WriteRegStr   HKLM "${REG_UNINSTALL}" "URLInfoAbout" 	  "${WEBPAGE}"
	WriteRegStr   HKLM "${REG_UNINSTALL}" "HelpLink" 			  "${WEBPAGE}/wiki"
	WriteRegStr   HKLM "${REG_UNINSTALL}" "DisplayVersion" 	"${VERSION}"
	WriteRegDWORD HKLM "${REG_UNINSTALL}" "NoModify"        "1"
	WriteRegDWORD HKLM "${REG_UNINSTALL}" "NoRepair"        "1"
  SetOverwrite on
SectionEnd

# Uninstaller section
Section "uninstall"
	Delete "$INSTDIR\bdelock.vbs"
  Delete "$INSTDIR\uninstall.exe"
	RMDir  "$INSTDIR"
  DeleteRegKey HKLM "${REG_UNINSTALL}"
SectionEnd
