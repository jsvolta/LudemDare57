# VSCode/Cursor Setup

## In Godot

1. `Editor > Editor Settings > Text Editor > External`
2. `Use External Editor: ON`
3. Make sure advanced settings in the top right is on
4. `Exec Path` click the file icon and navigate to code.cmd or cursor.cmd
5. `Exec Flags: {project} --goto {file}:{line}:{col}`
6. `Editor > Editor Settings > Text Editor > Behavior > Auto Reload On External Change: ON`
7. `Editor > Editor Settings > Interface > Import Resources When Unfocused: ON`
8. `Editor > Editor Settings > Interface > Save On Lost Focus: ON`

## In VSCode/Cursor

1. Install the godot-tools plugin [link](https://marketplace.visualstudio.com/items?itemName=geequlim.godot-tools)
   - adds LSP and DAP support
2. Make sure the launch.json is setup in you projects .vscode folder
3. If not, go to the run/debug tab and click create launch.json (default godot debug is fine)

## Bonus: Cursor Settings

1. `Curosr Settings > Features`
2. Under the docs subsection click `Add new doc`
3. Add the following link `https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_basics.html`
4. Press enter to continue
5. Change the name to `Godot`

Now when you are talking to an AI model you can use **@Godot** to tell it to reference the godot docs.
