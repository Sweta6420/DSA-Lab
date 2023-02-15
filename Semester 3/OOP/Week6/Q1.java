import java.util.*;

class Date
{
	static int day, month, year;
	Date(int d, int m, int y)
	{
		day = d; month = m; year = y;
	}
}
class Person
{
	private String name;
	private Date dob;
	Person(String n, int y, int m, int d)
    {
    	name = n;
		dob = new Date(y,m,d);
	}
	String getname()
	{
		return name;
	}
	Date getdob()
	{
		return dob;
	}
	void display()
	{
		
		System.out.println("Name : " + name);
		System.out.println("Date of birth: " + Date.day + "/" + Date.month + "/" + Date.year);
	}	
}

class CollegeGraduate extends Person
{
	private float gpa;
	private int yog; //yog = Year of Graduation
	CollegeGraduate(String n, int y, int m, int d, float gpa, int yog)
	{
		super(n,y,m,d);
		this.gpa = gpa;
		this.yog = yog;
	}
	double getgpa()
	{
		return gpa;
	}
	int getyog()
	{
		return yog;
	}
	void display()
	{
		super.display();
    	System.out.println("GPA: " + gpa + "\nGraduation: " + yog);
	}
}

class Q1
{
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		int y,m,d,grad;
		System.out.print("Enter name: "); 
		String name = sc.nextLine();
		System.out.print("Enter date of birth (Y,M,D): ");
		y = sc.nextInt(); m = sc.nextInt(); d = sc.nextInt();
		System.out.print("Enter year of grad: ");
		grad = sc.nextInt();
		System.out.print("Enter gpa: ");
		float gpa = sc.nextFloat();
		Person p = new Person(name,y,m,d);
		CollegeGraduate c = new CollegeGraduate(name,y,m,d,gpa,grad);
		System.out.println("");
		System.out.println("From Person class");
		p.display();
		System.out.println("");
		System.out.println("From CollegeGraduate class");
		c.display();
	}
}