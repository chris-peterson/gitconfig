# <img src="favicon.svg" alt="gitconfig" width="64" height="64" style="vertical-align: middle"> gitconfig

Git configuration settings — minimal, leveraging default/recommended `git` behaviors, but also not having to remember obscure syntax or type a novel.

## `.gitconfig`

A tabbed config file — make edits with your favorite text editor.

After making any changes, run `./update.sh` to take effect.

## Configuration

```ini
[init]
defaultBranch = main

[core]
autocrlf = input

[push]
autoSetupRemote = true

[pull]
rebase = true

[rebase]
autoStash = true

[diff]
tool = kdiff3

[merge]
tool = kdiff3

[mergetool]
keepBackup = false
```

## Aliases

### `main`

Print out the main/default branch.

```bash
git main
```

### `up`

Update repository (main/default branch) and prune remotes.

```bash
git up
```

### `web`

Navigate to the web UX (e.g. on GitHub/GitLab).

```bash
git web
```
