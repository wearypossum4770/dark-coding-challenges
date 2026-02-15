
using DataStructures;

namespace Easy;
/// <summary>
/// 
/// </summary>
public class MaxDepth
{
    /// <summary>
    /// 
    /// </summary>
    /// <param name="root"></param>
    /// <returns></returns>
    public int Solve(DataStructures.TreeNode? root)
    {
        return (root == null) ? 0 : Math.Max(Solve(root.Left),
        Solve(root.Right)) + 1;
    }
}
