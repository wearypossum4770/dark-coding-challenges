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
