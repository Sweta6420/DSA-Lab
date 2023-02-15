import java.util.*;

interface Sports
{
	char putGrade();
}
class Student
{	
	int roll, marks;
	void getNumber(int x) 
	{
		roll=x;
	}
	int putNumber()
	{
		return roll;
	}
	void getMarks(int x) 
	{
		marks=x;
	}
	int putMarks()
	{
		return marks;
	}
}
class Result extends Student implements Sports 
{	
	Result(int r, int m)
	{
		getMarks(m);
		getNumber(r);
	}
	public char putGrade() 
	{
		return 'A';
	}
	void genresult()
	{
		if (putGrade()=='A' && putMarks()>35) System.out.println("Roll Number "+ putNumber() + " passed");
		else System.out.println("Roll Number "+putNumber() + " failed");
	}
}
class Q4
{
	public static void main (String args[])
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("Enter roll number: ");
		int r = sc.nextInt();
		System.out.print("Enter marks: ");
		int m = sc.nextInt();
		Result res = new Result(r,m);
		res.genresult();
	}
}