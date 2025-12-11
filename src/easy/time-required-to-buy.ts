class Ticket {}
class Person {
	position: number;
	tickets: Ticket[];
	isTarget: boolean;
	constructor(index: number, value: number, k: number) {
		this.isTarget = k === index;
		this.position = index;
		this.tickets = Array.from({ length: value }, () => new Ticket());
	}
	totalTickets() {
		return this.tickets.length;
	}
	canPurchaseTickets(): boolean {
		return this.totalTickets() > 0;
	}
	purchaseTicket() {
		if (this.canPurchaseTickets()) return this.tickets.shift();
	}
}
export const timeRequiredToBuy = (tickets: number[], k: number): number => {
	let time = 0;
	const queue = tickets.map((value, index) => new Person(index, value, k));

	while (true) {
		const person = queue.shift();
		if (!person || (person.isTarget && !person.canPurchaseTickets())) break;

		if (person.canPurchaseTickets()) {
			person.purchaseTicket();
			time++;
			queue.push(person);
		}
	}
	return time;
};
