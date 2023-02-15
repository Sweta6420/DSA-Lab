import java.util.Scanner;
import myPackages.p1.Maximum;

class Q2
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);
		int a,b,c,n,r1,c1,ch;
		float d,e,f;
		int arr[];
		int mat[][];
		Maximum m1 = new Maximum();
		do {
			System.out.println("Enter 1 -Integer ; 2 -  Float ; 3 - Array ; 4 - Matrix ; 5 - Quit");
			ch = sc.nextInt();
			switch(ch)
			{
				case 1:
					System.out.print("Enter 3 integers: ");
					a = sc.nextInt(); b = sc.nextInt(); c = sc.nextInt();
					System.out.println("Max of three integers: "+ m1.max(a,b,c));
					break;
				case 2:
					System.out.print("Enter 3 Floating points: ");
					d = sc.nextFloat(); e = sc.nextFloat(); f = sc.nextFloat();
					System.out.println("Max of three floats: "+ m1.max(d,e,f));
					break;
				case 3:
					System.out.print("Enter number of elements in array: ");
					n = sc.nextInt();
					arr = new int[n];
					System.out.print("Enter array elements: ");
					for (int i=0; i<n; i++) arr[i] = sc.nextInt();
					System.out.println("Max of array: "+ m1.max(arr));
					break;
				case 4:
					System.out.print("Enter dimensions of matrix: ");
					r1 = sc.nextInt(); c1 = sc.nextInt();
					mat = new int[r1][c1];
					System.out.print("Enter matrix elements: ");
					for (int i=0;i<r1; i++)
					{
						for (int j=0; j<c1; j++) mat[i][j] = sc.nextInt();
					}
					System.out.println("Max of matrix: "+ m1.max(mat));
			}
		}while (ch!=5);
	}
}