# gitconfig

My `git` configuration, deployed into `$HOME` by `update.sh`.

What the settings and aliases do, and the workflow they support, is on the docs
site: <https://chris-peterson.github.io/gitconfig/>. This file is for
maintaining the repo.

## Layout

| Path | Deployed to | Holds |
| --- | --- | --- |
| `.gitconfig` | `~/.gitconfig` | settings and aliases |
| `.gitconfig-public` | `~/.gitconfig-public` | the email address used on public forges |
| `.gitignore-global` | `~/.config/git/ignore` | ignore patterns for every repository |
| `update.sh` | | copies the three files above into place (`just install`) |
| `docs/` | GitHub Pages | the docs site (`just docs` serves it locally) |

## Applying a change

Edit the file (`.gitconfig` is tab-indented), then:

```sh
./update.sh
```

Each target is moved aside to `<name>.old` before the copy, so one generation
of the previous version survives. Read back what `git` resolves to:

```sh
git config --list --show-origin
```

## Public identity

`.gitconfig` sets `user.name` for every repository and pulls `user.email` from
`.gitconfig-public` through four `includeIf` conditions: github.com and
gitlab.com, each over https and ssh. The pattern, and the behavior of a
repository that matches none of them, is on the
[Multiple Contexts](https://chris-peterson.github.io/gitconfig/#/contexts) page.

`user.useConfigOnly` is on, so a repository matching none of them refuses to
commit rather than building an address out of your username and the machine's
hostname. A repository with no remote does too, which is worth knowing before
the first commit in a scratch repo.

Adding a forge takes both URL shapes, since `hasconfig` matches the remote URL
as written:

```ini
[includeIf "hasconfig:remote.*.url:https://example.com/**"]
	path = ~/.gitconfig-public
[includeIf "hasconfig:remote.*.url:git@example.com:*/**"]
	path = ~/.gitconfig-public
```

## Docs site

`docs/` is a [Docsify](https://docsify.js.org) site, which renders the markdown
in the browser instead of building it.

| File | Role |
| --- | --- |
| `docs/README.md` | home page |
| `docs/<name>.md` | one page per route, reached as `#/<name>` |
| `docs/_sidebar.md` | the nav; a new page needs an entry here |
| `docs/index.html` | loads the shared docsify bootstrap from `chris-peterson.github.io/js` and declares the project name, its code languages, and its plugins |

Preview it on <http://localhost:3000> with:

```sh
just docs
```

The shared bootstrap treats a loopback origin as the hub itself, so it looks for
the hub's theme CSS and `projects.yml` on the local server and the preview comes
up unstyled. Content, links, sidebar, and mermaid all render; the site chrome is
what's missing.

`.github/workflows/docs.yml` publishes `docs/` to GitHub Pages on pushes to
`main` that touch `docs/**`.
