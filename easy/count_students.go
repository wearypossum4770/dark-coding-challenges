package easy

func CountStudents(students, sandwiches []int) int {
	count := 0
	for len(students) > 0 && len(sandwiches) > 0 {
		if count == len(students) {
			break
		}
		if students[0] != sandwiches[0] {
			students = append(students[1:], students[0])
			count++
		} else {
			count = 0
			students = students[1:]
			sandwiches = sandwiches[1:]
		}
	}
	return len(students)
}
