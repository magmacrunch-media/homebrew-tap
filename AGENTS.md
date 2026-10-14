# AGENTS.md -- homebrew-tap

The Homebrew tap: three formulae, `magmacrunch`, `magmascript` and
`texastoast`, each tracking its PyPI sdist. 15 tracked files.

## This repository is PUBLIC

It is one of three in the organisation that are, and it stays public because a
private tap breaks `brew install` for everybody. Consequences that bite:

- **Nothing secret goes in here**, and nothing derived from a secret.
- **Its CI must not name a self-hosted runner.** The organisation's Default
  runner group sets `allows_public_repositories = false`, so a public repo
  pointed at an org runner **queues for ever rather than failing**. Every job
  here runs on `ubuntu-latest`, deliberately, and a public repo's standard
  runner minutes are free and unlimited, so there is nothing to save.
- `wiki/` is tracked here **and** published, so those three pages are install
  documentation and nothing else.

## Public is no longer enough for `brew install` to just work

Homebrew 7.0.9 refuses to load a formula from an untrusted third-party tap,
whatever the repository's visibility. `brew trust --tap magmacrunch-media/tap`
clears it, recorded per user and per machine, so a new machine needs it again.

**The trap is the upgrade, not the install.** Measured on 7.0.9 with nothing
trusted:

| command | result |
|---|---|
| `brew install magmacrunch-media/tap/magmascript` | installs, and trusts **that one formula** |
| `brew tap ...` then `brew install magmascript` | refused |
| `brew upgrade magmascript` | refused |

Naming the tap in full is itself the signal of intent, so a first install
succeeds and the refusal arrives weeks later, naming the tap rather than the
Homebrew change that introduced the rule. `README.md` carries that table; keep
it accurate, and do not tell people to trust before an install that does not
need it, which an early draft of that README did.

**Do not write a version boundary into any of this.** 7.0.9 has the gate, and
7.0.6 was never observed installing from this tap, only reporting an
already-installed version. "If `brew trust` is an unknown command your Homebrew
predates the gate" is the safe form and is what the README says.

## A leftover `bump/` branch is dangerous to merge

`bump.yml` opens a pull request per version set. `brew pr-pull` lands the
**bottled** formula on `main` and closes the pull request **without deleting
its branch**, and that branch still holds the **unbottled** formula.

So merging a stray `bump/` branch afterwards is a diff whose entire content is
the deletion of a working bottle block, which sends every user on every
platform down a source build. Seven accumulated that way, and one had decayed
to exactly that: eight lines, all of them a bottle block going away.

`publish.yml` deletes the branch now, gated on the push having succeeded,
because until that push lands the branch is the only copy of the
bottle-bearing commit. There are none today. **Delete a stray one; never merge
it.**

## `GITHUB_TOKEN` cannot open a pull request here

`can_approve_pull_request_reviews` is false at **both** the organisation and
the repository level, and it is read at both, so Actions may not create one at
all:

```
GitHub Actions is not permitted to create or approve pull requests
```

`bump.yml` mints an installation token from the `magmacrunch-release` GitHub
App instead. That App is usually described as the cross-repo answer; this is
the other case, a repo that cannot act on itself.

**Flipping the flag is the smaller fix and the wrong one.** A pull request
opened with `GITHUB_TOKEN` starts no workflow runs, so `tests.yml` never fires,
no bottles are built, and `pr-pull` has nothing to attach: an inert pull
request needing a manual close-and-reopen every morning. The App's pull
request does trigger CI, which is demonstrated rather than reasoned: PR #9 was
authored by `app/magmacrunch-release` and `brew test-bot` ran across four
platforms on it.

That mattered for a long time. `bump.yml` had **38 runs and every one of them
red** before 2026-10-05, regenerating the formulae correctly each night and
dying at `gh pr create`, while the formulae sat releases behind PyPI. A daily
red cron nobody reads is worse than a check that passes by finding nothing.
Count them rather than trusting this paragraph:

```sh
gh run list -R magmacrunch-media/homebrew-tap --workflow bump.yml --limit 100 \
  --json conclusion --jq 'group_by(.conclusion)[]|"\(.[0].conclusion) \(length)"'
```

## The workflows

| | |
|---|---|
| `bump.yml` | points each formula at the newest sdist, regenerates resources, opens a pull request. **Nothing watches PyPI for it**: dependabot here covers `github-actions` only, so the formulae move when this runs or when somebody remembers |
| `tests.yml` | `brew test-bot` on push to `main` and on pull requests, `fail-fast: false` across the platform matrix, because a cancelled leg uploads no bottle and a formula landing without one is the source-build problem above |
| `publish.yml` | `brew pr-pull` by `workflow_dispatch` with a pull request number. **This is the route, not a laptop:** the Mac here has Homebrew but no `gh` and no `HOMEBREW_GITHUB_API_TOKEN`, and `pr-pull` needs a token to fetch bottle artifacts and push |
| `conventions.yml` | the house checks. Em dash density is counted and warned about rather than gated, which is what lets the generated formulae need no exclusion |

## Check a version claim rather than repeating one

All three formulae matched PyPI as of 2026-10-09. That will go stale, and the
failure mode is quiet: `brew install` succeeds and hands over the wrong
version. Compare the `.tar.gz` version in each `Formula/*.rb` against
`pypi.org/pypi/<name>/json`.

## House rules

Pending the shared block, which replaces this section when it is first synced
here. Until then:

- **No AI attribution anywhere**: not in commit messages, PR bodies, release
  notes, comments or docs. No `Co-authored-by` for a model, no generated-with
  line.
- Author is `magmacrunchmedia <magmacrunchmedia@gmail.com>`, set by a `gitdir`
  conditional include. Do not set `user.email` in a repo; a local value
  silently defeats it.
- Subject lines are sentence-case and imperative, with no `feat:` or `chore:`
  prefix.
- **Write LF.** A CRLF file stages as a whole-file rewrite that buries the real
  edit.
- **Say what you verified and how.** Cite the file or the command, not your
  reasoning.
