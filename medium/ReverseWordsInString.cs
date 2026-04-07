namespace Medium;

/// <summary>
///
/// </summary>
public class ReverseWordsInString
{
    /// <summary>
    ///
    /// </summary>
    public static string Solve(string s)
    {
        string[] words = s.Trim().Split(' ', StringSplitOptions.RemoveEmptyEntries);
        List<string> result = [];
        for (int i = words.Length - 1; i >= 0; i--)
        {
            if (words[i] != " ")
            {
                result.Add(words[i]);
            }
        }
        return string.Join(" ", result);
    }
}
