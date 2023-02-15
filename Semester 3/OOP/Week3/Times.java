import java.util.Scanner;

class Time
{
	int hours;
	int mins;
	int secs;
	Time(int h, int m, int s)
	{
		hours = h;
		mins = m;
		secs = s;
	}
	void display()
	{
		if (hours<9)
		{
			System.out.print("0"+hours+":");
		}
		else System.out.print(hours+":");
		if (mins<9)
		{
			System.out.print("0"+mins+":");
		}
		else System.out.print(mins+":");
		if (secs<9)
		{
			System.out.print("0"+secs);
		}
		else System.out.print(secs);
	}
	Time add(Time t)
	{
		int shours = hours + t.hours;
		int ssecs = secs + t.secs;
		int smins = mins + t.mins;
		if (ssecs>60)
		{
			ssecs-=60;
			smins++;
		} 
		if (smins>60)
		{
			smins-=60;
			shours++;
		} 
		if (shours>=24) shours-=24;
		Time sum = new Time(shours, smins, ssecs);
		return sum;
	}
	Time subtract(Time t)
	{
		
		int dhours =  hours - t.hours;
		int dsecs =  secs - t.secs;
		int dmins = mins - t.mins;
		if (dsecs<0)
		{
			dsecs+=60;
			dmins--;
		} 
		if (dmins<0)
		{
			dmins+=60;
			dhours--;
		} 
		if (dhours<0) dhours+=24;
		Time diff= new Time(dhours,dmins,dsecs);
		return diff;
	}
	void compare(Time t)
	{
		if (hours==t.hours)
		{
			if (mins==t.mins)
			{
				if (secs==t.secs) System.out.println("Equal");
				else if (secs>t.secs) System.out.print("Time 1 is greater");
				else System.out.print("Time 2 is greater");
			}
			else if (mins>t.mins) System.out.print("Time 1 is greater");
			else System.out.print("Time 2 is greater");
		}
		else if (hours>t.hours) System.out.print("Time 1 is greater");
		else System.out.print("Time 2 is greater");
	}
}

class Times
{
	public static void main(String args[])
	{
		int h1,h2,m1,m2,s1,s2;
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter time 1 (h,m,s): ");
		h1 = sc.nextInt();
		m1 = sc.nextInt();
		s1 = sc.nextInt();
		System.out.println("Enter time 2 (h,m,s): ");
		h2 = sc.nextInt();
		m2 = sc.nextInt();
		s2 = sc.nextInt();
		Time t1 = new Time(h1,m1,s1);
		Time t2 = new Time(h2,m2,s2);
		System.out.print("Time 1: ");
		t1.display();
		System.out.print("\nTime 2: ");
		t2.display();
		Time sum = t1.add(t2);
		System.out.print("\nSum: ");
		sum.display();
		Time diff = t1.subtract(t2);
		System.out.print("\nDifference: ");
		diff.display();
		System.out.print("\n");
		t1.compare(t2);
	}	
}