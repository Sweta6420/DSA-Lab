import java.util.Scanner;

class Prime
{
	public static void main(String args[])
	{
		int i, j, n, a[];
		System.out.print("Enter number of elements: ");
		Scanner sc = new Scanner(System.in);
		n = sc.nextInt();
		a = new int[n];
		for (i=0; i<n; i++)
		{
			a[i]=sc.nextInt();
		}
		for (i=0; i<n; i++)
		{
			if (isPrime(a[i])>0) System.out.print(a[i] + " ");
		}
	}
	
	static int isPrime(int x)
	{
		int i, f=0;
		if (x==0||x==1) f=1;
		else
		{
			for (i=2; i<=x/2; i++)
			{
				if (x%i==0)
				{
					f=1;
					break;
				}
			}
		}
		if (f==0) return 1;
		else return -1;		
	}

}