def find_content_children(children: [int], cookies: [int]) -> int:
    if not children or not cookies:
        return 0
    children.sort()
    cookies.sort()
    i, j = 0, 0
    while i < len(children) and j < len(cookies):
        if cookies[j] >= children[i]:
            i += 1
        j += 1
    return i
