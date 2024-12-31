export const separateNumbers = (magic: string): "YES" | "NO" => {
    const len = magic.length;
    if (len < 2 || len > 32) return "NO";
    const nums = [...magic].map(Number);
    for (let i = 0; i < len; i++) {
        if (i === 0) continue;
        if (i === 1 && nums[i] === 0) return "NO";
        if (nums[i] - nums[i - 1] !== 1) return "NO";
    }
    return "YES";
};

// console.log(separateNumbers('99910001001'))
console.log(separateNumbers("1234"), "YES");
console.log(separateNumbers("1234"), "YES");
console.log(separateNumbers("91011"), "YES");
console.log(separateNumbers("99100"), "NO");
console.log(separateNumbers("101103"), "NO");
console.log(separateNumbers("010203"), "NO");
console.log(separateNumbers("13"), "NO");
console.log(separateNumbers("1"), "NO");
console.log(separateNumbers("100101"), "NO");

// / 219(a)(1)
