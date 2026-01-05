from collections import deque
from typing import Optional

from easy.data_structures import TreeNode


def in_order_traversal(root: TreeNode | None) -> list[int]:
    result = []

    def traverse(node):
        if not node:
            return
        traverse(node.left)
        result.append(node.val)
        traverse(node.right)

    traverse(root)
    return result


node = in_order_traversal(TreeNode.from_list([1, None, 2, 3]))
print(node)
