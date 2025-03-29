const allowedIngredients = new Set(["O", "E", "M", "F", "B"]);
export const canBePrepared = (
    recipe: string,
    ingredients: string[],
    canSubstitute: boolean = false,
): boolean => {
    ingredients.sort((a, b) => a.localeCompare(b));
    const compare = JSON.stringify(ingredients);
    const parseAndCheck = (recipe: string): string[] => {
        let inner = [];
        let outer = [];
        let index = 0;
        if (recipe.length === 1) {
            return [recipe];
        }
        if (recipe.startsWith("(") && recipe.endsWith(")")) {
            parseAndCheck(recipe.slice(1, -1));
        }

        while (index < recipe.length) {
            const ingredient = recipe[index];
            if (/[a-z]/i.test(ingredient)) {
                inner.push(ingredient);
                index += 1;
            }
            if (ingredient === "|") {
                outer.push(inner);
                inner = [];
                index += 1;
            }
            if (ingredient === "(") {
                index += 1;
                return parseAndCheck(recipe.slice(index).trim());
            }
            index += 1;
        }
        return outer;
    };
    const output = [parseAndCheck(recipe)];
    console.log(output);

    return false;
};

console.log(canBePrepared("O", ["O"])); //, true)
console.log(canBePrepared("B", ["O"])); // false)
console.log(canBePrepared("(O&M)", ["O"])); // false)
console.log(canBePrepared("(M&O)", ["O"])); // false)
console.log(canBePrepared("(O|B)", ["O", "B"])); //, true)
console.log(canBePrepared("(M&F)", ["M", "F"])); //, true)
console.log(canBePrepared("(M&F)", ["M", "E"])); // false)
console.log(canBePrepared("(E|(M&F))", ["M", "E"])); //, true)
// console.log(canBePrepared("(E|(M&F))", ["M", "B"]), false)
// console.log(canBePrepared( "( M & F )", ["M", 'F']), true)
// console.log(canBePrepared("(E|(M&F))", ["M", "F"]), true)
// console.log(canBePrepared("(M&(F&G))", [""]))
