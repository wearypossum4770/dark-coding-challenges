from typing import Callable
from cuid2 import cuid_wrapper

cuid_generator: Callable[[], str] = cuid_wrapper()

print(cuid_generator())