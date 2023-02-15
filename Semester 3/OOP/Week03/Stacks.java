import java.util.*;
class Stack
{
	int tos;
	int arr[];
	int max;
	void initialize(int num)
	{
		max = num;
		arr = new int[max];
		tos=-1;
	}
	void push(int a)
	{	
		if(tos<max)
		{	
			tos++;
			arr[tos]=a;
		}
		else System.out.println("Stack Overflow");
	}
	void pop()
	{	
		if (tos>=0)
		{	
			System.out.print("Popped: " + arr[tos]);
			tos--;
		}
		else System.out.println("Stack Underflow");
	}
	void display()
	{	
		System.out.print("Array: ");
		for (int i=0; i<=tos; i++)
		{
			System.out.print(arr[i]+" ");
		}
		System.out.println();
	}
}

class Stacks
{
	public static void main(String args[])
	{
		Stack a= new Stack();
		System.out.print("Enter max size: ");
		Scanner sc = new Scanner(System.in);
		int num=sc.nextInt();
		a.initialize(num);
		int p,n;
		do
		{
			System.out.print("Enter 1 for push and 2 for pop 0 to exit:");
			p = sc.nextInt();
			switch(p)
			{
			case 1:
				System.out.print("Enter item to be pushed: ");
				n  = sc.nextInt();
				a.push(n);
				a.display();
				break;
			case 2:
				a.pop();
				a.display();
				break;
			}
		} while (p!=0);
	}
}