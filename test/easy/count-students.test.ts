import { describe, test, expect } from "bun:test";
import { countStudents } from "@/src/easy/count-students";
describe("countStudents", () => {
    test.each([
        [[1, 1, 0, 0], [0, 1, 0, 1], 0],
        [[1, 1, 1, 0, 0, 1], [1, 0, 0, 0, 1, 1], 3],
        [[0, 0, 0], [0, 0, 0], 0],
        [[1, 1, 1], [1, 1, 1], 0],
        [[1, 0, 1, 0], [1, 0, 1, 0], 0],
        [[0, 1, 0, 1], [1, 0, 1, 0], 0],
        [[1], [0], 1],
        [[0], [1], 1],
        [[0], [0], 0],
        [[1], [1], 0],
        [[0, 1, 0, 1, 1, 0], [1, 1, 0, 0, 0, 1], 0],
        [[1, 1, 1, 1, 1], [0, 0, 0, 0, 0], 5],
        [[0, 0, 0, 0, 0], [1, 1, 1, 1, 1], 5],
    ])(
        "\n\tGiven: a queue of students %p and a stack of sandwiches %p.\n\tThen: there will be %i hungry students.",
        (students: number[], sandwiches: number[], output: number) => {
            const result = countStudents(students, sandwiches);
            expect(result).toStrictEqual(output);
        },
    );
});
