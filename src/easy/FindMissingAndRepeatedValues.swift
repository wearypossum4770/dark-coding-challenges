func findMissingAndRepeatedValues(_ grid: [[Int]])-> [Int] {
	let square = grid.count * grid.count
	var expected = square * (square + 1) / 2
	var counts = Set<Int>()
	var repeated = 0
	for row in grid {
		for cell in row {
			if counts.contains(cell) {
				repeated = cell
			}else {
				counts.insert(cell)
				expected -= cell
			}
		}
	}
	return [repeated, expected]
}