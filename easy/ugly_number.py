def ugly_number(n: int) -> bool:
    """
    [LeetCode](https://leetcode.com/problems/ugly-number/)
    """
    if n < 1:
        return False
    primes = [2, 3, 5]
    for num in primes:
        while n % num == 0:
            n //= num
    return n == 1
