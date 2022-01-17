def _update(*, only: list[str] | None) -> int:
    new = []
    for repo in REPOS:
        if only is not None and repo.name not in only:
            new.append(repo)
            continue

        print(f'{repo.name} ... ', end='', flush=True)

        with tempfile.TemporaryDirectory() as tmpdir:
            git = ('git', '-C', tmpdir)

            url = f'https://github.com/{repo.name}'
            clone_cmd = (*git, 'clone', '--no-checkout', '-q', url, '.')
            subprocess.check_call(clone_cmd)

            branches_cmd = (*git, 'branch', '-r', '--contains', repo.version)
            branches_s = subprocess.check_output(branches_cmd).decode()
            branches = [branch.strip() for branch in branches_s.splitlines()]

            if not branches:
                raise SystemExit(f'orphaned commit {repo.name}')
            elif branches[0].startswith('origin/HEAD -> '):
                _, _, branch = branches[0].rpartition(' ')
            else:
                branch = branches[0]

            version_cmd = (
                *git, 'log', '-1', '--format=%h', branch, '--', *repo.grammars,
            )
            version = subprocess.check_output(version_cmd).decode().strip()

            ancestor_cmd = (
                *git, 'merge-base', '--is-ancestor', version, repo.version,
            )
            if (
                    repo.version == 'HEAD' or
                    version != repo.version and subprocess.call(ancestor_cmd)
            ):
                print(f'{repo.version} => {version}')
                new.append(repo._replace(version=version))
            else:
                print('up to date!')
                new.append(repo)

    new.sort(key=lambda repo: repo.name)

    if new != list(REPOS):
        with open(__file__, encoding='utf-8') as f:
            contents = f.read()

        before, begin, rest = contents.partition('# BEGIN\n')
        _, end, rest = rest.partition('# END\n')

        new_contents = (
            'REPOS = (\n' +
            ''.join(f'{textwrap.indent(repr(r), " " * 4)},\n' for r in new) +
            ')\n'
        )
        new_contents = ''.join(
            line.replace('\n', '  # noqa: E501\n') if len(line) > 80 else line
            for line in new_contents.splitlines(True)
        )

        print('updating source!')
        with open(__file__, 'w', encoding='utf-8') as f:
            for part in (before, begin, new_contents, end, rest):
                f.write(part)

    return 0
