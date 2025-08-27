def add_binary(a: str, b: str) -> str:
    res = ["0"] * (max(len(a), len(b)) + 1)
    i, j, k, carry = len(a) - 1, len(b) - 1, len(res) - 1, 0
    while i >= 0 or j >= 0 or carry > 0:
        s = carry
        if i >= 0:
            s += ord(a[i]) - ord("0")
            i -= 1
        if j >= 0:
            s += ord(b[j]) - ord("0")
            j -= 1
        res[k] = str(s % 2)
        carry = s // 2
        k -= 1
    return "".join(res[k + 1 :])
