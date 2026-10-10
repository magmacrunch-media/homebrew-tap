# magmacrunch-media tap

## How do I install these formulae?

**Trust the tap first.** Recent Homebrew will not load formulae from a
third-party tap until you say you trust it, so this step comes before any
install:

`brew trust --tap magmacrunch-media/tap`

Then:

`brew install magmacrunch-media/tap/<formula>`

Or `brew tap magmacrunch-media/tap` and then `brew install <formula>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "magmacrunch-media/tap"
brew "<formula>"
```

### Why the trust step

Without it, installing fails like this:

```
Error: Refusing to load formula magmacrunch-media/tap/<formula> from untrusted
tap magmacrunch-media/tap.
```

That message names the tap rather than the Homebrew version that started
requiring this, so it reads like a broken tap when nothing is wrong with it.

`brew trust` records the decision in `~/.homebrew/trust.json`, or under
`$XDG_CONFIG_HOME/homebrew/` when that variable is set. It is per user and per
machine, so a new machine needs it again. `--tap` covers every formula here,
including ones added later; `brew trust --formula magmacrunch-media/tap/<formula>`
trusts just one instead.

Older Homebrew does not need this and has no `trust` command. Observed on
2026-10-09: 7.0.6 installed from this tap without complaint and 7.0.9 refused,
so if `brew trust` reports an unknown command, your Homebrew predates the gate
and you can skip straight to `brew install`.

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
