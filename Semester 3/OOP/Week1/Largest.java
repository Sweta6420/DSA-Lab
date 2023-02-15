import java.util.Scanner;

class Largest
{
	public static void main(String args[])
	{
		int a, b, c, r;
		Scanner sc= new Scanner(System.in);
		System.out.println("Enter 3 numbers: ");
		a = sc.nextInt();
		b = sc.nextInt();
		c = sc.nextInt();
		r = large(a,b,c);
		System.out.println("Largest of 3 is: " + r);
	}

	static int large(int a, int b, int c)
	{
		if (a>b && a>c) return a;
		else if (b>c && b>a) return b;
		else return c;
	}
}
