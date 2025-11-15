export const frequencySort = (s: string): string => {
    const freq = new Map<string, number>();
    for (const char of s) {
        freq.set(char, (freq.get(char) ?? 0) + 1);
    }
    const result = [...freq.entries()];
    result.sort((a, b) => b[1] - a[1]);

    return result.reduce((a, [char, size]) => a.concat(char.repeat(size)), "");
};
