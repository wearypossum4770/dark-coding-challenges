export const addBinary = (a: string, b: string): string => {
    let i = a.length - 1;
    let j = b.length - 1;
    let carry = 0;
    const target = Array(Math.max(a.length, b.length));
		let k = target.length;
    while (i >= 0 || j >= 0 || carry > 0) {
        let sum = carry;
			
				if (i >= 0) sum += a.charCodeAt(i) - 48;
        if (j >= 0) sum += b.charCodeAt(j) - 48;

				target[k] = sum % 2
        carry = Math.floor(sum / 2);
				k--
        i--;
        j--;
    }

			return target.join("");
};
 
