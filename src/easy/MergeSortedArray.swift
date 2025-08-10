func mergeSortedArrayInPlace(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
	var (i, j, k) = (m - 1, n - 1, m + n - 1)
	while i >= 0 && j >= 0 {
		if nums1[i] >= nums2[j] {
			nums1[k] = nums1[i]
			i -= 1
		}else {
			nums1[k] = nums2[j]
			j -= 1
		}
		k -= 1
	}
	while j >= 0 {
		nums1[k] = nums2[j]
		j -= 1
		k -= 1
	}
}

func mergeSortedArray(_ nums1: [Int], _ m: Int, _ nums2: [Int], _ n: Int) -> [Int]
{
  var result = Array(repeating: 0, count: m + n)
  var (i, j, k) = (0, 0, 0)
	while i < m && j < n {
		if nums1[i] <= nums2[j] {
			result[k] = nums1[i]
			i += 1
		}else {
			result[k] = nums2[j]
			j += 1
		}
		k += 1
	}
	while i < m {
		result[k] = nums1[i]
		i += 1
		k += 1
	}
	while j < n {
		result[k] = nums2[j]
		j += 1
		k += 1
	}
  return result
}

