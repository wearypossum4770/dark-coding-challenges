from collections import deque

from dark_coding_challenges.data_structures.tree_node import TreeNode


def level_order_traversal(root: TreeNode | None) -> list[list[int]]:
    if root is None:
        return []
    result, queue = [], deque([root])
    level = 0
    while queue:
        level += 1
        current, size = [], len(queue)
        for _ in range(size):
            node = queue.popleft()
            current.append(node.val)
            if node.left:
                queue.append(node.left)
            if node.right:
                queue.append(node.right)
        result.append(current)
    return result
