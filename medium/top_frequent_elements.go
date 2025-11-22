package medium

import (
	"maps"
	"slices"
)

type Bucket struct {
	Num   int
	Count int
}

func GetBucketCounts(buckets []*Bucket, limit int) []int {
	result := make([]int, limit)
	for i := range limit {
		result[i] = buckets[i].Num
	}
	return result
}
func TopFrequentElements(nums []int, k int) []int {
	result := make(map[int]*Bucket)
	for _, num := range nums {
		if _, exists := result[num]; !exists {
			result[num] = &Bucket{Num: num}
		}
		result[num].Count++
	}
	buckets := slices.Collect(maps.Values(result))
	slices.SortFunc(buckets, func(lhs, rhs *Bucket) int {
		return rhs.Count - lhs.Count
	})

	return GetBucketCounts(buckets, k)
}
