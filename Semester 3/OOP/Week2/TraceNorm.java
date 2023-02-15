import java.util.Scanner;
import java.lang.Math;

class TraceNorm
{
	public static void main(String args[])
	{
		int i,j,r,c,trace=0,sum=0, a[][];
		Scanner sc = new Scanner(System.in);
		System.out.print("Enter dimensions of matrix: ");
		r = sc.nextInt();
		c = sc.nextInt();
		a = new int[r][c];
		System.out.print("Enter elements of matrix: ");
		for (i=0; i<r; i++) 
		{
			for(j=0; j<c; j++)
			{
				a[i][j]=sc.nextInt();
				if (i==j) trace+=a[i][j];
				sum+=a[i][j];
			}
		}
		System.out.print("Trace of matrix: " + trace);
		System.out.print("\nNorm of matrix: " + Math.sqrt(sum));
	}
}