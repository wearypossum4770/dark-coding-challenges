package easy
fun kodeeFindLucky(arr: IntArray): Int  {
	var result = IntArray(arr.max() + 1) { 0 }
	var i = result.size - 1
	for(num in arr) {
		result[num]++
	} 
	while( i > 0) {
		if(result[i] == i) return i
		i--
	}
	return - 1
}