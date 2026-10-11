# Updating a Formula

Bumping a version is two jobs, not one: the formula has to point at the new
release, and the bottles have to be rebuilt to match it. Doing only the first is
worse than doing neither, for the reason in
[Bottles](#bottles-and-why-you-cannot-skip-them) below.

## Bumping

With Homebrew installed, the whole job is two commands:

```bash
brew bump-formula-pr --url=<new sdist url> magmacrunchmedia/tap/<formula>
brew update-python-resources magmacrunchmedia/tap/<formula>
```

`update-python-resources` re-resolves the dependency tree and rewrites every
`resource` block with a fresh URL and `sha256`. Run it on the same Python the
formula declares. Resolving on an older interpreter pulls in dependencies that
are gated behind `python_version <` markers and do not belong in the build; see
the `typing-extensions` note under [The Formulas](The-Formulas).

Doing it by hand is fine too, as long as every `sha256` is taken from the
artifact rather than from a changelog. The sdist URL and its digest are both in
`https://pypi.org/pypi/<package>/<version>/json`.

## Bottles, and why you cannot skip them

A `bottle do` block pins a `root_url` to a specific release tag. Homebrew trusts
it: if a bottle is listed for your platform, it installs that binary and never
looks at `url`.

So a formula whose `url` says 0.1.2 while its bottle block still points at the
0.1.1 release will hand out the 0.1.1 binary and label it 0.1.2. That is a
silent wrong install, and it is strictly worse than shipping no bottle at all.
When you bump a version, the bottle block is either rebuilt or removed in the
same change.

## The pipeline

Two workflows do this, and they are meant to be used together:

**`brew test-bot`** (`tests.yml`) runs on every pull request and on pushes to
`main`. On a pull request it builds and tests each changed formula on macOS and
Linux, then uploads the resulting bottles as run artifacts. On a push to `main`
it only checks tap syntax, because there is no pull request to bottle.

**`brew pr-pull`** (`publish.yml`) is manual, and takes a pull request number.
It downloads that run's bottle artifacts, uploads them to a GitHub release
tagged `<formula>-<version>`, rewrites the formula's `bottle do` block to match,
and pushes the result to `main`.

The consequence is the part people get wrong: **merge version bumps with
`brew pr-pull`, not with the merge button.** The green button merges the formula
without ever attaching the bottles that were built for it.

1. Open a pull request with the bump. Remove any stale `bottle do` block.
2. Wait for `brew test-bot` to pass on both platforms.
3. Actions tab, *brew pr-pull*, *Run workflow*, and give it the pull request
   number.

## A green run is not a passing test

`brew test-bot` treats a failing `brew test` as a **soft** failure. The run goes
green, the check goes green, and near the end of the log it says:

```
Warning: 2 failed steps ignored!
brew test --verbose magmacrunchmedia/tap/magmascript
brew test --verbose magmacrunchmedia/tap/texastoast
```

The formula is then dropped from the bottle set, so a broken test quietly costs
you bottles on that formula and nothing else complains. Both `magmascript` and
`texastoast` sat like that for a while, which is why `magmacrunch` was the only
formula in the tap that had ever been bottled.

Two ways to catch it, and the second is the reliable one:

```bash
gh run view <run-id> --log | grep -E "failed steps ignored|Skipped or failed formulae" -A5
gh run download <run-id> --dir bottles && find bottles -name '*.bottle.tar.gz'
```

If a formula you changed has no bottle in the artifacts, its test failed. Check
that before dispatching pr-pull, not after.

## House rules

`AGENTS.md` in the repository root: **no AI attribution.** No
`Co-Authored-By: Claude`, no "Generated with", no equivalent trailer, on commits,
pull request bodies or release notes. Tooling that adds one by default gets the
line stripped before the commit lands.

## If CI does not start

Workflow runs will not trigger on a repository whose workflow files arrived
through a bulk mirror push, which is what happens if the tap is ever deleted and
restored. The workflows show as `active` and the runs never appear.

Toggling Actions off and back on clears it:

```bash
gh api -X PUT repos/magmacrunchmedia/homebrew-tap/actions/permissions -F enabled=false
gh api -X PUT repos/magmacrunchmedia/homebrew-tap/actions/permissions -F enabled=true -f allowed_actions=all
```

Then push a commit, because the toggle does not retroactively run anything that
was skipped while it was stuck.
