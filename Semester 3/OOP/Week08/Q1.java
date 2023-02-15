import java.util.*;
class PushException extends Exception
{
	public String toString()
	{
		return "Stack Overflow\n";
	}
}
class PopException extends Exception
{
	public String toString()
	{
		return "Stack Underflow\n";
	}
}
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
	void push(int a) throws PushException
	{	
		if(tos>max) throw new PushException();
		else
		{	
			tos++;
			arr[tos]=a;
		}
	}
	void pop() throws PopException
	{	
		if (tos<0) throw new PopException();
		else 
		{	
			System.out.print("Popped: " + arr[tos] + "\n");
			tos--;
		}
	}
	void display()
	{	
		System.out.print("Array: ");
		for (int i=0; i<=tos; i++) System.out.print(arr[i]+" ");
		System.out.println();
	}
}

class Q1
{
	public static void main(String args[])
	{
		Stack a= new Stack();
		System.out.print("Enter max size: ");
		Scanner sc = new Scanner(System.in);
		int num=sc.nextInt();
		a.initialize(num);
		int p;
		do
		{	
			System.out.print("Enter 1 for push and 2 for pop 0 to exit: ");
			p = sc.nextInt();
			try
			{
				switch(p)
				{
					case 1:
					try{
						System.out.print("Enter item to be pushed: ");
						int n  = sc.nextInt();
						a.push(n);
						a.display();
						break;
					}
					catch(PushException e)
					{
						System.out.print(e);
						a.tos-=1;
					}
					catch(ArrayIndexOutOfBoundsException e)
					{
						throw new PushException();
					}
					case 2:
					try{
						a.pop();
						a.display();
						break;
					}
					catch(PopException e)
					{
						System.out.print(e);
					}
				}	
			}
			catch(PushException e)
			{
				System.out.print(e);
				a.tos-=1;
			}					
		} while (p!=0);
	}
}