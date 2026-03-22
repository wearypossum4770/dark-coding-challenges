namespace Medium;

/// <summary>
///
/// </summary>
public class MinSubArray
{
    /// <summary>
    ///
    /// </summary>
    /// <param name="nums"></param>
    /// <param name="p"></param>
    /// <returns></returns>
    public static int Solve(int[] nums, int p)
    {
        int total = (int)(nums.Sum(x => (long)x) % p);
        if (total == 0)
            return 0;
        int prefix = 0;
        int result = nums.Length;
        var map = new Dictionary<int, int>() { { 0, -1 } };
        for (int i = 0; i < nums.Length; i++)
        {
            prefix = (prefix + nums[i]) % p;
            if (map.TryGetValue((prefix - total + p) % p, out int target))
            {
                result = Math.Min(result, i - target);
            }
            map[prefix] = i;
        }
        return result == nums.Length ? -1 : result;
    }
}
