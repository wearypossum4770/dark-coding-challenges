pub fn find_content_children(mut children: Vec<u16>, mut cookies: Vec<u16>) -> u8 {
    children.sort_unstable();

    cookies.sort_unstable();

    let mut child_iter = children.iter();
    let mut current_child = child_iter.next();

    let mut count: u8 = 0;
    for cookie in cookies {
        if let Some(child) = current_child {
            if &cookie >= child {
                count += 1;
                current_child = child_iter.next();
            }
        } else {
            break;
        }
    }
    count
}
#[cfg(test)]
mod tests {
    use super::find_content_children;
    use rstest::rstest;

    #[rstest]
    #[case(vec![1, 2, 3], vec![1, 1], 1)]
    #[case(vec![1, 2], vec![1, 2, 3], 2)]
    #[case(vec![10, 9, 8, 7], vec![5, 6, 7, 8], 2)]
    #[case(vec![], vec![1, 2], 0)]
    #[case(vec![1, 2], vec![], 0)]

    fn test_find_content_children(
        #[case] children: Vec<u16>,
        #[case] cookies: Vec<u16>,
        #[case] outcome: u8,
    ) {
        assert_eq!(find_content_children(children, cookies), outcome);
    }
}
