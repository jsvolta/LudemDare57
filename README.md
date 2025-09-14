# A Call from the Void

> A Ludum Dare 57 jam game built in Godot 4.4

![Cover Art](assets/itch/cover_art.png)

## Premise
Your tenth birthday arrives, and you feel the familiar sting of loneliness, a constant companion in the crowded city. All you wished for was connection, someone to understand the quiet hum in your soul. Instead, your eccentric grandmother presents you with a dusty shortwave radio and a worn, leather-bound book filled with strange symbols and codes.

## How To Play
Given the cypher book and the cue card, your goal is to translate the alien transmission into English words. Each transmission becomes progressively more difficult and different parts of the cypher book may need to be used—sometimes a single page, other times multiple in combination.

This game runs in the browser.

## Controls
- Mouse: Interact with UI elements, buttons, and the cypher book
- Keyboard: Type your decoded answer in the input field
- Submit: Press Enter or click the Submit button
- Options: Press Esc to open/close the options menu (volume, quit to menu)

## Play Online
- Itch.io: [Play in your browser](https://jaskiewm.itch.io/a-call-from-the-void)

## Run Locally (Godot)
- Requires Godot `4.4` (GL Compatibility)
- Open this folder in the Godot editor and press Run
  - Main scene: `Main.tscn` (configured via `project.godot`)

## Export for Web
An export preset for Web is included.
- In Godot: Project → Export → select preset "Call from the Void" (Web)
- Choose an export path and click Export
- Deploy the generated `index.html` and accompanying files to itch.io or a static host

## Developers
- Dylan Pithia — https://github.com/dpithia
- Jaden Christie — https://github.com/jsvolta
- Mark Jaskiewicz Dobrowlanski — https://github.com/jaskiewm

## Dev Notes
This was a submission for the Ludum Dare 57 game jam. A Call from the Void received an average 3.68 / 5 rating and placed 336th overall (top 30%).

## Tech
- Engine: Godot 4.4 (GL Compatibility)
- Target: Web (HTML5)

## Repository Structure (high level)
- `scenes/` — game scenes and UI
- `scripts/` — GDScript code
- `assets/` — sprites, audio, fonts, and itch.io art
- `export_presets.cfg` — export configuration (includes Web preset)
- `project.godot` — Godot project settings

---
If you run into issues running or exporting, ensure you’re on Godot 4.4 and that the Web export templates are installed (Editor → Manage Export Templates).
