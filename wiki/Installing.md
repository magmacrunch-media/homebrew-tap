# Installing

## One-off

The fully qualified name works without tapping first. Homebrew adds the tap for
you the first time it sees one:

```bash
brew install magmacrunchmedia/tap/magmascript
```

## Tapping first

If you plan to install more than one, add the tap and then use bare names:

```bash
brew tap magmacrunchmedia/tap
brew install magmacrunch magmascript texastoast
```

Note the shorthand: the repository is named `homebrew-tap`, but Homebrew strips
the `homebrew-` prefix, so the tap is `magmacrunchmedia/tap`. Both the long and
short forms refer to the same thing.

## In a Brewfile

```ruby
tap "magmacrunchmedia/tap"

brew "magmacrunch"
brew "magmascript"
brew "texastoast"
```

Then `brew bundle` from the directory holding the file.

## Upgrading

```bash
brew update && brew upgrade magmacrunch
```

`brew update` refreshes the tap itself. Without it `brew upgrade` compares
against the formula you already have on disk and correctly concludes there is
nothing to do, which is the usual reason a new release appears not to exist.

## Pinning

To hold a formula at its current version while upgrading everything else:

```bash
brew pin magmacrunch
brew unpin magmacrunch
```

## Removing

```bash
brew uninstall magmacrunch
brew untap magmacrunchmedia/tap
```

Untapping does not uninstall anything already installed. Uninstall first if you
want the software gone as well.

## When something will not build

These are Python formulas, so almost every build failure is a resource that no
longer matches its dependency. Two things worth trying before filing anything:

```bash
brew update && brew reinstall magmacrunch   # stale local copy of the formula
brew install --verbose --debug magmacrunch  # the actual pip error, in full
```

If it still fails, open an
[issue](https://github.com/magmacrunchmedia/homebrew-tap/issues) with the output
of `brew config` and `brew doctor` alongside the failure.
