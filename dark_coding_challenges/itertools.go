package dark_coding_challenges

import (
	"fmt"
)

type Range[T Ordered] struct {
	Stop    T
	Start   T
	Initial T
}
type Ordered interface {
	~int | ~float64 | ~int64
}
type MaxMin[T Ordered] struct {
	min      T
	max      T
	argError error
}
type Mathematics interface {
	~int | ~int8 | ~int16 | ~int32 | ~int64 | ~float32 | ~float64
}

func Ternary[T comparable](condition bool, a, b T) T {
	if condition {
		return a
	}
	return b
}
func ArrayRange(n int) []int {
	if n <= 0 {
		return []int{}
	}
	result := make([]int, n)
	for i := 1; i <= n; i++ {
		result[i-1] = i
	}
	return result
}
func ArrayFromRange[T Ordered](r Range[T]) []T {
	if r.Stop <= r.Start {
		return []T{}
	}
	size := int(r.Stop - r.Start)
	arr := make([]T, size)
	for i := 0; i < size; i++ {
		arr[i] = r.Start + T(i) + T(r.Initial)
	}
	return arr
}

func Array[T comparable](value T, count int) []T {
	s := make([]T, count)
	for i := range s {
		s[i] = value
	}
	return s
}
func FillSliceWith(val, count int) []int {
	s := make([]int, count)
	for i := range s {
		s[i] = val
	}
	return s
}

func ArrayReduce[T Mathematics](values []T) T {
	var total T
	for _, num := range values {
		total += num
	}
	return total
}
func Reduce[T, M any](s []T, f func(M, T) M, initialValue M) M {
	acc := initialValue
	for _, v := range s {
		acc = f(acc, v)
	}
	return acc
}
func SetContains[T comparable](set map[T]bool, arr []T) []bool {
	result := make([]bool, len(arr))
	for i, value := range arr {
		_, exists := set[value]
		result[i] = exists
	}
	return result
}

func AllNestedTrue[T comparable](arr [][]T) bool {
	var zero T
	for _, i := range arr {
		for _, j := range i {
			if j == zero {
				return false
			}
		}
	}
	return true
}

func LastItem[T comparable](values []T) T {
	return values[len(values)-1]
}

func AnyTrue[T comparable](values []T) bool {
	var zero T
	for _, v := range values {
		if v != zero {
			return true
		}
	}
	return false
}
func CreateSetFromString(text string) map[rune]bool {
	set := make(map[rune]bool)
	for _, char := range text {
		set[char] = true
	}
	return set
}
func CreateSetLike[T comparable](values []T) map[T]bool {
	set := make(map[T]bool)
	for _, v := range values {
		set[v] = true
	}
	return set
}
func Counter[T comparable](values []T) map[T]int {
	m := make(map[T]int)
	for _, v := range values {
		m[v]++
	}
	return m
}
func OneOf[T comparable](current T, values []T) bool {
	for _, v := range values {
		if v == current {
			return true
		}
	}
	return false
}
func AllTrue[T comparable](values []T) bool {
	var zero T
	for _, v := range values {
		if v == zero {
			return false
		}
	}
	return true
}
func ArrayPop[T any](s []T) ([]T, T) {
	last := s[len(s)-1]
	s = s[:len(s)-1]
	return s, last
}
func StringSlicesEqual(a, b []string) bool {
	if len(a) != len(b) {
		return false
	}
	counts := make(map[string]int)
	for _, val := range a {
		counts[val]++
	}
	for _, val := range b {
		counts[val]--
		if counts[val] < 0 {
			return false
		}
	}
	for _, c := range counts {
		if c != 0 {
			return false
		}
	}
	return true
}
func SlicesEqual(a, b []int) bool {
	if len(a) != len(b) {
		return false
	}

	counts := make(map[int]int)
	for _, val := range a {
		counts[val]++
	}
	for _, val := range b {
		counts[val]--
		if counts[val] < 0 {
			return false
		}
	}

	// All counts should be zero if equal
	for _, c := range counts {
		if c != 0 {
			return false
		}
	}

	return true
}
func FindMaxAndMin[T Ordered](arr []T) MaxMin[T] {
	if len(arr) == 0 {
		value := T(0)
		return MaxMin[T]{
			min:      value,
			max:      value,
			argError: fmt.Errorf("empty slice"),
		}
	}
	min, max := arr[0], arr[0]
	for _, value := range arr {
		if value < min {
			min = value
		}
		if value > max {
			max = value
		}
	}
	return MaxMin[T]{
		min:      min,
		max:      max,
		argError: nil,
	}
}
func IndexOf(arr []string, search string) int {
	for i, value := range arr {
		if value == search {
			return i
		}
	}
	return -1
}
func IndexOfNumericSlice[T Ordered](arr []T, search T) int {
	for i, value := range arr {
		if value == search {
			return i
		}
	}
	return -1
}

func CharToDigit(c rune) int {
	switch {
	case c >= '0' && c <= '9':
		return int(c - '0')
	case c >= 'A' && c <= 'Z':
		return int(c - 'A' + 10)
	case c >= 'a' && c <= 'z':
		return int(c - 'a' + 10)
	default:
		return -1 // invalid
	}
}

func CharToDigitByte(c byte) byte {
	switch {
	case c >= '0' && c <= '9':
		return c - '0'
	case c >= 'A' && c <= 'Z':
		return c - 'A' + 10
	case c >= 'a' && c <= 'z':
		return c - 'a' + 10
	default:
		return 0xFF // sentinel for invalid
	}
}

func ArrayMax[T Ordered](arr []T) T {
	result := arr[0]
	for _, v := range arr {
		if result < v {
			result = v
		}
	}
	return result
}
func ArrayMin[T Ordered](arr []T) T {
	result := arr[0]
	for _, v := range arr {
		if result > v {
			result = v
		}
	}
	return result
}
