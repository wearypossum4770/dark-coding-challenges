export const sortArrayByParity = (nums: number[]): number[] => {
    const result = Array(nums.length);
    let even = 0;
    let odd = nums.length - 1;
    nums.forEach((num) => {
        if (num % 2 === 0) {
            result[even] = num;
            even++;
        } else {
            result[odd] = num;
            odd--;
        }
    });
    return result;
};
