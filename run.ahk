#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
#NoEnv
#Include keybinds.ahk
#Persistent
#Warn

; Start by setting up a gui that will guide the user on 
; picking which keybinds to use from the available ones in the
; config folder
kbs := new keybinds
Gui, KBChooser:New, +AlwaysOnTop +ToolWindow +E0x00000000
Gui, KBChooser:Add, Text, x10 y10 w200 h20, "Select your keybinds"
Gui, KBChooser:Add, ListBox, x10 y40 w200 h200 vKeybinds
Gui, KBChooser:Add, Button, x10 y250 w200 h20, OK

; Load the filenames from the config folder
; and add them to the listbox

Loop, Files, %A_ScriptDir%\config\*.txt
{
    GuiControl, KBChooser:Text, Keybinds, %A_LoopField%
}

Gui, KBChooser:Show, w250 h300, Keybinds Chooser

; Once the user selects a keybinds file from the list, we use keybinds.ahk
; to load that config file
return

KBChooser_OK:
Gui, KBChooser:Hide
name := ""
GuiControlGet, name,,  Keybinds
name := StrReplace(name, A_ScriptDir . "\config\", "")
name := StrReplace(name, ".txt", "")
kbs.switch_config(Keybinds)
return