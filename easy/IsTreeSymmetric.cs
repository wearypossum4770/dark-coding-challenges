using DataStructures;
namespace Easy;

public class IsTreeSymmetric {
	public bool Solve(DataStructures.TreeNode? root) {
		if(root == null) return true;

		bool CheckMirror(DataStructures.TreeNode? left, DataStructures.TreeNode? right)
		{
		if(left == null && right == null)	 return true;
		if(left == null || right == null) return false;
		return left?.Val == right?.Val && CheckMirror(left?.Right, right?.Left) && CheckMirror(left?.Left, right?.Right);
		}
		
	return CheckMirror(root?.Left, root?.Right);
	}
}


