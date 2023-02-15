import java.util.*;

class Table
{
	synchronized void table(int n)
	{
		for (int i=1; i<=100; i++)
		{
			System.out.print(n+" x "+i+" = "+(n*i)+"\n");
		}
	}
}
class myThread extends Thread
{
	int n;
	Table tb;
	myThread(int n, Table tb, String threadName)
	{
		super(threadName);
		this.tb = tb;
		this.n=n;
		start();
	}
	public void run()
	{
		tb.table(n);
	}
}
class Q1{
	public static void main(String args[])
	{
		Table tb = new Table();
		new myThread(5,tb,"5 Table");
		new myThread(7,tb,"7 Table");
	}
}