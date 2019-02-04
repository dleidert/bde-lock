# bde-lock
Simple installer to create a drive context menu function to lock an unlocked bitlocker encrypted drive in Windows

The installer copies a [script](script/bdelock.vbs) to the programs folder and creates the registry key (including sub-keys) in "HKCR/Drive/shell/lock-bde". The latter basically adds the context menu entry if you right-click on an unlocked drive. For the lock function to work, the Windows program [manage-bde.exe](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/manage-bde) needs to be called with elevated rights and it needs to be given the drive letter. Because it is not possible to achieve both things by calling the program from the registry, the [(short) script](script/bdelock.vbs) is necessary, which strips the trailing backslash from the drive path (e.g. D:\ becomes D:) and requests the elevated rights.

The installer is localized, supporting German and English at the moment. Adding new languages is very easy. Just copy the [english translation file](locale/en.nsh), rename it, translate the strings and everything else can be done on my side.
