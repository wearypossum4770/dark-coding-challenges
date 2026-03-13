namespace Easy;

/// <summary>
/// Gives the highest net altitude from a given point.
/// </summary>
public class FindLargestAltitude
{
    /// <summary>
    ///
    /// </summary>
    /// <param name="gain"></param>
    /// <returns></returns>
    public static int Solve(int[] gain)
    {
        int[] result = [.. Enumerable.Repeat(0, gain.Length + 1)];
        int altitude = 0;
        for (int i = 0; i < gain.Length; i++)
        {
            result[i] = gain[i] + altitude;
            altitude += gain[i];
        }
        return result.Max();
    }
}
