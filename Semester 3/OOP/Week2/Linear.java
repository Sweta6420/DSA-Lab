import java.util.Scanner;

class Linear
{
	public static void main(String args[])
	{
		int n, i, j,val,a[];
		System.out.print("Enter n: ");
		Scanner sc = new Scanner(System.in);
		n = sc.nextInt();
		a = new int[n];
		System.out.print("Enter elements: ");
		for (i=0; i<n; i++) 
		{
			a[i]=sc.nextInt();
		}
		System.out.print("Enter value to be searched: ");
		val = sc.nextInt();
		lsearch(n, a,val);
	}
	static void lsearch(int n, int a[], int val)
	{
		int i;
		for (i=0; i<n; i++)
		{
			if (a[i]==val) break;
		}
		if (i<n) System.out.print("Element was found at position " + (i+1));
		else System.out.print("Element not found");
	}
}