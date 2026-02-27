namespace Easy;

using System.Collections;
using System.Numerics;

public class SortByBits
{
    public int[] Solve(int[] arr)
    {
        var groups = new Dictionary<int, List<int>>();
        foreach (int num in arr)
        {
            int ones = BitOperations.PopCount((uint)num);
            if (!groups.TryGetValue(ones, out var list))
            {
                list = [];
                groups[ones] = list;
            }
            list.Add(num);
        }
        var result = new List<int>(arr.Length);
        foreach (var pair in groups.OrderBy(k => k.Key))
        {
            pair.Value.Sort();
            result.AddRange(pair.Value);
        }
        return [.. result];
    }
}
