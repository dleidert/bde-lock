' https://github.com/dleidert/bde-lock

If Wscript.Arguments.Count <= 0 Then
  MsgBox "BitLocker Drive Locker error: No argument was given to the bdelock.vbs script.", VBOKOnly, "Error 2"
  Wscript.Quit 2
End If
Drive = ""
Last = Wscript.Arguments.Count - 1
For n = 0 To Last
  Drive = Drive & " " & Wscript.Arguments.Item(n)
Next
Drive = Replace(Drive, ":\", ":")
set Obj = CreateObject("Shell.Application")
RetVal = Obj.ShellExecute("manage-bde.exe", "-lock -forcedismount " & Drive, "", "runas", 0)
' I'd love to have something like this:
'If RetVal <> 0 Then
'  Wscript.Echo "Error " & RetVal & " returned by wscript.exe or manage-bde.exe trying to lock drive " & Drive & "."
'End If
Wscript.Quit RetVal
