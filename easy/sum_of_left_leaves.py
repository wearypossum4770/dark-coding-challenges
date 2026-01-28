from dark_coding_challenges.data_structures.tree_node import TreeNode


def sum_of_left_leaves(root: TreeNode | None) -> int:
    counter = 0
    if root is None:
        return counter
    stack = [(root, False)]
    while stack:
        current, is_left = stack.pop()
        if current is None:
            continue
        if current.left is None and current.right is None and is_left:
            counter += current.val
        if current.left is not None:
            stack.append((current.left, True))
        if current.right is not None:
            stack.append((current.right, False))
    return counter
