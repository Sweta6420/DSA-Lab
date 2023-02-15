import java.util.Scanner;

class Prime
{
	public static void main(String args[])
	{	
		int i=2, n, count=1;
		System.out.println("Enter number: ");
		Scanner sc = new Scanner(System.in);
		n = sc.nextInt();
		System.out.println("First " + n + " prime numbers: ");
		while (count<=n)
		{
			if (isPrime(i)==1) 
			{
				System.out.println(i + " ");
				count++;
			}
			i++;
		}
	}

	static int isPrime(int n)
	{
		int i,f=1; 
		for (i=2; i<=n/2; i++)
		{
			if(n%i==0) 
			{
				f=0;
				break;
			}
		}
		return f;
	}
	
}