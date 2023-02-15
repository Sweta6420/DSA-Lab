import java.util.Scanner;

class Digitsum
{
	public static void main(String args[])
	{	
		int n, sum;
		System.out.println("Enter number: ");
		Scanner sc = new Scanner(System.in);
		n = sc.nextInt();
		sum = findSum(n);
		System.out.println("Sum of digits of " + n + ": " + sum);
	}

	static int findSum(int n)
	{
		int sum=0;
		while(n>0)
		{
			sum+=n%10;
			n/=10;
		}
		return sum;
	}
}