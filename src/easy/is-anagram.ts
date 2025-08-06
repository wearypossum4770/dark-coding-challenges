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


export const DetectAnagram = (word: string, candidates: string[]): string[] => {
    const lowerWord = word.toLowerCase();
    return candidates.flatMap((candidate) => {
    const lowerCandidate = candidate.toLowerCase()
    return lowerCandidate !== lowerWord && isAnagram(lowerWord, lowerCandidate) ? candidate : []

    })
}