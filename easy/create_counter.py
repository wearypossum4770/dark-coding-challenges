from typing import Callable


def create_counter(n: int) -> Callable[[], int]:
    count = n

    def increment() -> int:
        nonlocal count
        current = count
        count += 1
        return current

    return increment


def capture(nums: list[int], index: int, counter: Callable[[], int]) -> None:
    nums[index] = counter()
    return None
