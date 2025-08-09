export const mergeSortedArrayInPlace = (
    nums1: number[],
    m: number,
    nums2: number[],
    n: number,
): void => {
    let [i, j, k] = [m - 1, n - 1, m + n - 1];
    while (i >= 0 && j >= 0) {
        if (nums1[i] >= nums2[j]) {
            nums1[k] = nums1[i];
            i--;
        } else {
            nums1[k] = nums2[j];
            j--;
        }
        k--;
    }
    while (j >= 0) {
        nums1[k] = nums2[j];
        j--;
        k--;
    }
};
