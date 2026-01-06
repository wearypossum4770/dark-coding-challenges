const months = [
	"Jan",
	"Feb",
	"Mar",
	"Apr",
	"May",
	"Jun",
	"Jul",
	"Aug",
	"Sep",
	"Oct",
	"Nov",
	"Dec",
];
export const reformatDate = (date: string): string => {
	const [d, m, year] = date.split(" ");
	let day = 0;
	const month = months.indexOf(m) + 1;
	for (const char of d) {
		if (char.charCodeAt(0) >= 48 && char.charCodeAt(0) <= 57) {
			day = day * 10 + Number(char);
		}
	}
	return `${year}-${month.toString().padStart(2, "0")}-${day.toString().padStart(2, "0")}`;
};
