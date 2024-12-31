const summation = (nums: number[]): number => nums.reduce((a, b) => a + b, 0);
/**
 * @description this problem makes use of the
 * [Triangle Inequality Theorem](https://www.mathwarehouse.com/geometry/triangles/triangle-inequality-theorem-rule-explained.php).
 * Using the Transitive Property of Equality A ≤ B ≤ C | A ≥ B ≥ Csu
 * Which states A + B > C | B + C > A | A + C > B
 * [Leet Code](https://leetcode.com/problems/largest-perimeter-triangle/description) #976
 * [Hacker Rank](https://www.hackerrank.com/challenges/maximum-perimeter-triangle/problem)
 */
export const maximumPerimeterTriangle = (sticks: number[]) => {
    const target = { max: 0, group: -1, sides: [] as number[][] };

    for (let i = 0; i < sticks.length - 2; i++) {
        const [a, b, c] = sticks.slice(i, i + 3);
        if (a + b > c) {
            target.sides.push([a, b, c]);
        }
    }
    for (let i = 0; i < target.sides.length; i++) {
        if (target.max < summation(target.sides[i])) {
            target.group = i;
        }
    }
    return target.group > -1 ? target.sides[target.group] : [-1];
};

/**
 * @param  nums
 * @return
 */
const largestPerimeter = (nums: number[]) => {};

const bank = [
    // biome-ignore format: (redability) the array should not be formatted
    // prettier-ignore
    [[1, 1, 1, 2, 3, 5], [1, 1, 1] ],
    [[1, 2, 3], -1],
    [
        [1, 1, 1, 3, 3],
        [1, 3, 3],
    ],
    [
        [3, 9, 2, 15, 3],
        [2, 3, 3],
    ],
    [[50, 2430, 134, 6373, 215, 1502, 926, 10312, 351, 74, 572, 3938], -1],
    [
        [
            9, 2015, 5294, 58768, 285, 477, 72, 13867, 97, 22445, 48, 36318,
            764, 8573, 183, 3270, 81, 1251, 59, 95094,
        ],
        [72, 81, 97],
    ],
    [
        [
            34, 1924, 565, 80, 848, 2913, 819, 732, 431, 32981, 195, 86340, 688,
            563, 7763, 314, 12608, 401, 4845, 439, 353, 52, 208, 20372, 626,
            805, 19, 984, 939, 53354,
        ],
        [848, 939, 984],
    ],
    [[2, 1, 2], 5],
    [[1, 2, 1, 10], 0],
    [[1, 2, 3, 4, 5, 10], 12],
    [[6, 1, 6, 5, 8, 4], 20],
    [[2, 20, 7, 55, 1, 33, 12, 4], null],
    [[33, 6, 20, 1, 8, 12, 5, 55, 4, 9], 41],
];

bank.slice(0, 5).forEach(([a]) => console.log(maximumPerimeterTriangle(a)));
// console.log(perimeter([3,4,5]))
