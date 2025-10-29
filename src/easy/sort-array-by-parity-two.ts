export const sortArrayByParityTwo = (nums: number[]): number[] => {
    const result = Array(nums.length);
    let even = 0;
    let odd = 0;
    for (const num of nums) {
        if (num % 2 === 0) {
            result[even] = num;
            even += 2;
        } else {
            result[odd] = num;
            odd += 2;
        }
    }
    return result;
};
