; Copyright (c) 2023 Rassyberry
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetKeyDelay,,1

target_nearest = ^8
target_mouseover = ^7
target_focus = ^9
target_party_member = ^0

~+F4::ExitApp

; attack nearest enemy keybinds

$1::
Send, %target_nearest%
Sleep 10
Send, 1
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

$c::
Send, %target_nearest%
Sleep 10
Send, c
return

; mouseover macro keybinds

$2::
Send, %target_mouseover%
Sleep 10
Send, 2
return

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

$q::
Send, %target_mouseover%
Sleep 10
Send, q
return

$r::
Send, %target_mouseover%
Sleep 10
Send, r
return

$+r::
Send, %target_mouseover%
Sleep 10
Send, +r
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

; auto use an ability on my focus target here

$^q::
Send, %target_focus%
Sleep 100
Send, ^q
return

; use dash on a specific party member here

$+q::
Send, %target_party_member%
Sleep 100
Send, +q
return
