# <img src="favicon.svg" alt="gitconfig" width="64" height="64" style="vertical-align: middle"> gitconfig

A small set of `git` settings and aliases: lean on git's own defaults and
recommended behaviors, without having to remember obscure syntax or type a
novel.

The [workflow](/workflow) page covers the branching and merging habits these
settings are shaped around.

## Install

Clone the repo, then:

```bash
./update.sh
```

That copies `.gitconfig` and `.gitconfig-public` into `$HOME`, and
`.gitignore-global` to `~/.config/git/ignore`,
[where `git` looks for global ignore patterns](https://git-scm.com/docs/gitignore).
Git reads those deployed copies, so run `./update.sh` again after every edit.

## Settings

`.gitconfig` is a tab-indented config file, editable with any text editor.

| Setting | Effect |
| --- | --- |
| [`user.useConfigOnly`](https://git-scm.com/docs/git-config#Documentation/git-config.txt-useruseConfigOnly) `= true` | A repository with no configured email refuses to commit, rather than guessing an address from your username and hostname. |
| [`init.defaultBranch`](https://git-scm.com/docs/git-config#Documentation/git-config.txt-initdefaultBranch) `= main` | New repositories start on `main`. |
| [`core.autocrlf`](https://git-scm.com/docs/git-config#Documentation/git-config.txt-coreautocrlf) `= input` | CRLF becomes LF on commit; checkouts are left as stored. |
| [`push.autoSetupRemote`](https://git-scm.com/docs/git-config#Documentation/git-config.txt-pushautoSetupRemote) `= true` | `git push` on a new branch sets its upstream itself. |
| [`pull.rebase`](https://git-scm.com/docs/git-config#Documentation/git-config.txt-pullrebase) `= true` | `git pull` replays your local commits on top of the fetched branch. |
| [`rebase.autoStash`](https://git-scm.com/docs/git-config#Documentation/git-config.txt-rebaseautoStash) `= true` | A rebase stashes uncommitted work first and restores it after. |
| [`diff.tool`](https://git-scm.com/docs/git-config#Documentation/git-config.txt-difftool) / [`merge.tool`](https://git-scm.com/docs/git-config#Documentation/git-config.txt-mergetool) `= kdiff3` | `git difftool` and `git mergetool` open kdiff3. |
| [`mergetool.keepBackup`](https://git-scm.com/docs/git-config#Documentation/git-config.txt-mergetoolkeepBackup) `= false` | Resolving a conflict leaves no `.orig` file behind. |

Commits in a repository whose `origin` is on GitHub or GitLab use the email
address from `.gitconfig-public`, selected by an `includeIf` condition on the
remote URL. [Multiple Contexts](/contexts) covers that pattern and how to
extend it to another forge.

## Global ignore patterns

`.gitignore-global` holds the editor and tool droppings that would otherwise
be repeated in every project's `.gitignore`: macOS Finder metadata, agent
scratch directories, Python bytecode caches.

## Aliases

### `main`

Print the main/default branch, as reported by `origin`.

```bash
git main
```

### `up`

Update the main/default branch, prune deleted remote branches, and switch back
to the branch you were on.

```bash
git up
```

### `web`

Open the repository's web UX (GitHub, GitLab, and anything else whose remote
URL maps to its site) in the browser, via macOS `open`.

```bash
git web
```
