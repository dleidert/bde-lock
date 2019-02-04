LoadLanguageFile "${NSISDIR}\Contrib\Language files\English.nlf"
LoadLanguageFile "${NSISDIR}\Contrib\Language files\German.nlf"

LangString Name ${LANG_ENGLISH} "English"
LangString Name ${LANG_GERMAN}  "Deutsch"

#Name $(NAME)

!include "locale\en.nsh"
!include "locale\de.nsh"
