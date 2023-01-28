; Copyright (c) 2023 Rassyberry
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetKeyDelay,,1

; need to replace this file with something else lmao
file = media/cds_warning_small.jpeg
color = FFFFFF
Gui, cds_up:New, +AlwaysOnTop -Caption -ToolWindow -Border
Gui, cds_up:Add, Picture,, %file%
threads_running := 0

; keybind to remove the image this script shows when you otherwise arent going to use it
^,::
Gui, cds_up:Cancel
return

~+F7::ExitApp

; keybind to show an image that tells the user that their 2 minute cds are off cooldown
#MaxThreadsPerHotkey 100
~6::
threads_running += 1
thread_number := threads_running
start_time := A_TickCount
current_time := 0
Gui, cds_up:Cancel

while (current_time < 120000)
{
	Sleep, 250
	current_time := (A_TickCount - start_time)
	display_time := Floor(current_time / 1000)
}

if (thread_number = threads_running)
{
	Gui, cds_up:Show, x350 y100 NoActivate
}
return