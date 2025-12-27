export const licenseKeyFormatting = (s: string, k: number): string => {
	const result = s.replace(/-/g, "").toUpperCase()
	const target = []
	let position = 0;
	let temp = ""
for(let i = result.length - 1; i >= 0; i--) {
		temp = result[i] + temp
	position++;

	if(position === k) {
		position = 0
		target.unshift(temp)
		temp = ""
	}
} if (temp.length > 0) {
    target.unshift(temp);
  }
	return target.join("-")
}
