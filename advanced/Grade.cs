using System.ComponentModel.DataAnnotations;

class AssignmentFailureException : ValidationException
{

public AssignmentFailureException() : base() { }
public AssignmentFailureException(string message): base(message) { }

}
namespace advanced
{
	public enum AssignmentType
	{
	
		Unknown,
		Homework,
		Quiz,
		Test,
		Exam,
		FinalExam,
		MidTermExam,
		Discussion,

	}

	public class Grade
	{
		public AssignmentType assignmentType;
		public decimal value;
	public void  assignmentFailure()
		{
				throw new AssignmentFailureException();
		}
	}
}
