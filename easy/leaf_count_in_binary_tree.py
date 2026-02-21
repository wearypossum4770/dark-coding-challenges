from dark_coding_challenges.data_structures.tree_node import TreeNode


def leaf_count_in_binary_tree(root: TreeNode | None) -> int:
    if root is None:
        return 0
    if root.left is None and root.right is None:
        return 1
    return leaf_count_in_binary_tree(root.left) + leaf_count_in_binary_tree(
        root.right
    )
