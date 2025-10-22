export const numOfUnplacedFruits = (
    fruits: number[],
    baskets: number[],
): number => {
    let n = fruits.length;
    const replaced = Array(baskets.length).fill(false);
    let left = 0;
    while (left < fruits.length) {
        let right = 0;
        while (right < baskets.length) {
            if (baskets[right] >= fruits[left] && !replaced[right]) {
                replaced[right] = true;
                n--;
                break;
            }
            right++;
        }
        left++;
    }
    return n;
};
