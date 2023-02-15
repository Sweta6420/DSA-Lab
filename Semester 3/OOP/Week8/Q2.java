import java.util.*;

class InvalidDayException extends Exception
{
	public String toString()
	{
		return "Invalid Day";
	}
}
class InvalidMonthException extends Exception
{
	public String toString()
	{
		return "Invalid Month";
	}
}
class CurrentDate
{
	int day,month,year;
	void createDate(int d,int m,int y) throws InvalidMonthException,InvalidDayException
	{	
		if (d>31 || d<1) throw new InvalidDayException();
		else day = d;
		if (m>12 || m<1) throw new InvalidMonthException();
		else month = m;
		year = y;
	}
	void displayDate()
	{
		if (day>=1 && day<=31 && month>=1 && month<=12)
			System.out.print(day+"/"+month+"/"+year);
		//else System.out.println("Invalid Date");
	}
}

class Q2
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("Enter Day: "); int d = sc.nextInt();
		System.out.print("Enter Month: "); int m = sc.nextInt();
		System.out.print("Enter Year: "); int y = sc.nextInt();
		CurrentDate cd = new CurrentDate();
		try
		{
			cd.createDate(d,m,y);
		}
		catch (InvalidDayException e)
		{
			System.out.print(e);
		}
		catch (InvalidMonthException e)
		{
			System.out.print(e);
		}
		cd.displayDate();
	}
}