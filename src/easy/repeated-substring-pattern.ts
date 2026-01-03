export const repeatedSubstringPattern = (s: string): boolean => {
	const n = s.length;
	if(n < 2) return false;

	for(let len = 1; len <= n / 2; len++) {
		if( n % len !== 0) continue;
		let valid = true
		for(let i = len; i < n; i++)  {
			if(s[i] !== s[i % len])  {
				valid = false;
				break;
			}
		}
		if(valid) return true
	}
	return false;
}
