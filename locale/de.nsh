# Author: Daniel Leidert, 2018

LoadLanguageFile "${NSISDIR}\Contrib\Language files\German.nlf"

LangString Name ${LANG_GERMAN}  "Deutsch"

VIAddVersionKey /LANG=${LANG_GERMAN} "ProductName"     "${PROJECT}"
VIAddVersionKey /LANG=${LANG_GERMAN} "ProductVersion"  "${VERSION}"
VIAddVersionKey /LANG=${LANG_GERMAN} "FileVersion"     "${VERSION}"
VIAddVersionKey /LANG=${LANG_GERMAN} "FileDescription" "BDE Lock Installer"
VIAddVersionKey /LANG=${LANG_GERMAN} "Comments"        "Installs a context menu entry to lock unlocked Bitlocker-encrypted drives"
VIAddVersionKey /LANG=${LANG_GERMAN} "LegalCopyright"  "Public Domain"

LangString LicenseButtonText   ${LANG_GERMAN} "Ich verstehe"
LangString LicenseHeaderText   ${LANG_GERMAN} "Lizenzinformation"
LangString MsgBitlockerError   ${LANG_GERMAN} "Bitlocker-Test ist fehlgeschlagen oder Bitlocker ist nicht installiert. Soll die Installation dennoch fortgef�hrt werden?"
LangString MsgWindowsVersion   ${LANG_GERMAN} "Windows Vista oder h�her wird ben�tigt"
LangString RegContextMenuEntry ${LANG_GERMAN} "Bitlocker Laufwerk sperren"
LangString RegUninstallDispNam ${LANG_GERMAN} "Bitlocker Drive Locker - Explorer Kontextmen�eintrag"
LangString RegUninstallComment ${LANG_GERMAN} "F�gt dem Kontextmen� einen Eintrag hinzu, um entsperrte mit Bitlocker gesch�tzte Laufwerke und Partitionen zu sperren."
LangString RegUninstallReadme  ${LANG_GERMAN} "docs/Readme.de.md"

LangString UserLanguageId      ${LANG_GERMAN} ${LANG_GERMAN}
