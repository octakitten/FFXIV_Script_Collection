#Requires AutoHotkey v2-b+
#SingleInstance
SetWorkingDir(A_ScriptDir)
#Include keybinds.ahk
#Warn

; Start by setting up a gui that will guide the user on 
; picking which keybinds to use from the available ones in the
; config folder

kbs := keybinds()

keybinds_box_list := []
Loop Files, "config\*.txt"
{
    keybinds_box_list.Push(A_LoopFileName)
    MsgBox(keybinds_box_list.Length)    
}


KBChooser := Gui("+AlwaysOnTop +ToolWindow +E0x00000000", "Keybind Chooser")
KBChooser_Text := KBChooser.Add("Text", "x10 y10 w200 h20", "Select your keybinds")
KBChooser_Keybinds := KBChooser.Add("ListBox", "x10 y40 w200 h200", keybinds_box_list)
KBChooser_OK := KBChooser.Add("Button", "x10 y250 w200 h20", "OK")

KBChooser.OnEvent("Click", KBChooser_click_ok())

KBChooser_click_ok() {
    kbs.switch_config(KBChooser_Keybinds.Text)
}
; Gui, KBChooser:Add, Text, x10 y10 w200 h20, "Select your keybinds"
; Gui, KBChooser:Add, ListBox, x10 y40 w200 h200 vKeybinds
; Gui, KBChooser:Add, Button, x10 y250 w200 h20, OK

; Load the filenames from the config folder
; and add them to the listbox


KBChooser.Show("w250 h300")

; Once the user selects a keybinds file from the list, we use keybinds.ahk
; to load that config file


; KBChooser_OK() {

; }
; Gui, KBChooser:Hide
; name := Keybinds
; name := StrReplace(name, A_ScriptDir . "\config\", "")
; name := StrReplace(name, ".txt", "")
; kbs.switch_config(Keybinds)
; return