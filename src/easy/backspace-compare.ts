export const backspaceCompare = (s: string, t: string): boolean => {
	const lhs: string[] = [];
	const rhs: string[] = [];
	let left = 0;
	let right = 0;
	while (true) {
		if (left >= s.length && right >= t.length) break;
		if (s[left]) {
			if (s[left] === "#") lhs.pop();
			else lhs.push(s[left]);
			left++;
		}
		if (t[right]) {
			if (t[right] === "#") rhs.pop();
			else rhs.push(t[right]);
			right++;
		}
	}
	return lhs.join("") === rhs.join("");
};

console.log(backspaceCompare("ab#c", "ad#c"), true);
console.log(backspaceCompare("ab##", "c#d#"), true);
console.log(backspaceCompare("a#c", "b"), false);
