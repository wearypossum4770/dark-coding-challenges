#include "student_minimum_moves_to_seat.h"

int studentMinimumMovesToSeat(std::vector<int>& seats, std::vector<int> & students) {
	int moves = 0;
	sort(seats.begin(), seats.end());
	sort(students.begin(), students.end());
	for(size_t i = 0; i < seats.size(); i++) {
		moves += std::abs(seats[i] - students[i]);
	}
	return moves;
}