; Bedrock Sprint
; By Shock59

#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

Loop, Read, .\sprintConfig.txt
{
    switch A_Index
    {
        Case 1:
            ToggleSprintEnabled = %A_LoopReadLine%
        Case 2:
            MinecraftSprintKey =  %A_LoopReadLine%
        Case 3:
            ToggleSprintKey =     %A_LoopReadLine%
        Case 4:
            ToggleCrouchEnabled = %A_LoopReadLine%
        Case 5:
            MinecraftCrouchKey =  %A_LoopReadLine%
        Case 6:
            ToggleCrouchKey =     %A_LoopReadLine%
        Case 7:
            ToggleSuspendKey =     %A_LoopReadLine%
        Case 8:
            FontFamily =          %A_LoopReadLine%
        Case 9:
            WindowX =             %A_LoopReadLine%
        Case 10:
            WindowY =             %A_LoopReadLine%
    }
    
}

global Sprinting = "false"
global Crouching = "false"
global Suspended = "false"

if (ToggleSprintEnabled = "true")
{
    HotKey, %ToggleSprintKey%, ToggleSprint
}
if (ToggleCrouchEnabled = "true")
{
    HotKey, %ToggleCrouchKey%, ToggleCrouch
}
HotKey, %ToggleSuspendKey%, ToggleSuspend

if (ToggleSprintEnabled = "true" And ToggleCrouchEnabled = "true") {
    GuiHeight = 40
} else {
    GuiHeight = 20
}

Gui, Font, s20, %FontFamily%
Gui, Margin, 0, 0
Gui, Add, Text, cWhite vSprintIndicator w200 x0 y0,
Gui, Add, Text, cWhite vCrouchIndicator w200 x0 y40,
Gui, Color, 0x000000
Gui, Show, w200 h%GuiHeight% x%WindowX% y%WindowY%
Gui, +alwaysontop -caption

Return

ToggleSprint:
    if (Sprinting = "false") {
        global Sprinting = "true"
        GuiControl,, SprintIndicator, Sprinting
    } else {
        global Sprinting = "false"
        GuiControl,, SprintIndicator, 
    }
Return

ToggleCrouch:
    if (Crouching = "false") {
        global Crouching = "true"
        GuiControl,, CrouchIndicator, Crouching
    } else {
        global Crouching = "false"
        GuiControl,, CrouchIndicator, 
    }
Return

ToggleSuspend:
    Suspend, Toggle
    if (Suspended = "false") {
        global Suspended = "true"
        GuiControl,, SprintIndicator, Suspended
    } else {
        global Suspended = "false"
        if (Sprinting = "true") {
            GuiControl,, SprintIndicator, Sprinting
        } else {
            GuiControl,, SprintIndicator, 
        }
    }
    
    Return

*w::
    if (Sprinting = "true") {
        Send, {%MinecraftSprintKey% down}
    }
    if (Crouching = "true") {
        Send, {%MinecraftCrouchKey% down}
    }

    Send, {w down}
    KeyWait, w
    
    if (Sprinting = "true") {
        Send, {%MinecraftSprintKey% up}
    }
    if (Crouching = "true") {
        Send, {%MinecraftCrouchKey% up}
    }

    Send, {w up}
Return

GuiClose:
exitapp
Return