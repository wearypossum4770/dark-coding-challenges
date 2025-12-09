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
