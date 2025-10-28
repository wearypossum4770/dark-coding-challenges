const check = (word: string): boolean => {
    let left = 0;
    let right = word.length - 1;
    while (left < right) {
        if (word[left] !== word[right]) return false;
    }
    return true;
};
export const findFirstPalindrome = (words: string[]): string => {
    for (const word of words) {
        if (check(word)) return word;
    }
    return "";
};
