const allowedIngredients = new Set(["O", "E", "M", "F", "B"]);
const slicer = (value: string) => {
    if (value.startsWith("(") && value.endsWith(")")) return  value.slice(1, -1)
    if (value.startsWith("(")) return value.slice(1)
    if (value.endsWith(")")) return value.slice(0, -1)
    return value;
}

export const canBePrepared = (
    recipe: string,
    ingredients: string[],
    canSubstitute: boolean = false,
): boolean => {
    const allowed = new Set(ingredients);
        const parser = (recipe: string): boolean [][] => {
        const outer: boolean[][] = []
        if (recipe.length === 1)  return [[allowed.has(recipe)]]
        const handleComplex = (value: string) => {
            let step = [];
            for (const ingredient of value) {
                if (/[a-z]/i.test(ingredient)) {
                    step.push(allowed.has(ingredient));
                } else if (ingredient === "|") {
                    outer.push(step)
                    step = [];
                }
            }
            outer.push(step)
            return step
        }
        handleComplex(slicer(recipe));
        return outer    
    }
    return parser(recipe).map(part=> part.every(Boolean)).some(Boolean)
};

