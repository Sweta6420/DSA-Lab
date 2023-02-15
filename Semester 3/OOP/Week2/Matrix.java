import java.util.Scanner;

class Matrix
{
	public static void main(String args[])
	{
		int n, i,r,c,j,a[][], b[][], sum[][];
		System.out.print("Enter dimensions of matrices: ");
		Scanner sc = new Scanner(System.in);
		r = sc.nextInt();
		c = sc.nextInt();
		a = new int[r][c];
		b = new int[r][c];
		sum = new int[r][c];
		System.out.print("Enter elements of matrix 1: ");
		read(r,c,a);
		System.out.print("Enter elements of matrix 2: ");
		read(r,c,b);	
		add(r,c,a,b,sum);
		System.out.print("Matrix 1:\n");
		display(r,c,a);
		System.out.print("Matrix 2:\n");
		display(r,c,b);
		System.out.print("Resultant Matrix:\n");
		display(r,c,sum);
	}
	static void read(int r, int c, int a[][])
	{	
		int i, j;
		Scanner sc = new Scanner(System.in);
		for (i=0; i<r; i++)
		{
			for(j=0; j<c; j++)
			{
				a[i][j]=sc.nextInt();
	}}}
	static void display(int r, int c, int a[][])
	{
		int i, j;
		for (i=0; i<r; i++)
		{
			for(j=0; j<c; j++)
			{
				System.out.print(a[i][j]+" ");
			}
			System.out.print("\n");
	}}
	static void add(int r, int c,int a[][], int b[][], int sum[][])
	{	
		int i, j;
		for (i=0; i<r; i++)
		{
			for(j=0; j<c; j++)
			{	
				sum[i][j]=a[i][j]+b[i][j];
	}}}}