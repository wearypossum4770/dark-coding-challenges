from typing import Callable

def create_hello_world() -> Callable[..., str]:
    def hello(*args, **kwargs) -> str:
        return "Hello World"
    return hello