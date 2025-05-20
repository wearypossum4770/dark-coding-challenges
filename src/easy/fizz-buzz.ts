export const fizzBuzz = (n: number): string[] =>
    [...Array(n + 1).keys()].slice(1).map((index) => {
        if (index % 15 === 0) return "FizzBuzz";
        if (index % 5 === 0) return "Buzz";
        if (index % 3 === 0) return "Fizz";
        return index.toString();
    });
