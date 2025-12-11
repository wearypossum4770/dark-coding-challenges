class TicketPerson:
    def __init__(self, index: int, value: int, k: int):
        self.tickets = value
        self.original = index == k

    def decrement(self):
        if self.tickets > 0:
            self.tickets -= 1

    def __str__(self):
        return f"\nPerson(tickets={self.tickets}, is_original = {self.original})\n"

    def __repr__(self):
        return f"\nPerson(tickets={self.tickets}, is_original = {self.original})\n"


def time_required_to_buy(tickets: list[int], k: int) -> int:
    time_clock = 0
    queue = [
        TicketPerson(index, value, k) for index, value in enumerate(tickets)
    ]
    while len(tickets) > 0:
        person = queue.pop(0)
        if person.tickets > 0:
            person.decrement()
            time_clock += 1
        if person.original and person.tickets == 0:
            break
        if person.tickets > 0:
            queue.append(person)
    return time_clock
