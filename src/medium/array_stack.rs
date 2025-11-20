pub fn array_stack(target: Vec<i32>, n: i32) -> Vec<String> {
    let mut result: Vec<String> = Vec::with_capacity(n as usize);
    let mut index: usize = 0;
    let mut counter: i32 = 1;
    while index < target.len() {
        result.push("Push".to_string());
        if target[index] == counter {
            index += 1;
        } else {
            result.push("Pop".to_string());
        }
        counter += 1;
    }

    result
}
#[cfg(test)]
mod tests {
    use super::array_stack;
    use rstest::rstest;
    #[rstest]
    #[case(&[1, 3],3,&["Push", "Push", "Pop", "Push"])]
    #[case(&[1, 2, 3],3,&["Push", "Push", "Push"])]
    #[case(&[1, 2],4,&["Push", "Push"])]
    #[case(&[1],1,&["Push"])]
    #[case(&[1],100,&["Push"])]
    #[case(&[2],2,&["Push", "Pop", "Push"])]
    #[case(&[3],3,&["Push", "Pop", "Push", "Pop", "Push"])]
    #[case(&[2, 3, 4],4,&["Push", "Pop", "Push", "Push", "Push"])]
    #[case(&[1, 3, 5, 7],7,&["Push","Push","Pop","Push","Push","Pop","Push","Push","Pop","Push"])]
    #[case(&[5],5,&["Push","Pop","Push","Pop","Push","Pop","Push","Pop","Push"])]
    #[case(&[4, 5],5,&["Push","Pop","Push","Pop","Push","Pop","Push","Push"])]
    #[case(&[1, 2, 4],4,&["Push","Push","Push","Pop","Push"])]

    fn test_array_stack(#[case] nums: &[i32], #[case] n: i32, #[case] expected: &[&str]) {
        assert_eq!(
            array_stack(nums.to_vec(), n),
            expected
                .iter()
                .map(|x| x.to_string())
                .collect::<Vec<String>>()
        );
    }
}
