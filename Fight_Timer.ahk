; Copyright (c) 2023 Rassyberry
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetKeyDelay,,1

Gui, fight_time:New, +AlwaysOnTop -Caption -ToolWindow -Border
Gui, fight_time:Font, s24, Calibri
Gui, fight_time:Add, Text, r1 w50 vTime, 0
Gui, fight_time:Show, x100 y100 NoActivate

pause_timer := False

; keybind to start the timer. this will simply run a stopwatch from 0. it counts in seconds and will reset when they keybind is hit again.

#MaxThreadsPerHotkey 3
`::
#MaxThreadsPerHotkey, 1
start_time := A_TickCount
current_time := 0
if (running)
{
	running := False
	return
}
running := True
while (current_time < 600000)
{
	Sleep, 250
	current_time := (A_TickCount - start_time)
	display_time := Floor(current_time / 1000)
	if (!pause_timer)
	{
		GuiControl, fight_time:Text, Time, %display_time%
		GuiControl, fight_time:MoveDraw, fight_time
		Gui, fight_time:Show, x100 y100 NoActivate
	}
	if (!running)
	{
		break
	}
}
running := False
return

; pauses the stopwatch
; after restarting the stopwatch with this hotkey again, it will catch up to where it would have been
; if the stopwatch hadn't been paused

+`::
pause_timer := !pause_timer
return

; hides the ui
^,::
Gui, Cancel
return

~+F6::ExitApp
