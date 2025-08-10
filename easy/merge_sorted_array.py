def merge_sorted_array_in_place(nums1: list[int], m: int, nums2: list[int], n: int):
    k = m + n - 1
    m -= 1
    n -= 1
    while m >= 0 and n >= 0:
        if nums1[m] >= nums2[n]:
            nums1[k] = nums1[m]
            m -= 1
        else:
            nums1[k] = nums2[n]
            n -= 1
        k -= 1
    while n >= 0:
        nums1[k] = nums2[n]
        n -= 1
        k -= 1

def merge_sorted_array(nums1: list[int], m: int, nums2: list[int], n: int):
    '''

    '''
    i, j, k = 0, 0, 0
    
    result = [0] * (m + n)
    while i < m and j < n:
        if nums1[i] <= nums2[j]:
            result[k] = nums1[i]
            i += 1
        else:
            result[k] = nums2[j]
            j += 1
        k += 1
    while i < m:
        result[k] = nums1[i]
        i += 1
        k += 1
    while j < n:
        result[k] = nums2[j]
        j += 1
        k += 1
    return result
