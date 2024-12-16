pub fn square_of_sum(n: u32) -> u32 {
    if n == 0 {
        return 0;
    }
    let mut count = 0_u32;
    for i in 1..=n {
        count += i
    }
    return count.pow(2);
}

pub fn sum_of_squares(n: u32) -> u32 {
    if n == 0 {
        return 0;
    }
    let mut count: u32 = 0;
    for i in 1..=n {
        count += i.pow(2);
    }
    return count;
}

pub fn difference(n: u32) -> u32 {
    return square_of_sum(n) - sum_of_squares(n);
}

#[cfg(test)]
mod tests {
    use super::{square_of_sum, sum_of_squares, difference};
    #[test]
    fn square_of_sum_1() {
        assert_eq!(1, square_of_sum(1));
    }
    #[test]
    fn square_of_sum_5() {
        assert_eq!(225, square_of_sum(5));
    }
    #[test]
    fn square_of_sum_100() {
        assert_eq!(25_502_500, square_of_sum(100));
    }
    #[test]
    fn sum_of_squares_1() {
        assert_eq!(1, sum_of_squares(1));
    }
    #[test]
    fn sum_of_squares_5() {
        assert_eq!(55, sum_of_squares(5));
    }
    #[test]
    fn sum_of_squares_100() {
        assert_eq!(338_350, sum_of_squares(100));
    }
    #[test]
    fn sum_of_squares_0(){
        assert_eq!(0, sum_of_squares(0));
    }
fn difference_1() {
    assert_eq!(0, difference(1));
}
#[test]
fn difference_5() {
    assert_eq!(170, difference(5));
}
#[test]
fn difference_100() {
    assert_eq!(25_164_150, difference(100));
}
}
