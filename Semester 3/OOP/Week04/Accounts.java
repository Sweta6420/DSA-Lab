import java.util.Scanner;
class Account 
{
	String name;
	int accno;
	String type;
	double bal;
	static int temp=1111;
	static float roi=5.5f;
	Scanner sc = new Scanner(System.in);
	Account()
	{
		name = " ";
		type = " ";
		bal = 0;
	}
	Account (String n, String t, double b)
	{
		name = new String(n);
		type = new String(t);
		bal = b;
		accno=temp++;
	}
	void deposit()
	{
		System.out.print("Enter amount to deposit: ");
		int n= sc.nextInt();
		bal+=n;
		System.out.println("Balance Amount: " + bal);
	}
	void withdraw()
	{
		System.out.print("Enter amount to withdraw: ");
		int n= sc.nextInt();
		if (bal-n>1000)
		{	
			bal-=n;
			System.out.println("Balance Amount: " + bal);
		}
		else System.out.println("Not enough minimum balance");
	}
	void display()
	{
		System.out.print("Name: " + name);
		System.out.print("\nAccount Number: " + accno);
		System.out.print("\nAccount type: " + type);
		System.out.print("\nBalance Amount: " + bal);
		System.out.println();
	}
	void showroi()
	{
		System.out.println("Rate of Interest: " + roi + "%");
}}

class Accounts
{
	public static void main(String args[])
	{
		System.out.print("Enter number of account holders: ");
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt();
		Account a[]= new Account[n];
		for (int i=0; i<n; i++)
		{	
			System.out.print("Initial Amount: ");
			double b = sc.nextDouble();
			System.out.print("Enter name: ");
			String name = sc.next();
			System.out.print("Enter Account type: ");
			String type = sc.next();
			a[i]=new Account(name,type,b);
		}
		for (int i=0; i<n; i++) a[i].display();
		int p, ac;
		do {
			System.out.print("Enter account number or 0 to exit: ");
			ac = sc.nextInt();
			for (int i=0; i<n; i++) {
				if (a[i].accno==ac) {
					System.out.println("Enter 1 to deposit, 2 to withdraw, 3 to show roi: ");
					p = sc.nextInt();
					switch(p)
					{
					case 1:
						a[i].deposit();
						break;
					case 2:
						a[i].withdraw();
						break;
					case 3:
						a[i].showroi();
			}}}
		} while (ac!=0);
}}