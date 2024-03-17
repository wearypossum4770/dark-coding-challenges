from functools import wraps
from time import perf_counter


def performance(*args, **kwargs):
    start = perf_counter()

    def wrapper(func):

        return func

    end = perf_counter()
    print(end - start)
    return wrapper


def currency(number):
    return f"{number:,}"


@performance
def func_to():
    print("Inside actual function")


func_to


print(currency(1000))
