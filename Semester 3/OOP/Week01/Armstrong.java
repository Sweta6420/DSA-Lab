import java.util.Scanner;

class Armstrong
{
	public static void main(String args[])
	{	
		int n;
		System.out.println("Enter number: ");
		Scanner sc = new Scanner(System.in);
		n = sc.nextInt();
		if (isArmstrong(n)==1) System.out.println("Armstrong number");
		else System.out.println("Not an Armstrong number");
	}

	static int isArmstrong(int n)
	{
		int temp=n, sum=0;
		while (temp>0)
		{
			sum += (temp%10)*(temp%10)*(temp%10);
			temp/=10;
		}
		if (n==sum) return 1;
		else return 0;
	}
}