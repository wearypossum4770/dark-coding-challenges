use std::f32::consts::PI;

pub fn radians_to_degrees(radians: i32) -> f32 {
    radians as f32 * (180.0 / PI)
}
#[cfg(test)]
mod tests {
    use super::radians_to_degrees;
    use approx::abs_diff_eq;
    fn test_helper(result: f32, actual: f32) -> bool {
        (result - actual).abs() == f32::EPSILON
    }
    #[test]
    fn test_radians_to_degrees() {
        abs_diff_eq!(radians_to_degrees(1), 57.29577951308232);
        abs_diff_eq!(radians_to_degrees(5), 286.4788975654116);
        abs_diff_eq!(radians_to_degrees(7), 401.07045659157626);
        abs_diff_eq!(radians_to_degrees(100), 5729.5779513082325);
        abs_diff_eq!(radians_to_degrees(180), 10313.240312354817);
    }
}
