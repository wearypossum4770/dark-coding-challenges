const allowedIngredients = new Set(["O", "E", "M", "F", "B"]);
const slicer = (value: string) => (value.startsWith("(") && value.endsWith(")")) ? value.slice(1, -1) : value

export const canBePrepared = (
    recipe: string,
    ingredients: string[],
    canSubstitute: boolean = false,
): boolean => {
    const allowed = new Set(ingredients);
    
    const parser = (recipe: string): string[][] => {
        const outer: string[][] = []
        if (recipe.length === 1)  return [[recipe]]
        const handleComplex = (value: string) => {
            let step = [];
            for (const ingredient of value) {
                if (/[a-z]/i.test(ingredient)) {
                    step.push(ingredient);
                } else if (ingredient === "|" || ingredient === "(") {
                    if (step.length === 0) continue
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
 
    return parser(recipe).map(item => item.map(ingredients=> allowed.has(ingredients)).some(x=> !x))

};

console.log(canBePrepared("O", ["O"])); //, true)
console.log(canBePrepared("B|O", ["O"])); //, true)
console.log(canBePrepared("B", ["O"])); // false)
console.log(canBePrepared("(O&M)", ["O"])); // false)
console.log(canBePrepared("(M&O)", ["O"])); // false)
console.log(canBePrepared("(O|B)", ["O", "B"])); //, true)
console.log(canBePrepared("(M&F)", ["M", "F"])); //, true)
console.log(canBePrepared("(M&F)", ["M", "E"])); // false)
console.log(canBePrepared("(E|(M&F))", ["M", "E"])); //, true)
console.log(canBePrepared("(E|(M&F))", ["M", "B"]), false)
console.log(canBePrepared( "( M & F )", ["M", 'F']), true)
console.log(canBePrepared("(E|(M&F))", ["M", "F"]), true)
console.log(canBePrepared("(M&(F&G))", [""]))
