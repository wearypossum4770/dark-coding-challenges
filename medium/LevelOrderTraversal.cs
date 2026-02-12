namespace Medium;
using System.Collections.Generic;
using DataStructures;
/// <summary>
/// Visit the values of the tree in level order (BFS).
/// Returns a list of lists, where each inner list contains the node values at that level.
/// </summary>
public class LevelOrderTraversal
{
    public IList<IList<int>> Solve(TreeNode? root)
    {
  
        var result = new List<IList<int>>();
        if (root == null) return result;

        var queue = new Queue<TreeNode>();
        queue.Enqueue(root);
        while (queue.Count > 0)
        {
            int size = queue.Count;
            var current = new List<int>(size);
            for( int i = 0; i < size; i++)
            {
                var node = queue.Dequeue();
                current.Add(node.Val);
                if( node.Left != null) queue.Enqueue(node.Left);
                if( node.Right != null) queue.Enqueue(node.Right);
            }
            result.Add(current);
        }
        return result;
    }
}


