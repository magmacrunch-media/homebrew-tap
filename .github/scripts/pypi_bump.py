"""Point a tap's formulae at the newest sdist on PyPI.

Only the three top-level lines are touched here — `url`, `sha256`, and the
stale `bottle` block. Resource blocks are regenerated afterwards by
`brew update-python-resources`, which resolves the dependency graph properly
and is not a thing worth reimplementing badly.

The bottle block has to go. It names checksums for the *previous* version, and
`brew pr-pull` is what puts the new ones back after CI has built them. A
formula carrying a version it was never bottled for is worse than one carrying
no bottles at all: brew would fetch the old bottle and install the old arcade.
"""

from __future__ import annotations

import json
import os
import pathlib
import re
import sys
import urllib.error
import urllib.request

# Top-level directives are indented two spaces; the identical directives inside
# a `resource do` block are indented four. That is the whole discriminator, and
# it is why these patterns are anchored rather than merely searched for.
URL = re.compile(r'^  url "(?P<url>[^"]+)"', re.MULTILINE)
SHA = re.compile(r'^  sha256 "(?P<sha>[0-9a-f]{64})"', re.MULTILINE)
BOTTLE = re.compile(r"^  bottle do\n(?:.*\n)*?  end\n\n?", re.MULTILINE)
SDIST = re.compile(r"/(?P<name>[^/]+)-(?P<version>[^-/]+)\.tar\.gz$")


class Skip(Exception):
    """This one formula cannot be bumped from PyPI. The others still can.

    A tap is allowed to hold formulae this script has no business touching —
    anything not published to PyPI, and anything whose newest release ships
    wheels only. Those are facts about that formula, not faults in the run, so
    they must not take the other formulae down with them. Raising `SystemExit`
    here would mean one GitHub-tarball formula silently ends all bumping.
    """


def warn(message: str) -> None:
    """Say what was skipped, somewhere a person will actually see it."""
    if os.environ.get("GITHUB_ACTIONS"):
        print(f"::warning::{message}")
    else:
        print(f"warning: {message}", file=sys.stderr)


def pypi(project: str) -> dict:
    try:
        with urllib.request.urlopen(
            f"https://pypi.org/pypi/{project}/json", timeout=30
        ) as response:
            return json.load(response)
    except urllib.error.HTTPError as error:
        # A 404 is a fact about this project - renamed, withdrawn, never
        # published - not a reason to abandon the run. Anything else (a 5xx, a
        # rate limit) is about PyPI, and failing loudly is right for that.
        if error.code == 404:
            raise Skip(f"no such project on PyPI: {project}") from error
        raise


def sdist_of(release: list[dict]) -> dict:
    for file in release:
        if file["packagetype"] == "sdist":
            return file
    raise Skip("newest release publishes no sdist")


def current(formula: str) -> tuple[str, str]:
    """The version the formula points at, and the project name PyPI knows."""
    match = URL.search(formula)
    if not match:
        raise Skip("no top-level url in formula")
    filename = SDIST.search(match.group("url"))
    if not filename:
        raise Skip(f"url is not a PyPI sdist: {match.group('url')}")
    # PyPI normalises underscores in filenames back to hyphens in project names.
    return filename.group("version"), filename.group("name").replace("_", "-")


def plan(path: pathlib.Path) -> tuple[str, str, str] | None:
    """The rewritten formula, and the versions either side. Writes nothing."""
    formula = path.read_text(encoding="utf-8")
    have, project = current(formula)

    data = pypi(project)
    want = data["info"]["version"]
    if want == have:
        return None

    file = sdist_of(data["releases"][want])
    formula = URL.sub(lambda _: f'  url "{file["url"]}"', formula, count=1)
    formula = SHA.sub(
        lambda _: f'  sha256 "{file["digests"]["sha256"]}"', formula, count=1
    )
    formula = BOTTLE.sub("", formula, count=1)
    return formula, have, want


def main() -> int:
    paths = (
        [pathlib.Path("Formula") / f"{name}.rb" for name in sys.argv[1:]]
        if len(sys.argv) > 1
        else sorted(pathlib.Path("Formula").glob("*.rb"))
    )

    # Every formula is considered before any of them is written, so a formula
    # that cannot be read never leaves the tap half-rewritten behind it. That
    # matters most when this is run by hand, against a working copy someone
    # cares about rather than a runner that is about to be thrown away.
    planned = {}
    for path in paths:
        if not path.exists():
            raise SystemExit(f"no such formula: {path}")
        try:
            proposal = plan(path)
        except Skip as reason:
            warn(f"skipped {path.stem}: {reason}")
            continue
        if proposal:
            planned[path] = proposal

    bumped = {}
    for path, (formula, have, want) in planned.items():
        path.write_text(formula, encoding="utf-8", newline="\n")
        print(f"{path.stem}: {have} -> {want}")
        bumped[path.stem] = want

    if not bumped:
        print("every formula is already current")
        return emit(changed="false")

    # The branch name has to be a function of what changed rather than of when
    # it ran: a second run that finds the same releases should update the open
    # pull request, not open a second one beside it.
    return emit(
        changed="true",
        branch="bump/" + "_".join(f"{n}-{v}" for n, v in sorted(bumped.items())),
        title=", ".join(f"{n} {v}" for n, v in sorted(bumped.items())),
        formulae=" ".join(sorted(bumped)),
    )


def emit(**outputs: str) -> int:
    """Hand the workflow its step outputs, or print them when run by hand."""
    destination = os.environ.get("GITHUB_OUTPUT")
    lines = [f"{key}={value}" for key, value in outputs.items()]
    if destination:
        with open(destination, "a", encoding="utf-8") as handle:
            for line in lines:
                print(line, file=handle)
    else:
        for line in lines:
            print(line)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
