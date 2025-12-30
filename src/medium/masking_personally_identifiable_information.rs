pub fn mask_email(email: &str) -> String {
    let (local, domain) = match email.split_once('@') {
        Some(parts) => parts,
        None => return email.to_string(),
    };
    let mut chars = local.chars();
    let first = chars.next().unwrap();
    let last = local.chars().last().unwrap_or(first);
    let masked = if local.len() > 1 {
        format!("{}*****{}", first, last)
    } else {
        format!("{}*****", first)
    };

    format!("{}@{}", masked, domain).to_lowercase()
}
pub fn mask_phone(phone: &str) -> String {
    let mut mask = String::with_capacity(phone.len());
    let mut count: u16 = 0;
    let mut chars: u16 = 0;
    for c in phone.chars().rev() {
        if !c.is_numeric() {
            continue;
        } else if count == 4 || count == 8 || count == 12 {
            mask.push('-');
            count += 1;
        }
        if count < 4 {
            mask.push(c);
        } else {
            mask.push('*');
        }
        chars += 1;
        count += 1;
    }
    if chars > 10 {
        mask.push('+');
    }
    mask.chars().rev().collect()
}
pub fn masking_personally_identifiable_information(s: String) -> String {
    if s.contains("@") {
        return mask_email(s.as_str());
    } else {
        return mask_phone(s.as_str());
    }
}
#[cfg(test)]
mod tests {
    use super::masking_personally_identifiable_information;
    use rstest::rstest;
    #[rstest]
    #[case("LeetCode@LeetCode.com", "l*****e@leetcode.com")]
    #[case("AB@qq.com", "a*****b@qq.com")]
    #[case("a@b.com", "a*****@b.com")]
    #[case("John.Doe@Example.COM", "j*****e@example.com")]
    #[case("X@Y.Z", "x*****@y.z")]
    #[case("1234567890", "***-***-7890")]
    #[case("1(234)567-890", "***-***-7890")]
    #[case("86-(10)12345678", "+**-***-***-5678")]
    #[case("+86(88)1513-7-74", "+*-***-***-3774")]
    #[case("(123) 456 7890", "***-***-7890")]
    #[case("123-45-67890", "***-***-7890")]
    #[case("0000000000", "***-***-0000")]
    #[case("+000000000000", "+**-***-***-0000")]
    #[case("Z@Z.Z", "z*****@z.z")]
    fn test_masking_personally_identifiable_information(#[case] s: &str, #[case] expected: &str) {
        assert_eq!(
            masking_personally_identifiable_information(s.to_string()),
            expected.to_string()
        );
    }
}
