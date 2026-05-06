pub fn student_minimum_moves_to_seat(seats: Vec<i64>, students: Vec<i64>) -> i64{
	let mut children = students;
	let mut chairs = seats;
	children.sort();
	chairs.sort();

	chairs.iter().enumerate().fold(0, |accumulator, (i, &seat)| accumulator + (seat - children[i]).abs())

}
