import java.util.Scanner;

class Bubble
{
	public static void main(String args[])
	{
		int n, i,a[];
		System.out.print("Enter n: ");
		Scanner sc = new Scanner(System.in);
		n = sc.nextInt();
		a = new int[n];
		System.out.print("Enter elements: ");
		for (i=0; i<n; i++) 
		{
			a[i]=sc.nextInt();
		}
	ascending(n,a);
	descending(n,a);
	}
	static void ascending(int n, int a[])
	{	
		int i, j, temp;
		for (i=0; i<n; i++)
		{
			for (j=1; j<n-i; j++)
			{
				if (a[j-1]>a[j])
				{
					temp=a[j-1];
					a[j-1]=a[j];
					a[j]=temp;
				}
			}
		}
		System.out.print("Ascending order: ");
		for (i=0; i<n; i++) 
		{
			System.out.print(a[i]+" ");
		}
	}
	static void descending(int n, int a[])
	{	
		int i, j, temp;
		for (i=0; i<n; i++)
		{
			for (j=1; j<n-i; j++)
			{
				if (a[j-1]<a[j])
				{
					temp=a[j-1];
					a[j-1]=a[j];
					a[j]=temp;
				}
			}
		}
		System.out.print("\nDescending order: ");
		for (i=0; i<n; i++) 
		{
			System.out.print(a[i]+" ");
		}
	}
}