export const groupAnagrams = (strs: string[]): string[][] => {
    const bank: Map<string, string[]> = new Map();
    for (const word of strs) {
        const key = [...word].toSorted().join("");
        bank.set(key, (bank.get(key) || []).concat(word));
    }
    return [...bank.values()];
};
