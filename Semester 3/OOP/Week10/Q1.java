import java.util.*;
class Q1
{
	public static void main(String args[])
	{	
		Integer a[] = {1,2,3,4,5,6};
		String b[] = {"hello","hi","new","world"};
		System.out.print("Integer Array: "); display(a);
		System.out.print("\nString Array: "); display(b);
		exchange(a);
		System.out.print("Integer Array after exchange: "); display(a);
		exchange(b);
		System.out.print("String Array after exchange: ");display(b);
	}
	static <T> void exchange(T a[])
	{	
		Scanner sc = new Scanner(System.in);
		System.out.print("\nEnter 1st index: ");
		int x = sc.nextInt();
		System.out.print("Enter 2nd index: ");
		int y = sc.nextInt();
		T c = a[x];
		a[x] = a[y];
		a[y]=c;
	}
	static <T> void display(T a[])
	{
		for (int i=0; i<a.length; i++)
		{
			System.out.print(a[i] + " , ");
		}
	}
}