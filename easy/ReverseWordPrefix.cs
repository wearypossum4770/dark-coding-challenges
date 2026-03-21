using System.Text;

namespace Easy;

/// <summary>
///
/// </summary>
public class ReverseWordPrefix
{
    /// <summary>
    ///
    /// </summary>
    public static string Solve(string word, char ch)
    {
        for (int i = 0; i < word.Length; i++)
        {
            if (word[i] == ch)
            {
                var result = new StringBuilder();
                int left = i;
                int right = i + 1;
                while (left >= 0)
                {
                    result.Append(word[left--]);
                }
                while (right < word.Length)
                {
                    result.Append(word[right++]);
                }
                return result.ToString();
            }
        }
        return word;
    }
}
