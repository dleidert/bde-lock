# Author: Daniel Leidert, 2018

LoadLanguageFile "${NSISDIR}\Contrib\Language files\German.nlf"

LangString Name ${LANG_GERMAN}  "Deutsch"

VIAddVersionKey /LANG=${LANG_GERMAN} "ProductName"     "${PROJECT}"
VIAddVersionKey /LANG=${LANG_GERMAN} "ProductVersion"  "${VERSION}"
VIAddVersionKey /LANG=${LANG_GERMAN} "FileVersion"     "${VERSION}"
VIAddVersionKey /LANG=${LANG_GERMAN} "FileDescription" "BDE Lock Installer"
VIAddVersionKey /LANG=${LANG_GERMAN} "Comments"        "Installs a context menu entry to lock unlocked BitLocker-encrypted drives"
VIAddVersionKey /LANG=${LANG_GERMAN} "LegalCopyright"  "${LEGALNOTE}"

LangString LicenseButtonText   ${LANG_GERMAN} "Ich verstehe"
LangString LicenseHeaderText   ${LANG_GERMAN} "Lizenzinformation"
LangString MsgBitlockerError   ${LANG_GERMAN} "BitLocker-Test ist fehlgeschlagen oder BitLocker ist nicht installiert. Soll die Installation dennoch fortgeführt werden?"
LangString MsgWindowsVersion   ${LANG_GERMAN} "Windows Vista oder höher wird benötigt"
LangString RegContextMenuEntry ${LANG_GERMAN} "BitLocker Laufwerk sperren"
LangString RegUninstallDispNam ${LANG_GERMAN} "BitLocker Drive Locker - Explorer Kontextmenüeintrag"
LangString RegUninstallComment ${LANG_GERMAN} "Fügt dem Kontextmenü einen Eintrag hinzu, um entsperrte mit BitLocker geschützte Laufwerke und Partitionen zu sperren."
LangString RegUninstallReadme  ${LANG_GERMAN} "docs/Readme.de.md"

LangString UserLanguageId      ${LANG_GERMAN} ${LANG_GERMAN}
