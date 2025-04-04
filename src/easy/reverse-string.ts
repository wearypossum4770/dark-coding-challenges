export const reverseString = (s: string[]) => {
    let left = 0;
    let right = s.length - 1;
    let char;
    while (left <= right) {
        char = s[left];
        s[left] = s[right];
        s[right] = char;
        left++;
        right--;
    }
};
