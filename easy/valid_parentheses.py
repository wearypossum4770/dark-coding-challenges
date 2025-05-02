def valid_parentheses(s: str) -> bool:
    brackets = {"(": ")", "{": "}", "[": "]"}
    stack = []
    for char in s:
        if brackets.get(char) is not None:
            stack.append(char)
        else:
            if len(stack) == 0 or brackets.get(stack[-1]) != char:
                return False
            stack.pop()
    return len(stack) == 0
