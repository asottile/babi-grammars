from __future__ import annotations

something = 'world'
a_t_string = t'hello {something}'

type R[U] = list[U | R[U]]


class MyContainer[T]:
    def __init__(self, o: list[T]) -> None:
        self.o = o


def func[T: int](u: list[T]) -> list[T]:
    return u


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
