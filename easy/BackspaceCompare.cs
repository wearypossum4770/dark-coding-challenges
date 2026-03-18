namespace Easy;

/// <summary>
///
/// </summary>
public class BackspaceCompare
{
    /// <summary>
    ///
    /// </summary>
    public static bool Solve(string s, string t)
    {
        return Process(s) == Process(t);
    }

    /// <summary>
    ///
    /// </summary>
    /// <param name="text"></param>
    /// <returns></returns>
    public static string Process(string text)
    {
        List<char> result = [];
        foreach (char c in text)
        {
            if (c == '#')
            {
                if (result.Count != 0)
                {
                    result.RemoveAt(result.Count - 1);
                }
            }
            else
            {
                result.Add(c);
            }
        }
        return new string([.. result]);
    }
}
