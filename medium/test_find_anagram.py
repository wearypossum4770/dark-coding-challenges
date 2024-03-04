import pytest
from easy.find_anagram import find_anagram


@pytest.mark.parametrize(
    "candidates,expected, word",
    [
        ( ["hello", "world", "zombies", "pants"],[], "diaper", ),
        ( ["lemons", "cherry", "melons"],["lemons", "melons"], "solemn", ),
        ( ["dog", "goody"],[], "good", ),
        ( ["enlists", "google", "inlets", "banana"],["inlets"], "listen", ),
        ( ["gallery", "ballerina", "regally", "clergy", "largely", "leading"],["gallery", "regally", "largely"], "allergy", ),
        ( ["Eons", "ONES"],["Eons", "ONES"], "nose", ),
        (
            ["last"],
            [],
            "mass",
        ),
        (
            ["cashregister", "Carthorse", "radishes"],
            ["Carthorse"],
            "Orchestra",
        ),
        (
            ["cashregister", "carthorse", "radishes"],
            ["carthorse"],
            "Orchestra",
        ),
        (
            ["cashregister", "Carthorse", "radishes"],
            ["Carthorse"],
            "orchestra",
        ),
        (
            ["goGoGO"],
            [],
            "go",
        ),
        (
            ["patter"],
            [],
            "tapper",
        ),
        (
            ["BANANA"],
            [],
            "BANANA",
        ),
        (
            ["Banana"],
            [],
            "BANANA",
        ),
        (
            ["banana"],
            [],
            "BANANA",
        ),
        ( ["LISTEN", "Silent"], ["Silent"], "LISTEN",),
        ( ["ΒΓΑ", "ΒΓΔ", "γβα", "αβγ"],["ΒΓΑ", "γβα"], "ΑΒΓ", ),
        ( ["€a"],[], "a⬂", ),
    ],
)
def test_find_anagram(candidates, expected, word):
    assert find_anagram(word, candidates) == expected
