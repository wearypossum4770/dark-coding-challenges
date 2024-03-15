use std::ops::Div;
pub fn how_many_walls(walls: u16, width: u16, height: u16) -> u16 {
    let total = width * height;
    match total <= walls {
        true => walls.div(total),
        false => 0,
    }
}
#[cfg(test)]
mod tests {
    use super::how_many_walls;
    #[test]
    fn test_how_many_walls() {
        assert_eq!(how_many_walls(100, 4, 5), 5);
        assert_eq!(how_many_walls(10, 15, 12), 0);
        assert_eq!(how_many_walls(41, 3, 6), 2);
        assert_eq!(how_many_walls(50, 11, 5), 0);
        assert_eq!(how_many_walls(1, 1, 1), 1);
    }
}
