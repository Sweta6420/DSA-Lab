import java.util.*;

class SeatsFilledException extends Exception
{
	public String toString()
	{
		return "Seats Filled!";
	}
}
class Student
{
	int regno;
	String name;
	GregorianCalendar date;
	static int temp=24;
	Student(String n, int y, int m, int day) throws SeatsFilledException
	{
		name = new String(n);
		date= new GregorianCalendar(y,m,day);
		if (temp>25) throw new SeatsFilledException();
		else 
		{
			regno = (y%100)*100 + temp;
			temp++;
		}
	}
	void display()
	{	
		System.out.println("Registration number: " + regno);
		System.out.println("Name: " + name);
		System.out.println("Date of joining: " + date.get(Calendar.DATE) + "/" + date.get(Calendar.MONTH) + "/" + date.get(Calendar.YEAR));
	}
}

class Q3
{
	public static void main(String args[])
	{	
		Scanner sc = new Scanner(System.in);
		int day,mon,year,n;
		String name;
		System.out.print("Enter number of students: ");
		n = sc.nextInt();
		Student s[] = new Student[n];
		for (int i=0; i<n; i++)
		{	
			sc.nextLine();
			System.out.println("Enter details of student " + (i+24)+": ");
			System.out.print("Enter name: "); name = sc.nextLine();
			System.out.print("Enter date of joining: "); day = sc.nextInt(); mon = sc.nextInt(); year = sc.nextInt();
			try
			{
				s[i] = new Student(name, year, mon, day);			
			}
			catch (SeatsFilledException e)
			{
				System.out.println(e);
			}
		}
	}
}