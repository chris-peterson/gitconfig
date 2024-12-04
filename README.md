# Overview

Contains my git config settings.  I try to keep this to the minimum possible, leveraging default/recommended `git` behaviors, but also not having to remember obscure syntax or type a novel.

## `.gitconfig`
A tabbed config file, make edits with your favorite text editor.

After making any changes, `./update.sh` to take effect.

## Features

### Aliases

#### `main`

Print out the main/default branch

#### `up`

Update repository (main/default branch) and prune remotes

#### `web`

Navigate to the web UX (e.g. on GitHub/GitLab, etc)

## My Git Workflow

This is not meant to be prescriptive, this is just how _I_ use `git`.  Sharing in case others find it useful.

### Branch Early

Shift mindset to **branch early**.

About to do something (even something small)?

`git checkout -b feature_x`

It doesn't cost anything, and gives you an opportunity to catch mistakes without impacting others.

### Stay Current

Rebase often from `main` into your branch:

  `git pull -p; git rebase origin/main`

Doing this pays down your "merge debt" as you go as opposed to leaving it all for the end.

### Releasing

When you've got a branch that's ready for mainline, [sync once more from main](#stay-current), and then choose
from the following merge options:

#### Rebase Option (preferred)

Choose this option when you have discrete commits that you want to preserve
(_litmus test:_ could individual commits be reverted independently?)

```sh
git rebase origin/main
git checkout main

git merge feature_x --no-ff
git push
```

`rebase` stacks up all your changes "on top of" `main`.  Doing so:

* emphasizes your changes (as if they happened now at the HEAD of `main`)
* creates git histories that you can visualize (related commits grouped together)
* orders git history by when features were _merged_ (not when individual code fragments were written)

`no-ff` creates a commit for the merge itself so that you can easily revert the entire feature.

NOTE: If you end up in "rebasing mode" where you're having to solve conflicts (sometimes over and over again),
then it might not be worth it and you might want to `git rebase --abort` and consider [squashing](#squash-option) instead.

#### Squash Option

Choose this option if the feature is atomic (_litmus test:_ it's all or nothing - all changes have to be either applied, or reverted together).

```sh
git checkout main
git merge feature_x --squash
git commit -m "<message describing entire change set>"
git push
```

### Considerations

How the branch is shared has implications to which methods you might favor.

If you're working alone, go nuts, `git commit --amend` and `git rebase -i` to your heart's content.

If you're working with others, try to avoid `git rebase` as it mutates commits which can conflict when they `git pull`.  An exception to this is when you want to rebase from mainline, in which case, just communicate that you're doing so; that way, everyone can stand on the same footing.

Once you've shared code out for review, its best to avoid mutating history as it invalidates what has been reviewed.  When you've incorporated all the feedback, however, I like to tidy up the history with judicious commit amendments/consolidations.
