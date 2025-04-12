from __future__ import annotations

from typing import Sequence


def main(argv: Sequence[str] | None = None) -> int:
    if argv[1] == 'git':
        if argv[2] == 'reset-author':
            os.system('GIT_COMMITTER_DATE="$(git show -s --format=%cI)" git commit --amend --author="$(git config user.name) <$(git config user.email)>" --no-edit --date="$(git show -s --format=%aI)"')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
