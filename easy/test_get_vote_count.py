import pytest
from easy.get_vote_count import get_vote_count


@pytest.mark.parametrize(
    "votes,expected",
    [
        ({"upvotes": 13, "downvotes": 0}, 13),
        ({"upvotes": 2, "downvotes": 33}, -31),
        ({"upvotes": 132, "downvotes": 132}, 0),
        ({"upvotes": 0, "downvotes": 0}, 0),
        ({"downvotes": 4, "upvotes": 1}, -3),
    ],
)
def test_get_vote_count(votes, expected):
    assert get_vote_count(**votes) == expected
