# Author: Daniel Leidert, 2018

LoadLanguageFile "${NSISDIR}\Contrib\Language files\English.nlf"

LangString Name ${LANG_ENGLISH} "English"

VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName"     "${PROJECT}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductVersion"  "${VERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion"     "${VERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "BDE Lock Installer"
VIAddVersionKey /LANG=${LANG_ENGLISH} "Comments"        "Installs a context menu entry to lock unlocked Bitlocker-encrypted drives"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright"  "Public Domain"

LangString LicenseButtonText   ${LANG_ENGLISH} "I understand"
LangString LicenseHeaderText   ${LANG_ENGLISH} "License information"
LangString MsgBitlockerError   ${LANG_ENGLISH} "Bitlocker-Test failed or Bitlocker not present. Do you still want to proceed?"
LangString MsgWindowsVersion   ${LANG_ENGLISH} "Windows Vista or above required"
LangString RegContextMenuEntry ${LANG_ENGLISH} "Bitlocker Lock Drive"
LangString RegUninstallDispNam ${LANG_ENGLISH} "Bitlocker Drive Locker - Explorer Context Menu Entry"
LangString RegUninstallComment ${LANG_ENGLISH} "Adds a context menu entry to lock an unlocked bitlocker encrypted drive/partition."
LangString RegUninstallReadme  ${LANG_ENGLISH} "Readme.md"

LangString UserLanguageId      ${LANG_ENGLISH} ${LANG_ENGLISH}
