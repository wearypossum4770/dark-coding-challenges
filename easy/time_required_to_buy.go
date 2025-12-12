package easy

type Person struct {
	tickets  int
	original bool
}

func (p *Person) purchaseTicket() {
	if p.tickets > 0 {
		p.tickets--
	}
}
func TimeRequiredToBuy(tickets []int, k int) int {
	elapsedTime := 0
	queue := make([]*Person, len(tickets))
	for i, v := range tickets {
		queue[i] = &Person{tickets: v, original: i == k}
	}
	for len(queue) > 0 {
		person := queue[0]
		queue = queue[1:]
		person.purchaseTicket()
		elapsedTime++
		if person.tickets == 0 && person.original {
			return elapsedTime
		}
		if person.tickets > 0 {
			queue = append(queue, person)
		}
	}
	return elapsedTime
}
