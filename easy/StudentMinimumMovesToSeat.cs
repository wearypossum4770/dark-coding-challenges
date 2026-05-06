namespace Easy;
/// <summary>
/// 
/// </summary>
public class StudentMinimumMovesToSeat {
    /// <summary>
    /// 
    /// </summary>
    /// <param name="seats"></param>
    /// <param name="students"></param>
    /// <returns></returns>
    public static int Solve(int[] seats, int[] students) {
        int moves = 0;
        Array.Sort(seats);
        Array.Sort(students);
        for(int i = 0; i < seats.Length; i++)
        {
            moves += Math.Abs(seats[i] - students[i]);
        }
        return moves;
    }
}

