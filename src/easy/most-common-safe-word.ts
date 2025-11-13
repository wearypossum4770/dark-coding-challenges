export const mostCommonSafeWord = (
    paragraph: string,
    banned: string[],
): string => {
    const freq = new Map<string, number>();

    for (const word of paragraph
        .toLowerCase()
        .replaceAll(/[!?',;.]/gm, " ")
        .split(" ")) {
        if (word.trim().length > 0 && !banned.includes(word)) {
            freq.set(word, (freq.get(word) ?? 0) + 1);
        }
    }
    const collected = [...freq.entries()];
    collected.sort((a, b) => b[1] - a[1]);
    return collected[0][0];
};
