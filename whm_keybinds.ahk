; Copyright (c) 2023 Rassyberry
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetKeyDelay,,1

global target_nearest := "^8"
global target_mouseover := "^7"

; ======== White Mage keybinds ========

; Attack keybinds
global glare := "1"
global dia := "2"
global afflatus_misery := "4"
global presence_of_mind := "5"

; Mouseover keybinds
global regen := "3"
global cure1 := "+1"
global cure2 := "+2"
global cure3 := "+3"
global tetragrammaton := "+4"
global divine_benison := "+5"
global afflatus_solace := "+e"
global aquaveil := "r"
global benediction := "+c"
global raise := "v"
global rescue := "f"
global esuna := "+f"

    #UseHook True
    Hotkey %glare%, glarefn
    Hotkey %dia%, diafn
    Hotkey %afflatus_misery%, afflatus_miseryfn
    Hotkey %presence_of_mind%, presence_of_mindfn

    Hotkey %regen%, regenfn
    Hotkey %cure1%, cure1fn
    Hotkey %cure2%, cure2fn
    Hotkey %cure3%, cure3fn
    Hotkey %tetragrammaton%, tetragrammatonfn
    Hotkey %divine_benison%, divine_benisonfn
    Hotkey %afflatus_solace%, afflatus_solacefn
    Hotkey %aquaveil%, aquaveilfn
    Hotkey %benediction%, benedictionfn
    Hotkey %raise%, raisefn
    Hotkey %rescue%, rescuefn
    Hotkey %esuna%, esunafn
    #UseHook False


~+F1::ExitApp

; attack macros go here
; default keybind is ^8

glarefn() {
    Send, %target_nearest%
    Sleep 10
    Send, %glare%
    return
}

diafn() {
    Send, %target_nearest%
    Sleep 10
    Send, %dia%
    return
}

afflatus_miseryfn() {
    Send, %target_nearest%
    Sleep 10
    Send, %afflatus_misery%
    return
}

presence_of_mindfn() {
    Send, %target_nearest%
    Sleep 10
    Send, %presence_of_mind%
    return
}

regenfn() {
    Send, %target_mouseover%
    Sleep 10
    Send, %regen%
    return
}

cure1fn() {
    Send, %target_mouseover%
    Sleep 10
    Send, %cure1%
    return
}

cure2fn() {
    Send, %target_mouseover%
    Sleep 10
    Send, %cure2%
    return
}

cure3fn() {
    Send, %target_mouseover%
    Sleep 10
    Send, %cure3%
    return
}

tetragrammatonfn() {
    Send, %target_mouseover%
    Sleep 10
    Send, %tetragrammaton%
    return
}

divine_benisonfn() {
    Send, %target_mouseover%
    Sleep 10
    Send, %divine_benison%
    return
}

afflatus_solacefn() {
    Send, %target_mouseover%
    Sleep 10
    Send, %afflatus_solace%
    return
}

aquaveilfn() {
    Send, %target_mouseover%
    Sleep 10
    Send, %aquaveil%
    return
}

benedictionfn() {
    Send, %target_mouseover%
    Sleep 10
    Send, %benediction%
    return
}

raisefn() {
    Send, %target_mouseover%
    Sleep 10
    Send, %raise%
    return
}

rescuefn() {
    Send, %target_mouseover%
    Sleep 10
    Send, %rescue%
    return
}

esunafn() {
    Send, %target_mouseover%
    Sleep 10
    Send, %glare%
    return
}
