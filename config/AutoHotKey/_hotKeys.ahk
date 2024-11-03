#SingleInstance force

#n::
EnvGet, userName, USERNAME
FormatTime, YearWeek, L0x0409, YWeek
FormatTime, WeekDay, L0x0409, WDay
YearWeek := SubStr(YearWeek, 5)
FormatTime, CurrentYearAndTime, L0x0409, yyyy___-HH:mm
MyDateString := StrReplace(CurrentYearAndTime, "___", "CW" . YearWeek . "." . (WeekDay-1))
SendInput %MyDateString% (%userName%)
return

#c::
ClipWait
If InStr(Clipboard, "/")
   StringReplace, Clipboard, Clipboard, /, \, A
Else
   StringReplace, Clipboard, Clipboard, \, /, A
return

#b::
Send, !{space}
Sleep 100
Send, Switch{tab}
return

SC122::
Send ^+m
return

