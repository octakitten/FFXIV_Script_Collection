; Copyright (c) 2023 Rassyberry
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetKeyDelay,,1

target_mouseover = ^7
target_nearest = ^8
assist_ally_3 = f
assist_enemy_3 = +f

~+F5::ExitApp

; mouseover keybinds
; these should default to ^7

$1::
Send, %target_mouseover%
Sleep 10
Send, 1
return

$2::
Send, %target_mouseover%
Sleep 10
Send, 2
return

$3::
Send, %target_mouseover%
Sleep 10
Send, 3
return

$4::
Send, %target_mouseover%
Sleep 10
Send, 4
return

$e::
Send, %target_mouseover%
Sleep 10
Send, e
return

$q::
Send, %target_mouseover%
Sleep 10
Send, q
return

$v::
Send, %target_mouseover%
Sleep 10
Send, v
return

$c::
Send, %target_mouseover%
Sleep 10
Send, c
return

; assist the melee keybinds
; these will auto target party member 3's target
; default keybind for these is f

$+1::
Send, %assist_ally_3%
Sleep 10
Send, +1
return

$+2::
Send, %assist_ally_3%
Sleep 10
Send, +2
return

$+3::
Send, %assist_ally_3%
Sleep 10
Send, +3
return

$+4::
Send, %assist_ally_3%
Sleep 10
Send, +4
return

$+c::
Send, %assist_ally_3%
Sleep 10
Send, +c
return

$+v::
Send, %assist_ally_3%
Sleep 10
Send, +v
return

; these keybinds target the nearest enemy automatically
; default keybind for these is ^8

$^1::
Send, %target_nearest%
Sleep 10
Send, 1
return

$^2::
Send, %target_nearest%
Sleep 10
Send, 2
return

$^3::
Send, %target_nearest%
Sleep 10
Send, 3
return

$^4::
Send, %target_nearest%
Sleep 10
Send, 4
return

; these keybinds take the enemy melee's target as their target
; so whoever enemy 3 is, these will target their target
; default keybind for these is +f

$+e::
Send, %assist_enemy_3%
Sleep 10
Send, +e
return

$+q::
Send, %assist_enemy_3%
Sleep 10
Send, +q
return
