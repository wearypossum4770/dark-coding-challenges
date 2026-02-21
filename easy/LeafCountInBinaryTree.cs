namespace Easy;

using DataStructures;

public class LeafCountInBinaryTree
{
    public int Solve(TreeNode? root)
    {
        if (root == null)
            return 0;
        if (root.Left == null && root.Right == null)
            return 1;
        return this.Solve(root.Left) + this.Solve(root.Right);
    }
}
