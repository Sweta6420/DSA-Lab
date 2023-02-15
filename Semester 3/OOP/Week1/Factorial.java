import java.util.Scanner;

class Factorial
{
	public static void main(String args[])
	{
		int n, r;
		System.out.print("Enter n: ");
		Scanner sc = new Scanner(System.in);
		n = sc.nextInt();
		System.out.print("Enter r: ");
		r = sc.nextInt();
		System.out.println("nCr: " + factorial(n)/(factorial(n-r)*factorial(r)));
	}

	static int factorial(int n)
	{	
		int prod=1;
		while (n>0)
		{
			prod*=n;
			n--;
		}
		return prod;
	}
}