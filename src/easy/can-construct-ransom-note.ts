export const canConstructRansomNote = (
    ransomNote: string,
    magazine: string,
): boolean => {
    const result = Array(26).fill(0);

    Array.from(magazine.toLowerCase()).forEach(
        (value) => (result[value.charCodeAt(0) - 97] += 1),
    );

    for (const char of ransomNote) {
        result[char.charCodeAt(0) - 97] -= 1;
        if (result[char.charCodeAt(0) - 97] < 0) return false;
    }
    return true;
};
