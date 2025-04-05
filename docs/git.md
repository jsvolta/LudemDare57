# Git

## Requirements

- [Git](https://git-scm.com/)
- [Git LFS](https://git-lfs.com/)
- [Github Account](https://github.com/)
- [Godot Git Plugin](https://github.com/godotengine/godot-git-plugin/wiki/Git-plugin-v3)

## Configuring Git

```shell
git config --global user.name "Your Name"
git config --global user.email "Your_Email"
git config --global init.defaultBranch main
git lfs install
```

Use your github email [explanation](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-personal-account-on-github/managing-email-preferences/setting-your-commit-email-address)
Optionally: set the local git config to always rebase on pull

## Workflow

### Only use main

I don't want to deal with branching.

### Oh No! There are changes on the repo but I have local changes.

Don't stress. Commit your changes, then:

```shell
git pull --rebase
```

This will pull the changes and then play your changes over that as the new base. You are responsible for any conflicts your changes cause. **DO NOT COMMIT CONFLICTS**

### Oops! I commited the wrong message or made a type

Well let me introduce you to this amazing command

```shell
git commit --amend -m "New message"
```

This command can also be used to add file your forgot to commit or make a quick fix that should've been in the last commit
