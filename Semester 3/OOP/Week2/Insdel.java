import java.util.Scanner;

class Insdel
{
	public static void main(String args[])
	{
		int n,i,pos,val,a[];
		System.out.print("Enter n: ");
		Scanner sc = new Scanner(System.in);
		n = sc.nextInt();
		a = new int[n+1];
		System.out.print("Enter elements: ");
		for (i=0; i<n; i++) 
		{
			a[i]=sc.nextInt();
		}
		System.out.print("Enter position for insertion: ");
		pos = sc.nextInt();
		System.out.print("Enter value: "); 
		val = sc.nextInt();
		insert(n,a,pos,val);
		System.out.print("\nEnter position for deletion: ");
		pos = sc.nextInt();
		delete(n,a,pos);
	}
	static void insert(int n, int a[], int pos, int val)
	{	
		int i;
		for (i=n-1; i>=(pos-1); i--)
		{
			a[i+1]=a[i];
		}
		a[pos-1]=val;
		System.out.print("Array after insertion: ");
		for (i=0; i<=n; i++) 
		{
			System.out.print(a[i]+" ");
		}
	}
	static void delete(int n, int a[], int pos)
	{
		int i;
		for (i=pos-1; i<n; i++)
		{
			a[i]=a[i+1];
		}
		System.out.print("Array after deletion: ");
		for (i=0; i<n; i++) 
		{
			System.out.print(a[i]+" ");
		}
	}
}
