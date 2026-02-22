using DataStructures;

namespace Easy;

/// <summary>
/// Determines if the path's sum is equal to a target value.
/// </summary>
public class TreePathHasSum
{
    /// <summary>
    /// returns if the path's tally is equal to the target.
    /// </summary>
    /// <param name="root"></param>
    /// <param name="targetSum"></param>
    /// <returns></returns>
    public bool Solve(TreeNode? root, int targetSum)
    {
        if (root == null)
            return false;
        if (targetSum == root.Val)
            return true;
        int remainder = targetSum - root.Val;
        return Solve(root.Left, remainder) || Solve(root.Right, remainder);
    }
}
