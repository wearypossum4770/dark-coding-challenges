use crate::helpers::PI;

pub fn parallelogram_area(a: f32, b: f32) -> f32 {
    a * b
}
pub fn triangle_area(base: f32, height: f32) -> f32 {
    parallelogram_area(base, height)
}
pub fn ellipse_area(a: f32, b: f32) -> f32 {
    parallelogram_area(a, b) * PI
}
pub fn trapezoid_area(a: f32, b: f32, height: f32) -> f32 {
    0.5 * (a + b) * height
}
pub fn rectangle_area(height: f32, width: f32) -> f32 {
    parallelogram_area(height, width)
}
pub fn circle_circumference(radius: f32) -> f32 {
    radius.powf(2.0) * PI
}
pub fn sector_area(radius: f32, degrees: f32) -> f32 {
    0.5 * radius * degrees
}
pub fn shape_area(a: f32, b: f32, shape: &str) -> f32 {
    match shape {
        "triangle" => triangle_area(a, b),
        "parallelogram" => parallelogram_area(a, b),
        _ => 0_f32,
    }
}

#[cfg(test)]
mod tests {
    use super::shape_area;
    use float_eq::float_eq;
    #[test]
    fn test_shape_area() {
        const tolerance: f32 = 0.1;
        float_eq!(shape_area(2.0, 3.0, "triangle"), 3.0, abs <= tolerance);
        float_eq!(
            shape_area(8.0, 6.0, "parallelogram"),
            48.0,
            abs <= tolerance
        );
        float_eq!(shape_area(0.0, 1.0, "triangle"), 0.0, abs <= tolerance);
        float_eq!(
            shape_area(2.9, 1.3, "parallelogram"),
            3.77,
            abs <= tolerance
        );
        float_eq!(shape_area(0.01, 5.0, "triangle"), 0.025, abs <= tolerance);
    }
}
