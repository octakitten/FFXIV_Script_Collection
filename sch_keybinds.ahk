; Copyright (c) 2023 Rassyberry
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetKeyDelay,,1

target_assist = ^9
target_nearest = ^8
target_mouseover = ^7

~+F3::ExitApp

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

$t::
Send, %target_mouseover%
Sleep 10
Send, t
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

$+c::
Send, %target_mouseover%
Sleep 10
Send, +c
return

$b::
Send, %target_nearest%
Sleep 10
Send, b
return

$+b::
Send, %target_nearest%
Sleep 10
Send, +b
return

$^b::
Send, %target_nearest%
Sleep 10
Send, ^b
return


