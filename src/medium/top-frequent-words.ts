export const topFrequentWords = (words: string[], k: number): string[] => {
    const freq = new Map<string, number>();
    words.forEach((word) => freq.set(word, (freq.get(word) ?? 0) + 1));
    return freq
        .entries()
        .toArray()
        .toSorted((a, b) => b[1] - a[1] || a[0].localeCompare(b[0]))
        .slice(0, k)
        .map(([k, v]) => k);
};
