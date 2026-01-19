from dark_coding_challenges.data_structures.tree_node import TreeNode


def pre_order_traversal(root: TreeNode) -> list[int]:
    if not root:
        return []
    result = []
    stack = [root]
    while stack:
        current = stack.pop()
        if current.val is not None:
            result.append(current.val)
        if current.right:
            stack.append(current.right)
        if current.left:
            stack.append(current.left)
    return result
