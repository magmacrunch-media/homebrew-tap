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

<!-- shared-rules:start  Synced from magmacrunch-media/.github/agents-preamble.md. Do not edit here. -->
## House rules (shared)

Identical in every magmacrunch repo. The source is `agents-preamble.md` in the
public `.github` repo, and `agents-sync.py` in dev-tree replaces whatever sits
between these markers, so **an edit made here is reverted rather than spread.**
Change the source and re-sync. The source is public so that a drift check can
read it from any repo, including the three that are public themselves.

The sections ABOVE this block are the repo's own, and they win. Where a repo
states a different rule with a reason, that reason is the one to follow. This
block is last on purpose: a reader meets what is specific to the repo before
what is true everywhere.

### Commits

- **Commit as yourself. Any member of the `magmacrunch-media` org is correct**,
  loosened from the owner account alone on 2026-10-16. On the shared dev box
  that is `magmacrunchmedia <magmacrunchmedia@gmail.com>`, set by a `gitdir`
  conditional include, so do NOT set `user.email` in a repo there; a local value
  silently defeats it. `dev\jamccoy\` commits as Jake McCoy, by the same rule.
  `dev-tree/identity-sweep.sh` checks this by asking GitHub which account a
  commit belongs to and whether it is in the org, so there is no list of names
  to keep current and nothing to add when somebody joins.
- **No AI attribution anywhere**: not in commit messages, PR bodies, release
  notes, comments or docs. No `Co-authored-by` for a model, no generated-with
  line, no robot emoji.
- Subject lines are sentence-case and imperative, with no `feat:` or `chore:`
  prefix.
- Say what you verified and how. A commit that claims a result names the command
  or the file that produced it.

### Text

- **Write LF.** `core.autocrlf` is true on the dev box and does not normalise
  these repos on the way in, so a CRLF file stages as a whole-file rewrite that
  buries the real edit. The check is `git diff --numstat` against
  `git diff --numstat --ignore-cr-at-eol`: if they disagree, the CR is the diff.
- **Go easy on em dashes.** The objection is to them used heavily in prose, not
  to the character. CI counts them on added lines and warns; it does not block.
- Never convert the line endings of a third-party export or fixture. Those are
  pinned with `.gitattributes` on purpose.

### If this repo is checked out under `C:\magma\dev`

Several agent sessions share that one working tree and one index, so files you
never touched will already be staged, and they are somebody else's work in
flight. **Commit by pathspec**: `git commit -F <msgfile> -- <paths>`. Never
`git add -A`, `git commit -a`, `git reset --hard` or `git checkout -- .`.

A repo cloned outside that tree has one writer and none of this applies.

### Claims

**Cite the file or the command, not your reasoning.** Every wrong statement this
convention exists to prevent came from one of three things, each of which has
cost real time here:

- asserting from the shape of the code instead of reading it,
- reading a number correctly and reporting it without its denominator,
- reading back a write and believing the answer. An API can report success and
  show you nothing, or resolve an object that is attached to nothing.

So: measure, name the source, date anything that will go stale, and say plainly
what you did not check. A check that passes by finding nothing is the failure
this whole tree is organised against, which is why every checker here prints how
much it examined and fails when that comes back impossible.

### Design and intent

LLM tools are used here to free attention for design, not to skip it. The full
statement is `llm-tools.md` in the `company` repo.

- **Fun is the deliverable.** Whether something plays well, looks good and
  feels natural is the point, and that is a person's judgement. Bring
  decisions about feel, pacing, look and difficulty back to a person rather
  than settling them with a default.
- **Not a shortcut.** A smaller thing that has been tuned beats a complete one
  nobody has played. Do not trade care for speed.
- **Make our own software.** Prefer building the engine, editor or helper over
  pulling in a dependency when it shapes the work. Generated characters, art
  and levels are placeholders: the aim is our own editors, so a person can
  make and tweak them by hand.
<!-- shared-rules:end -->
