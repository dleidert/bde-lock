' Created by: Shawn Brink
' http://www.eightforums.com
' Tutorial: http://www.eightforums.com/tutorials/21325-lock-drive-add-context-menu-bitlocker-drives.html

Drive = ""
Last = Wscript.Arguments.Count - 1
For n = 0 To Last
 Drive = Drive & " " & Wscript.Arguments.Item(n)
Next
Drive = Replace(Drive,":\",":")
CreateObject("Shell.Application").ShellExecute "manage-bde.exe", "-lock -forcedismount " & Drive, "", "runas", 0

'Wscript.Echo "Locked " & Drive
