import java.util.*;

interface Series
{
	int getNext();
	void reset();
	void setStart(int x);
}
class ByTwos implements Series
{
	int start,val;
	public void setStart(int x) {start=x; val=x;}
	public int getNext() {val+=2; return val;}
	public void reset() {val=start;}
}
class Q3
{
	public static void main(String args[])
	{	
		Scanner sc= new Scanner(System.in);
		ByTwos ob = new ByTwos();
		int s;
		System.out.println("1)Set-Start 2)Next 3)Reset 4)Exit");
		do
		{
			System.out.print("Enter choice: ");
			s = sc.nextInt();
			switch(s)
			{
			case 1:
				System.out.print("Enter start: ");
				int start = sc.nextInt();
				ob.setStart(start); break;
			case 2:
				System.out.println("Next: "+ob.getNext()); break;
			case 3:
				ob.reset(); break;	
			}
		} while (s!=4);
	}
}