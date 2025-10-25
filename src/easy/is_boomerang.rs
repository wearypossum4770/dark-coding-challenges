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
#[cfg(test)]
mod tests {
    use super::is_boomerang;
    use rstest::rstest;
    #[rstest]
#[case(vec![vec![1,1],vec![2,3],vec![3,2]], true)]
#[case(vec![vec![1,1],vec![2,2],vec![3,3]], false)]
#[case(vec![vec![1,0],vec![0,0],vec![2,0]], false)]
#[case(vec![vec![0,1],vec![0,2],vec![1,2]], true)]
    #[case(vec![vec![0,1],vec![0,1],vec![0,1]], false)]
    fn test_is_boomerang(#[case] points: Vec<Vec<i32>>, #[case] expected: bool) {
        assert_eq!(is_boomerang(points), expected);
    }
}
