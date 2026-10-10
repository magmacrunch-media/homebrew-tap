# magmacrunch-media tap

## How do I install these formulae?

`brew install magmacrunch-media/tap/<formula>`

That works on its own. Naming the tap in full is itself the signal that you
meant to, so Homebrew installs it and records that one formula as trusted.

**Then trust the tap, or your next `brew upgrade` will be refused:**

`brew trust --tap magmacrunch-media/tap`

Or do that first and use the shorter form, which needs the tap trusted:

```sh
brew trust --tap magmacrunch-media/tap
brew tap magmacrunch-media/tap
brew install <formula>
```

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "magmacrunch-media/tap"
brew "<formula>"
```

### When the trust step is actually needed

Homebrew will not load a formula from a third-party tap unless you have trusted
it, and the exception above is easy to mistake for the rule. Measured on
Homebrew 7.0.9 with nothing trusted:

| command | result |
|---------|--------|
| `brew install magmacrunch-media/tap/magmascript` | installs, and trusts that one formula |
| `brew tap ...` then `brew install magmascript` | **refused** |
| `brew upgrade magmascript` | **refused** |

So the trap is the upgrade, not the install. A fully qualified install works,
and then `brew upgrade` stops working later with:

```
Error: Refusing to load formula magmacrunch-media/tap/<formula> from untrusted
tap magmacrunch-media/tap.
```

That names the tap rather than the Homebrew change that introduced the rule, so
it reads like a broken tap when nothing is wrong with it. One
`brew trust --tap magmacrunch-media/tap` avoids every case.

`brew trust` records the decision in `~/.homebrew/trust.json`, or under
`$XDG_CONFIG_HOME/homebrew/` when that variable is set. It is per user and per
machine, so a new machine needs it again. `--tap` covers every formula here,
including ones added later, which is exactly what the auto-trust on a qualified
install does not do: that trusts the single formula you named and nothing else.

If `brew trust` reports an unknown command, your Homebrew predates the gate and
you can skip it.

## On Tap

| Formula | Description |
|---------|-------------|
| [`texastoast`](https://magmacrunch.com/ware/texastoast/) | Python RPG engine with I2C hardware abstraction for magmacrunch game systems |
| [`magmacrunch`](https://magmacrunch.com/arcade/terminal.html) | Terminal arcade - a card grid of every installed cabinet |
| [`magmascript`](https://magmacrunch.com/ware/magmascript/) | Scripting toolkit with domain-first subcommands |

Each formula links to that tool's page on magmacrunch.com, which is where its
documentation lives.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
