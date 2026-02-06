namespace Easy;
/// <summary>
/// 
/// </summary>
public class SmallestEvenMultiple
{
    [Challenge("Smallest Even Multiple", 2413)]
    /// <summary>
    /// 
    /// </summary>
    /// <param name="n"></param>
    /// <returns></returns>

    public static int Solve(int n)
    {
        if (n % 2 != 0) return n * 2;
        return n;
    }
}
