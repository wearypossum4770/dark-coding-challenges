export const canBePrepared = (
    recipe: string,
    ingredients: string[],
): boolean => {
    const allowed = new Set(ingredients);
    const outer: boolean[] = [];
    const inner: boolean[] = [];
    for (const piece of recipe) {
        switch (piece) {
            case "|":
            case "(":
                if (inner.length > 0) {
                    outer.push(inner.every(Boolean));
                    inner.length = 0;
                }
            default:
                if (/[a-z]/i.test(piece)) inner.push(allowed.has(piece));
        }
    }
    if (inner.length > 0) {
        outer.push(inner.every(Boolean));
        inner.length = 0;
    }
    return outer.some(Boolean);
};
