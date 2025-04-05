# Style Guide

Reference this [link](https://docs.godotengine.org/en/stable/tutorials/best_practices/project_organization.html)

## Naming Convention

- snake_case for folder and file names (with the exception of C# scripts)
  - C# scripts are named after the class name which should be in PascalCase
- PascalCase for node names, as this matches built-in node casing.

## Folder Structure

- res://
  - addons
    - third-party resources (plugins, asset packs, etc.)
  - assets
    - custom assets (sprites, music, etc.)
  - docs
    - guides and resources like the one you are reading
  - scenes
    - .tscn files
  - scripts
    - gdscript or c# files
