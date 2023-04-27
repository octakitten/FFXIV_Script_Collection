; Copyright (c) 2023 Rassyberry
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetKeyDelay,,1

; keybinds for doing different things with these macros
; change these to your preferred keybinds for each action in-game

target_nearest = ^8
target_mouseover = ^7
target_m1 = +7
target_m2 = +8
target_r1 = +9
target_r2 = +0


~+F2::ExitApp

; Offensive spells, target these at nearest enemy
; uses ^8 keybind for that

$1::
Send, %target_nearest%
Sleep 10
Send, 1
return

$2::
Send, %target_nearest%
Sleep 10
Send, 2
return

$3::
Send, %target_nearest%
Sleep 10
Send, 3
return

$4::
Send, %target_nearest%
Sleep 10
Send, 4
return

$5::
Send, %target_nearest%
Sleep 10
Send, 5
return

$b::
Send, %target_nearest%
Sleep 10
Send, b
return

; mouseover spells, use these at the mouseover target
; default keybind for that is ^7

$+1::
Send, %target_mouseover%
Sleep 10
Send, +1
return

$+2::
Send, %target_mouseover%
Sleep 10
Send, +2
return

$+3::
Send, %target_mouseover%
Sleep 10
Send, +3
return

$+4::
Send, %target_mouseover%
Sleep 10
Send, +4
return

$+5::
Send, %target_mouseover%
Sleep 10
Send, +5
return

$+6::
Send, %target_mouseover%
Sleep 10
Send, +6
return

$f::
Send, %target_mouseover%
Sleep 10
Send, f
return

$+f::
Send, %target_mouseover%
Sleep 10
Send, +f
return

$v::
Send, %target_mouseover%
Sleep 10
Send, v
return

$t::
Send, %target_mouseover%
Sleep 10
Send, t
return

$+c::
Send, %target_mouseover%
Sleep 10
Send, +c
return

$e::
Send, %target_mouseover%
Sleep 10
Send, e
return

; card target macros
; these are keybinds set up to auto target ast cards onto
; a specific party member
; they use a different keybind for each party member so be careful when assigning these

$+e::
Send, %target_m1%
Sleep 10
Send, e
return

$^e::
Send, %target_m2%
Sleep 10
Send, e
return

$+r::
Send, %target_r1%
Sleep 10
Send, e
return

$^r::
Send, %target_r2%
Sleep 10
Send, e
return
