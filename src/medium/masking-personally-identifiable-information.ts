export const maskEmail = (s: string): string => {
	const result: string[] = []
	const domain = s.indexOf("@")
	for(let i = 0; i < s.length; i++) {
		if(i === 0) {
			result.push(s[i], "*****")
		}else if(i === domain - 1 || i >= domain) {
			result.push(s[i])
		}
	}
		return result.join("")
}
export const maskPhone = (s: string): string => {
	const result: string[] = []
	let count = 0;
	let chars = 0;
	for(let i = s.length - 1; i >= 0; i--) {
		if(s[i].charCodeAt(0) < 48 || s[i].charCodeAt(0) > 57) continue;
		if(count === 4|| count === 8 || count === 12) {
			result.unshift("-")
			count++;
		}
		if(count <= 4) {
			result.unshift(s[i])
		}else {
			result.unshift("*")
		}
		count++
		chars++
	}
	if(chars > 10) {
		result.unshift("+")
	}
	return result.join("")
}
export const maskingPersonallyIdentifiableInformation = (s: string): string => (s.includes("@")) ? maskEmail(s.toLowerCase()) : maskPhone(s)
