import pytest
from easy.most_common_safe_word import most_common_safe_word


@pytest.mark.parametrize(
    "paragraph, banned, expected",
    [
        (
            "Bob hit a ball, the hit BALL flew far after it was hit.",
            ["hit"],
            "ball",
        ),
        (
            "..Bob hit a ball, the hit BALL flew far after it was hit.",
            ["hit"],
            "ball",
        ),
        ("a.", [], "a"),
        ("a b.b", [], "b"),
        ("Bob. hIt, baLl", ["bob", "hit"], "ball"),
        ("Apple pear apple APPLE!", ["apple"], "pear"),
        ("Wow! wow? wow. really, really... REALLY!", ["wow"], "really"),
        ("test test test test", [], "test"),
        ("word " * 1000, [], "word"),
        ("apple banana apple banana cherry", ["banana"], "apple"),
    ],
)
def test_most_common_safe_word(
    paragraph: str, banned: list[str], expected: str
):
    assert most_common_safe_word(paragraph, banned) == expected
