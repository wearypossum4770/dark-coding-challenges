package easy

func MergeSortedArrayInPlace(nums1 []int, m int, nums2 []int, n int) {
	i, j := m-1, n-1
	index := m + n - 1

	for i >= 0 && j >= 0 {
		if nums1[i] > nums2[j] {
			nums1[index] = nums1[i]
			i--
		} else {
			nums1[index] = nums2[j]
			j--
		}
		index--
	}
	for j >= 0 {
		nums1[index] = nums2[j]
		j--
		index--
	}
}
func MergeSortedArray(nums1 []int, m int, nums2 []int, n int) []int {

	i, j, k := 0, 0, 0
	size := m + n
	result := make([]int, size)
	for i < m && j < n {
		if nums1[i] <= nums2[j] {
			result[k] = nums1[i]
			i++
		} else {
			result[k] = nums2[j]
			j++
		}
		k++
	}
	for i < m {
		result[k] = nums1[i]
		i++
		k++
	}
	for j < n {
		result[k] = nums2[j]
		j++
		k++
	}
	return result
}
