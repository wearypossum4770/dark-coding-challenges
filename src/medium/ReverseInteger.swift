func reverseInteger(_ x: Int)-> Int {
	var res = 0
	let sign = x >= 0 ? 1 : -1
	var y = abs(x)
	while y != 0 {
		res = res * 10 + y % 10
		y /= 10
	}
	if res > 0x7FFFFFFF || res < -0x80000000 {
		return 0
	}
	return res * sign
}