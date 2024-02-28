use crate::easy::distance_from_origin;

pub fn dart_score(x: f32, y: f32) -> i8 {
    let point: f32 = distance_from_origin(x, y);
    if point <= 10.0 && point > 5.0 {
        return 1;
    }
    if point <= 5.0 && point > 1.0 {
        return 5;
    }
    if point <= 1.0 {
        return 10;
    }
    0
}
#[cfg(test)]
mod tests {
    use super::dart_score;
    #[test]
    fn test_dart_score() {
        assert_eq!(dart_score(-9.0, 9.0), 0);
        assert_eq!(dart_score(0.0, 10.0), 1);
        assert_eq!(dart_score(-5.0, 0.0), 5);
        assert_eq!(dart_score(0.0, -1.0), 10);
        assert_eq!(dart_score(0.0, 0.0), 10);
        assert_eq!(dart_score(-0.1, -0.1), 10);
        assert_eq!(dart_score(0.7, 0.7), 10);
        assert_eq!(dart_score(0.8, -0.8), 5);
        assert_eq!(dart_score(-3.5, 3.5), 5);
        assert_eq!(dart_score(-3.6, -3.6), 1);
        assert_eq!(dart_score(-7.0, 7.0), 1);
        assert_eq!(dart_score(7.1, -7.1), 0);
        assert_eq!(dart_score(0.5, -4.0), 5,);
    }
}
