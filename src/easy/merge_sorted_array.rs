pub fn merge_sorted_array_in_place(nums1: &mut Vec<i32>, m: i32, nums2: &mut Vec<i32>, n: i32) {
    let mut i = (m - 1) as isize;
    let mut j = (n - 1) as isize;
    let mut k = (m + n - 1) as isize;

    while j >= 0 {
        if i >= 0 && nums1[i as usize] > nums2[j as usize] {
            nums1[k as usize] = nums1[i as usize];
            i -= 1;
        } else {
            nums1[k as usize] = nums2[j as usize];
            j -= 1;
        }
        k -= 1;
    }
}

#[cfg(test)]
mod tests {
    use super::merge_sorted_array_in_place;
    use rstest::rstest;

    #[rstest]
    #[case(vec![1,2,3,0,0,0], 3, vec![2,5,6], 3, vec![1,2,2,3,5,6])]
    #[case(vec![1], 1, vec![], 0, vec![1],)]
    #[case(vec![0], 0, vec![1], 1, vec![1])]
    #[case(vec![4,5,6,0,0,0], 3, vec![1,2,3], 3, vec![1,2,3,4,5,6])]
    #[case(vec![2,0], 1, vec![1], 1, vec![1,2])]
    #[case(vec![], 0, vec![], 0, vec![])]
    fn test_merge_sorted_array_in_place(
        #[case] mut nums1: Vec<i32>,
        #[case] m: i32,
        #[case] mut nums2: Vec<i32>,
        #[case] n: i32,
        #[case] expected: Vec<i32>,
    ) {
        merge_sorted_array_in_place(&mut nums1, m, &mut nums2, n);
        assert_eq!(nums1, expected);
    }
}
