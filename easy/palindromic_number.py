def palindromic_number(num):
    """
    Determine if number is a palindrome
    Leet Code
    website: https://leetcode.com/problems/palindrome-number/
    +--------------+------------------------+---------------------------+
    | Name         | Resource               | percentile                |
    +==============+========================+===========================+
    | Memory       | 16.50 MB               | 92.89%                    |
    +--------------+------------------------+---------------------------+
    | Runtime      | 48 ms                  | 83.45%                    |
    +--------------+------------------------+---------------------------+

    """
    if num < 0:
        return False
    x = str(num)
    return x == x[::-1]
