pub fn marcs_cakewalk(calorie: &mut [u64]) -> u64 {
    let mut target: u64 = 0;
    calorie.sort_by(|a, b| b.cmp(a));
    for (i, val) in calorie.iter().enumerate() {
        println!("{:?}", val);
        target += 2_u64.pow(i as u32) * val;
    }
    target
}
#[cfg(test)]
mod tests {
    use super::marcs_cakewalk;

    #[test]
    fn test_5_7_10() {
        let calories = &mut [5, 10, 7];
        const OUTPUT: u64 = 44;
        assert_eq!(marcs_cakewalk(calories), OUTPUT);
    }
    #[test]
    fn test_with_value_length_5() {
        let input = &mut [1, 3, 2];
        const OUTPUT: u64 = 11;
        assert_eq!(marcs_cakewalk(input), OUTPUT);
    }
    #[test]
    fn test_with_value_length_78() {
        let input = &mut [
            504, 378, 291, 380, 728, 630, 797, 212, 32, 792, 895, 635, 850, 853, 859, 127, 653,
            655, 476, 748,
        ];
        const OUTPUT: u64 = 124138217;
        assert_eq!(marcs_cakewalk(input), OUTPUT);
    }
    #[test]
    fn test_with_value_length_154() {
        let input = &mut [
            819, 701, 578, 403, 50, 400, 983, 665, 510, 523, 696, 532, 51, 449, 333, 234, 958, 460,
            277, 347, 950, 53, 123, 227, 646, 190, 938, 61, 409, 110, 61, 178, 659, 989, 625, 237,
            944, 550, 954, 439,
        ];
        const OUTPUT: u64 = 59715404338867;
        assert_eq!(marcs_cakewalk(input), OUTPUT);
    }
    #[test]
    fn test_with_value_length_157() {
        let input = &mut [
            801, 234, 536, 747, 172, 590, 833, 847, 509, 429, 666, 411, 609, 894, 348, 254, 814,
            767, 647, 965, 711, 801, 852, 781, 972, 390, 218, 290, 508, 174, 55, 714, 442, 284,
            745, 872, 46, 131, 833, 315,
        ];
        const OUTPUT: u64 = 84350424920174;
        assert_eq!(marcs_cakewalk(input), OUTPUT);
    }
    #[test]
    fn test_with_value_length_75() {
        let input = &mut [
            353, 726, 36, 574, 234, 746, 507, 244, 382, 349, 107, 279, 608, 87, 459, 793, 710, 73,
            758, 945,
        ];
        const OUTPUT: u64 = 73444139;
        assert_eq!(marcs_cakewalk(input), OUTPUT);
    }
    #[test]
    fn test_with_value_length_7() {
        let input = &mut [7, 4, 9, 6];
        const OUTPUT: u64 = 79;
        assert_eq!(marcs_cakewalk(input), OUTPUT);
    }
}
