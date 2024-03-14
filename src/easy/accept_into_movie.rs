pub fn accept_into_movie(age: f32, is_supervised: bool) -> bool {
    match age < 15.0 {
        true => is_supervised,
        false => true,
    }
}
#[cfg(test)]
mod tests {
    use super::accept_into_movie;
    #[test]
    fn test_accept_into_movie() {
        assert_eq!(accept_into_movie(14.0, true), true);
        assert_eq!(accept_into_movie(15.0, true), true);
        assert_eq!(accept_into_movie(16.0, true), true);
        assert_eq!(accept_into_movie(14.0, false), false);
        assert_eq!(accept_into_movie(15.0, false), true);
        assert_eq!(accept_into_movie(16.0, false), true);
        assert_eq!(accept_into_movie(14.99999, true), true);
        assert_eq!(accept_into_movie(14.99999, false), false);
    }
}
