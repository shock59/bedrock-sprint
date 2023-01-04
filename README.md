# Bedrock Sprint

This is a simple [AutoHotkey](https://www.autohotkey.com/ "AutoHotkey") script which adds basic toggle sprint and toggle crouch functionality to Minecraft Bedrock Edition on Windows PCs. It works by emulating keystrokes so it does not require injecting anything into the game itself, You can also download it as an exe file to run without AutoHotkey installed.

## Features

- Toggle sprint and crouch functionality (either can be turned on or off)
- Customisable sprinting indicator

## Limitations

- Only works in windowed mode
- Messes with typing in every other application (can be avoided using the suspend keybind)

## Installation

Download the BedrockSprint.zip file from the [releases](https://github.com/shock59/bedrock-sprint/releases) page. Extract it and make  the files are contained in their own folder (i.e. don't run the script in another folder such as Downloads or Desktop).

## Usage & Configuration

Run the `BedrockSprint.exe` file. By default, only toggle sprint is enabled. It expects your Minecraft sprint key (the key set to sprint inside of Minecraft itself) to be Alt and uses Control to toggle sprinting. You can press F8 to suspend the application so that it won't interrupt regular typing.

You can change these settings in the `sprintConfig.txt` file. The format for the file should be like this:

```
Enable toggle sprint ("true" or "false")
Minecraft sprint key (e.g. "Control", "k", "F8")
Toggle sprint key
Enable toggle crouch
Minecraft crouch key
Toggle crouch key
Suspend key
Indicator font (e.g. "Arial", "Segoe UI")
X coordinate of indicator window ("0" is the left edge)
Y coordinate of indicator window ("0" is the top edge)
```

If you have disabled either toggle sprint or crouch the game will use the regular keybinds no matter what is set in the config.