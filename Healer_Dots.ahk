; Copyright (c) 2023 Rassyberry
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetKeyDelay,,1


file = media/dot_warning_small.jpg
color = FFFFFF
Gui, dot_down:New, +AlwaysOnTop -Caption -ToolWindow -Border
Gui, dot_down:Add, Picture,, %file%
threads_running := 0

; keybind to remove the image this script shows when you otherwise arent going to use it
^,::
Gui, dot_down:Cancel
return

~+F8::ExitApp

; keybind to count down the timer of a healer's DOT effect and then show an image to indicate that the DOT has fallen off after its over

#MaxThreadsPerHotkey 100
~2::
threads_running += 1
thread_number := threads_running
start_time := A_TickCount
current_time := 0
Gui, dot_down:Cancel

while (current_time < 30000)
{
	Sleep, 250
	current_time := (A_TickCount - start_time)
	display_time := Floor(current_time / 1000)
}

if (thread_number = threads_running)
{
	Gui, dot_down:Show, x620 y500 NoActivate
}
return