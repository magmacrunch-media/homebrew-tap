# The Formulas

All three are Python packages installed with
`Language::Python::Virtualenv`, which means each gets its own virtualenv under
the Cellar and none of them can disturb your system Python or each other. The
`resource` blocks are the pinned, hash-checked dependency set for that
virtualenv.

## magmacrunch

The terminal arcade. Runs on `python@3.12`.

The dependency list is longer than the others because the formula installs the
cabinets too: `magmacrunch-george-boole`, `magmacrunch-moonlight-drift` and
`magmacrunch-thld` are resources here, and that is what makes
`brew install magmacrunch` an arcade rather than an empty room.

Nothing in the launcher imports them. Cabinets are discovered at runtime through
the `magmacrunch.games` entry point group, so the arcade runs with none of them
installed and will find a game published later without a release here.

Its `test do` block runs `magmacrunch --list` and asserts that `george-boole`,
`thld` and `moonlight-drift` all appear. That exercises the entry point seam
rather than merely proving the module imports: a cabinet that failed to install
shows up as a missing line rather than as a passing test.

**Licence.** PolyForm-Noncommercial-1.0.0, which is not an open source licence.
The engine underneath is Apache-2.0, but the arcade and the games it seats are
not, and a package cannot be more permissive than what it depends on.

## magmascript

The infrastructure toolkit. Runs on `python@3.13`.

The formula installs the `cli` extra, not the bare package, which is why `rich`,
`prompt_toolkit` and `pygments` appear as resources next to `httpx` and its
transitive dependencies.

It carries a `typing-extensions` resource because `anyio` requires it even on
Python 3.13 in some configurations. Regenerating resources on a different
interpreter version may change the dependency set.

## texastoast

The RPG engine. Runs on `python@3.12`.

It has no `resource` blocks at all. Every dependency texastoast has sits behind
an extra (`audio`, `hardware`, `sprites`, `tui`) and the formula installs none of
them, so the base package is genuinely dependency-free. An empty resource list
here is correct, not unfinished.

The `tui` extra, which pulls in `textual`, does get installed as part of
`magmacrunch`, since the arcade depends on `texastoast[tui]`. That is why
`textual` and its dependencies appear in the magmacrunch formula and not this
one.
