def truth_machine(n: int) -> None:
    while n == 1:
        print(1)
    else:
        print(0)


def main() -> int:
    truth_machine(int(input('Please enter 0 or 1: ')))
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
