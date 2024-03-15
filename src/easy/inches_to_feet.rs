use std::ops::Div;
pub fn inches_to_feet(inches: u32) -> u32 {
    match inches < 12 {
        true => 0,
        false => inches.div(12),
    }
}
#[cfg(test)]
mod tests {
    use super::inches_to_feet;
    #[test]
    fn test_inches_to_feet() {
        assert_eq!(inches_to_feet(12), 1);
        assert_eq!(inches_to_feet(360), 30);
        assert_eq!(inches_to_feet(3612), 301);
        assert_eq!(inches_to_feet(324), 27);
        assert_eq!(inches_to_feet(3012), 251);
        assert_eq!(inches_to_feet(11), 0);
    }
}
