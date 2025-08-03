import { frequencyMap } from "@/src/helpers/itertools";
export const isAnagram = (s: string, t: string): boolean => {
    const frequency = frequencyMap(s);
    for (const char of t) {
        if (!frequency.has(char)) {
            return false;
        }
        frequency.set(char, (frequency.get(char) ?? 0) - 1);
    }
    return ![...frequency.values()].some((v) => v !== 0);
};
