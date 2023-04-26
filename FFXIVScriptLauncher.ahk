; Copyright (c) 2023 Rassyberry
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetKeyDelay,,1

whm := "whm_keybinds.ahk"
ast := "ast_keybinds.ahk"
sch := "sch_keybinds.ahk"
sge := "sge_keybinds.ahk"
whmpvp := "whm_pvp_keybinds.ahk"
timer := "Fight_Timer.ahk"
cds := "Healer_CDs.ahk"
dots := "Healer_Dots.ahk"

whm_running := False
ast_running := False
sch_running := False
sge_running := False
whmpvp_running = False
timer_running := False
cds_running := False
dots_running := False

messages := "Ffxiv script started"

Gui, box1:New, -Caption -ToolWindow -Border
Gui, box1:Add, Text, Center vtextbox, %messages%
Gui, box1:Show, x100 y100 NoActivate

+F9::ExitApp

+F1::
if (!whm_running)
{
	Run, %whm%,,, pid1
	whm_running := True
	messages := "Whm started"
	GuiControl, box1:Text, textbox, %messages%
	GuiControl, box1:MoveDraw, textbox
	return
} else
{
	messages := "Whm stopped"
	GuiControl, box1:Text, textbox, %messages%
	GuiControl, box1:MoveDraw, textbox
	whm_running := False
	return
}
return

+F2::
if (!ast_running)
{
	Run, %ast%,,, pid1
	ast_running := True
	messages := "Ast started"
	GuiControl, box1:Text, textbox, %messages%
	GuiControl, box1:MoveDraw, textbox
	return
} else
{
	messages := "Ast stopped"
	GuiControl, box1:Text, textbox, %messages%
	GuiControl, box1:MoveDraw, textbox
	ast_running := False
	return
}
return

+F3::
if (!sch_running)
{
	Run, %sch%,,, pid1
	sch_running := True
	messages := "Sch started"
	GuiControl, box1:Text, textbox, %messages%
	GuiControl, box1:MoveDraw, textbox
	return
} else
{
	messages := "Sch stopped"
	GuiControl, box1:Text, textbox, %messages%
	GuiControl, box1:MoveDraw, textbox
	sch_running := False
	return
}
return

+F4::
if (!sge_running)
{
	Run, %sge%,,, pid1
	sge_running := True
	messages := "Sge started"
	GuiControl, box1:Text, textbox, %messages%
	GuiControl, box1:MoveDraw, textbox
	return
} else
{
	messages := "Sge stopped"
	GuiControl, box1:Text, textbox, %messages%
	GuiControl, box1:MoveDraw, textbox
	sge_running := False
	return
}
return

+F5::
if (!whmpvp_running)
{
	Run, %whmpvp%,,, pid1
	whmpvp_running := True
	messages := "Pvp started"
	GuiControl, box1:Text, textbox, %messages%
	GuiControl, box1:MoveDraw, textbox
	return
} else
{
	messages := "Pvp stopped"
	GuiControl, box1:Text, textbox, %messages%
	GuiControl, box1:MoveDraw, textbox
	whmpvp_running := False
	return
}
return

+F6::
if (!timer_running)
{
	Run, %timer%,,, pid1
	timer_running := True
	messages := "Timer started"
	GuiControl, box1:Text, textbox, %messages%
	GuiControl, box1:MoveDraw, textbox
	return
} else
{
	messages := "Timer stopped"
	GuiControl, box1:Text, textbox, %messages%
	GuiControl, box1:MoveDraw, textbox
	timer_running := False
	return
}
return

+F7::
if (!cds_running)
{
	Run, %cds%,,, pid1
	cds_running := True
	messages := "Cds started"
	GuiControl, box1:Text, textbox, %messages%
	GuiControl, box1:MoveDraw, textbox
	return
} else
{
	messages := "Cds stopped"
	GuiControl, box1:Text, textbox, %messages%
	GuiControl, box1:MoveDraw, textbox
	cds_running := False
	return
}
return

+F8::
if (!dots_running)
{
	Run, %dots%,,, pid1
	dots_running := True
	messages := "Dots started"
	GuiControl, box1:Text, textbox, %messages%
	GuiControl, box1:MoveDraw, textbox
	return
} else
{
	messages := "Dots stopped"
	GuiControl, box1:Text, textbox, %messages%
	GuiControl, box1:MoveDraw, textbox
	dots_running := False
	return
}
return
