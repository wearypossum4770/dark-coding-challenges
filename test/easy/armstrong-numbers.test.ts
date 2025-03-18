import { describe, test, expect } from "bun:test";
import { armstrongNumbers } from "@/src/easy/armstrong-numbers";
describe("Feature: Armstrong Number", () => {
    describe("Scenario: Check if a number is an Armstrong Number", () => {
        test.each([
            [2, 1],
            [89, 0],
            [0, 1],
            [39, 0],
            [555, 0],
            [9475, 0],
            [9926315, 1],
            [93084, 1],
            [548834, 1],
            [2147483647, 0],
            [365, 0],
            [120, 0],
            [1253, 0],
            [153, 1],
            [-153, 0],
            [407, 1],
            [370, 1],
            [371, 1],
            [1634, 1],
            [8208, 1],
            [9474, 1],
        ])(
            "Given: A number %s determine if it is an Armstrong number %p",
            (inputs: number, output: number) => {
                const result = armstrongNumbers(inputs);
                expect(result).toEqual(output);
            },
        );
    });
});
