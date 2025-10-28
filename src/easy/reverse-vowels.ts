export const reverseVowels = (s: String): String => {
    const result = s.split("");
    let left = 0;
    let right = result.length - 1;
    while (left <= right) {
        if (!/[aeiou]/i.test(result[left])) {
            left++;
        } else if (!/[aeiou]/i.test(result[right])) {
            right--;
        } else {
            const temp = result[left];
            result[left] = result[right];
            result[right] = temp;
            right--;
            left++;
        }
    }

    return result.join("");
};
