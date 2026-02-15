from dark_coding_challenges.data_structures.tree_node import TreeNode


def max_depth(root: TreeNode | None) -> int:
    if root is None:
        return 0
    return max(max_depth(root.left), max_depth(root.right)) + 1
