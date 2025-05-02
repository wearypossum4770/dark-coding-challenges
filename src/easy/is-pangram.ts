export const isPangram = (text: string): boolean =>
    new Set(text.replaceAll(/[^a-z]/gi, "").toLowerCase()).size === 26;
