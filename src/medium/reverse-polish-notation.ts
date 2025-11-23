const performArithmetic = (a: number, b: number, operation: string): number => {
    switch (operation) {
        default:
            return a + b;
        case "-":
            return a - b;
        case "*":
            return a * b;
        case "/":
            return Math.trunc(a / b);
    }
};
export const reversePolishNotation = (tokens: string[]): number => {
    const stack: number[] = [];
    for (const token of tokens) {
        if (/\d+/.test(token)) stack.push(Number(token));
        else {
            const rhs = stack.pop() ?? 0;
            const lhs = stack.pop() ?? 0;
            stack.push(performArithmetic(lhs, rhs, token));
        }
    }
    return stack.pop() ?? 0;
};
