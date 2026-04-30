from dark_coding_challenges.data_structures.tree_node import TreeNode


def minimum_depth_binary_tree(root: TreeNode | None) -> int:
    """
    :type root: Optional[TreeNode]
    :rtype: int
    """
    if root is None:
        return 0
    left, right = root.left, root.right
    if left is None and right is None:
        return 1
    if left is None:
        return 1 + minimum_depth_binary_tree(right)
    if right is None:
        return 1 + minimum_depth_binary_tree(left)
    return 1 + min(
        minimum_depth_binary_tree(left), minimum_depth_binary_tree(right)
    )
