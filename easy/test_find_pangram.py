import pytest
from easy.find_pangram import find_pangram, hacker_rank_pangram


@pytest.mark.parametrize(
    "sentence, expected",
    [
        (
            "WwmdRukNYPMFBxYFPVtZrzs FAktokrLtdPyVRWCyqSHaqjttuhYNXpwnzwoXDC AdKRP AWwEamzQlOT EweNHXGkYrgJJwzErXvkiYIGOK goZXDYecGz oPHaxcZZC Z ktcXTnPFeuPQgQqoJS LZtk nOA zXc QyDseEIHVueKlgZVcQhgc hNHCQJS NXqvz EIOrqfPcBaXHDmWCHKMufyLXBQPVROdnlWDICRO qUNaVNP I fJAoEK saAnGbE pXvQW nd bitUAdJoIkbhPkwiKVUxpgV NsDCpwztiCXliMHrOEicnEsVc uIiai hLRqwFVeeHQzXXqVgUmNcqc TdHCztGUXwnzFGIPdYNZhfFKPQuUI ynSWARRzzwlRlzL JxsljNx YGfagQnP g VMImbbBNiOjNqtFb ODtQK DxNIfqggIzXgP eGMS kcnelJ kOTAG tSwcSlyMp xVjLZigPdsR yilXJyDa SKGOj yWEROeKfnPE iSFZwHPj ZPwKdllGxEdtpKwTMcB Yuus JgyWdYHj snl HrFqRgVDgVPAh X PBRAkR EwpdMYrlgI QKUnRBfKLwV yXKKGbMkIRIYN dqzaYvIQM vt yvuaGntYHEgEJb TNoPvslu htYlZXayqTlcNclvSOoMyfiTWehzhs W wanyMaAYijgxubvDINMlqHblbjLSJCvCpfvqaWHy qwG lLciwkkuu o NoSTWbytadyGuTRznISvCQhFMtrdqveTmcc mcKNPGowUGBLPmONplkUwZeu N p apQLbHLFSIt vkOcFlSMYZdaZy PzfbRPLTHy gAFo PLRItTAOfuWITfyIzUBc F GEXzyMZHXRpnpxQ NV Cl PIBRgkNNKQTVgGkTNbojQqm VvomeAxXDppIWm I KqyX CTA nt JTSsOH M mKzfGwsT LjXPVYzcJFdVWqkFRNm",
            "pangram",
        ),
        ("We promptly judged antique ivory buckles for the next prize", "pangram"),
        ("We promptly judged antique ivory buckles for the prize", "not pangram"),
    ],
)
def test_hacker_rank_pangram(sentence, expected):
    assert hacker_rank_pangram(sentence) == expected


@pytest.mark.parametrize(
    "rule, sentence,expected",
    [
        ["empty sentence", "", False],
        ["perfect lower case", "abcdefghijklmnopqrstuvwxyz", True],
        ["only lower case", "the quick brown fox jumps over the lazy dog", True],
        [
            "missing the letter 'x'",
            "a quick movement of the enemy will jeopardize five gunboats",
            False,
        ],
        ["missing the letter 'h'", "five boxing wizards jump quickly at it", False],
        ["with underscores", "the_quick_brown_fox_jumps_over_the_lazy_dog", True],
        ["with numbers", "the 1 quick brown fox jumps over the 2 lazy dogs", True],
        [
            "missing letters replaced by numbers",
            "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog",
            False,
        ],
        [
            "mixed case and punctuation",
            '"Five quacking Zephyrs jolt my wax bed."',
            True,
        ],
        [
            "a-m and A-M are 26 different characters but not a pangram",
            "abcdefghijklm ABCDEFGHIJKLM",
            False,
        ],
    ],
)
def test_find_pangram(rule, sentence, expected):
    assert find_pangram(sentence) == expected
