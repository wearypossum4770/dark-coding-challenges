import { describe, test, expect } from "bun:test";
import { fizzBuzz } from "@/src/easy/fizz-buzz";

describe("Feature: FizzBuzz", () => {
    describe("\n\tScenario Outline: Convert an integer to range of FizzBuzz representations", () => {
        test.each([
            [
                5,
                // prettier-ignore
                ["1", "2", "Fizz", "4", "Buzz"],
            ],
            [
                3,
                // prettier-ignore
                ["1", "2", "Fizz"],
            ],
            [
                16,
                // prettier-ignore
                ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz","16"],
            ],
            [
                15,
                // prettier-ignore
                ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14", "FizzBuzz"],
            ],
            [
                35,
                // prettier-ignore
                ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz","16","17","Fizz","19","Buzz","Fizz","22","23","Fizz","Buzz","26","Fizz","28","29","FizzBuzz","31","32","Fizz","34","Buzz"],
            ],
        ])(
            "\n\t\tTest Case %#\n\t\tGiven: the integer %i.\n\t\tWhen: counting by FizzBuzz.\n\t\tThen: the result should be %j",
            (candidate: number, output: string[]) => {
                const result = fizzBuzz(candidate);
                expect(result).toStrictEqual(output);
            },
        );
    });
});
