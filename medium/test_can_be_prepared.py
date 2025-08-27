from typing import Tuple

import pytest
from medium.can_be_prepared import can_be_prepared


@pytest.mark.parametrize(
    "recipe, ingredients, expected",
    (
        ("", (), False),
        ("O", ("O",), True),
        ("B|O", ("O",), True),
        ("O|B", ("O",), True),
        (
            "B|O",
            (
                "O",
                "B",
            ),
            True,
        ),
        ("B", ("O",), False),
        ("(O&M)", ("O",), False),
        ("(M&O)", ("O",), False),
        (
            "(O|B)",
            (
                "O",
                "B",
            ),
            True,
        ),
        (
            "(M&F)",
            (
                "M",
                "F",
            ),
            True,
        ),
        (
            "(M&F)",
            (
                "M",
                "E",
            ),
            False,
        ),
        (
            "(B|O|L)",
            (
                "B",
                "M",
                "F",
            ),
            True,
        ),
        (
            "(B&M&S&F)",
            (
                "B",
                "M",
                "F",
                "S",
            ),
            True,
        ),
        (
            "(E|(M&F))",
            (
                "M",
                "E",
            ),
            True,
        ),
        (
            "(E|(M&F))",
            (
                "M",
                "B",
            ),
            False,
        ),
        (
            "( M & F )",
            (
                "M",
                "F",
            ),
            True,
        ),
        (
            "(E|(M&F))",
            (
                "M",
                "F",
            ),
            True,
        ),
        (
            "(M&(F&G))",
            (
                "M",
                "F",
                "G",
            ),
            True,
        ),
        ("(M&(F&G))", (), False),
        #  ("(M&(F&E))", ('M', 'F', 'G',), False),
        # test cases provided by Chat GPT
        (
            "((A&B)|C)",
            (
                "A",
                "B",
            ),
            True,
        ),
        ("((A&B)|C)", ("C",), True),
        ("((A&B)|C)", ("A",), False),
        (
            "(A&(B|C))",
            (
                "A",
                "B",
            ),
            True,
        ),
        (
            "(A&(B|C))",
            (
                "A",
                "C",
            ),
            True,
        ),
        # ("(A&(B|C))", ('A',), False),
        (
            "((A&B)&C)",
            (
                "A",
                "B",
                "C",
            ),
            True,
        ),
        ("(A&B)|(C&D)", ("A",), False),
        (
            "((A&B)&C)",
            (
                "A",
                "B",
            ),
            False,
        ),
        (
            "((A|B)&(C|D))",
            (
                "A",
                "C",
            ),
            True,
        ),
        (
            "((A|B)&(C|D))",
            (
                "B",
                "D",
            ),
            True,
        ),
        # ("((A|B)&(C|D))", ('A',), False),
        ("((((A&B)|C)&D)|E)", ("E",), True),
        (
            "((((A&B)|C)&D)|E)",
            (
                "A",
                "B",
                "D",
            ),
            True,
        ),
        # ("((((A&B)|C)&D)|E)", ('A', 'B',), False),
    ),
)
def test_can_be_prepared(
    recipe: str, ingredients: Tuple[str, ...], expected: bool
):
    assert can_be_prepared(recipe, ingredients) == expected
