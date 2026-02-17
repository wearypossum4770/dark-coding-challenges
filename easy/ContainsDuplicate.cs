namespace Easy;

public class ContainsDuplicate
{
    public bool Solve(int[] nums)
    {
        HashSet<int> unique = [];
        for (int i = 0; i < nums.Length; i++)
        {
            if (unique.Contains(nums[i]))
                return true;
            unique.Add(nums[i]);
        }
        return false;
    }
}
