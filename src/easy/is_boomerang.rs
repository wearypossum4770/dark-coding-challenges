use std::collections::HashSet;

pub fn is_boomerang(points: Vec<Vec<i32>>) -> bool {
   let distinct: HashSet<String> = points
        .iter()
        .map(|point| point.iter().map(|&num| num.to_string()).collect::<Vec<String>>().join(","))
        .collect();
    if distinct.len() != 3 {
        return false;
    }
    let x1 = points[0][0];
    let y1 = points[0][1];
    let x2 = points[1][0];
    let y2 = points[1][1];
    let x3 = points[2][0];
    let y3 = points[2][1];

    let a = x1 * (y2 - y3);
    let b = x2 * (y3 - y1);
    let c = x3 * (y1 - y2);
    a + b + c != 0
}