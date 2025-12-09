pub fn count_students(students: Vec<i32>, sandwiches: Vec<i32>) -> i32 {
    let mut lhs = students.clone();
    let mut rhs = sandwiches.clone();
    let mut count = 0;

    while !lhs.is_empty() && count < lhs.len() {
        if lhs[0] == rhs[0] {
            rhs.remove(0);
            lhs.remove(0);
            count = 0;
        } else {
            let student = lhs.remove(0);
            lhs.push(student);
            count += 1;
        }
    }
    lhs.len() as i32
}

#[cfg(test)]
mod tests {
    use super::count_students;
    use rstest::rstest;
    #[rstest]
    #[case(&[1,1,0,0], &[0,1,0,1], 0)]
    #[case(&[1,1,1,0,0,1], &[1,0,0,0,1,1], 3)]
    #[case(&[0,0,0], &[0,0,0], 0)]
    #[case(&[1,1,1], &[1,1,1], 0)]
    #[case(&[1,0,1,0], &[1,0,1,0], 0)]
    #[case(&[0,1,0,1], &[1,0,1,0], 0)]
    #[case(&[1], &[0], 1)]
    #[case(&[0], &[1], 1)]
    #[case(&[0], &[0], 0)]
    #[case(&[1], &[1], 0)]
    #[case(&[0,1,0,1,1,0], &[1,1,0,0,0,1], 0)]
    #[case(&[1,1,1,1,1], &[0,0,0,0,0], 5)]
    #[case(&[0,0,0,0,0], &[1,1,1,1,1], 5)]
    fn test_count_students(
        #[case] students: &[i32],
        #[case] sandwiches: &[i32],
        #[case] expected: i32,
    ) {
        assert_eq!(
            count_students(students.to_vec(), sandwiches.to_vec()),
            expected
        );
    }
}
