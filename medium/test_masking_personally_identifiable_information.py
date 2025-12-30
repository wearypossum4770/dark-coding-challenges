import pytest
from medium.masking_personally_identifiable_information import (
    mask_email,
    mask_phone,
    masking_personally_identifiable_information,
)


@pytest.mark.parametrize(
    "s, expected",
    [
        ("LeetCode@LeetCode.com", "l*****e@leetcode.com"),
        ("ABracadabraB@qq.com", "a*****b@qq.com"),
        ("applesnap@b.com", "a*****p@b.com"),
        ("John.Doe@Example.COM", "j*****e@example.com"),
        ("XanaxAlprazolam@Y.Z", "x*****m@y.z"),
        ("1234567890", "***-***-7890"),
        ("1(234)567-890", "***-***-7890"),
        ("86-(10)12345678", "+**-***-***-5678"),
        ("+86(88)1513-7-74", "+*-***-***-3774"),
        ("(123) 456 7890", "***-***-7890"),
        ("123-45-67890", "***-***-7890"),
        ("0000000000", "***-***-0000"),
        ("+000000000000", "+**-***-***-0000"),
        ("Zatarans@Z.Z", "z*****s@z.z"),
    ],
)
def test_masking_personally_identifiable_information(s: str, expected: str):
    assert masking_personally_identifiable_information(s) == expected


@pytest.mark.parametrize(
    "email, expected",
    [
        ("LeetCode@LeetCode.com", "l*****e@leetcode.com"),
        ("ABracadabraB@qq.com", "a*****b@qq.com"),
        ("applesnap@b.com", "a*****p@b.com"),
        ("John.Doe@Example.COM", "j*****e@example.com"),
        ("XanaxAlprazolam@Y.Z", "x*****m@y.z"),
        ("Zatarans@Z.Z", "z*****s@z.z"),
    ],
)
def test_mask_email(email: str, expected: str):
    assert mask_email(email) == expected


@pytest.mark.parametrize(
    "phone, expected",
    [
        ("1234567890", "***-***-7890"),
        ("1(234)567-890", "***-***-7890"),
        ("86-(10)12345678", "+**-***-***-5678"),
        ("+86(88)1513-7-74", "+*-***-***-3774"),
        ("(123) 456 7890", "***-***-7890"),
        ("123-45-67890", "***-***-7890"),
        ("0000000000", "***-***-0000"),
        ("+000000000000", "+**-***-***-0000"),
    ],
)
def test_mask_phone(phone: str, expected: str) -> str:
    assert mask_phone(phone) == expected
