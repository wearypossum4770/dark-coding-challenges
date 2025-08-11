func singleNumber(_ nums: [Int])-> Int {
return nums.reduce(0) {x, y in x ^ y }
}
