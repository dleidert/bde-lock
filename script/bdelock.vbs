' Created by: Shawn Brink
' http://www.eightforums.com
' Tutorial: http://www.eightforums.com/tutorials/21325-lock-drive-add-context-menu-bitlocker-drives.html
'
' Adapted and extended by Daniel Leidert

Drive = ""
If Wscript.Arguments.Count <= 0 Then
  MsgBox "BitLocker Drive Locker error: No argument was given to the bdelock.vbs script.", VBOKOnly, "Error 2"
  Wscript.Quit 2
End If
Last = Wscript.Arguments.Count - 1
For n = 0 To Last
  Drive = Drive & " " & Wscript.Arguments.Item(n)
Next
Drive = Replace(Drive,":\",":")
set Obj = CreateObject("Shell.Application")
RetVal = Obj.ShellExecute("manage-bde.exe", "-lock -forcedismount " & Drive, "", "runas", 0)
' Wscript.Echo "Locked " & Drive
Wscript.Quit RetVal
