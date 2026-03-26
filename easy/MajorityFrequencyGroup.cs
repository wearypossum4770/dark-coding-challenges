namespace Easy;

/// <summary>
///
/// </summary>
public class MajorityFrequencyGroup
{
    /// <summary>
    ///
    /// </summary>
    public static string Solve(string s)
    {
        Dictionary<char, int> freq = [];
        Dictionary<int, string> entries = [];
        foreach (char c in s)
        {
            freq.TryGetValue(c, out int count);
            freq[c] = count + 1;
        }
        foreach ((char key, int value) in freq)
        {
            entries[value] = entries.GetValueOrDefault(value, "") + key;
        }
        List<KeyValuePair<int, string>> groups = [.. entries];
        groups.Sort(
            (lhs, rhs) =>
            {
                int cmp = rhs.Value.Length.CompareTo(lhs.Value.Length);
                if (cmp != 0)
                    return cmp;
                return rhs.Key.CompareTo(lhs.Key);
            }
        );
        return groups.First().Value;
    }
}
