#Requires AutoHotkey v2.0

#c:: ; Hotkey Win + C to convert path to Windows or Unix
{
    ClipWait(0.5)

    ; Convert anything to plain text	
    A_Clipboard := A_Clipboard

    if InStr(A_Clipboard, "\")
    {
        A_Clipboard := StrReplace(A_Clipboard, "\", "/")
    }
    else
    {
        A_Clipboard := StrReplace(A_Clipboard, "/", "\")
    }
}
