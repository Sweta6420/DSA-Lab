import java.util.*;
abstract class Figure
{	
	int x,y;
	Figure(int a, int b)
	{
		x=a; y=b;
	}
	abstract void area();
}
class Rectangle extends Figure
{
	Rectangle(int a,int b)
	{
		super(a,b);
	}
	void area()
	{
		System.out.println("Area: " + (x*y)+ " sq units");
	}
}
class Square extends Figure
{
	Square(int a)
	{
		super(a,a);
	}
	void area()
	{
		System.out.println("Area: " + (x*y)+ " sq units");
	}
}
class Triangle extends Figure
{
	Triangle(int a,int b)
	{
		super(a,b);
	}
	void area()
	{
		System.out.println("Area: " + (x*y/2) + " sq units");
	}
}

class Q3
{
	public static void main(String args[])
	{
		int ch,x,y;
		Figure f;
		Scanner sc = new Scanner(System.in);
		do 
		{
			System.out.println("Enter 1 - Rectangle ; 2 -  Sqaure ; 3 - Triangle ; 4 - Quit");
			ch = sc.nextInt();
			switch(ch)
			{
			case 1:
				System.out.print("Enter dimensions of rectangle: ");
				x = sc.nextInt(); y = sc.nextInt();
				f = new Rectangle(x,y);
				f.area();
				break;
			case 2:
				System.out.print("Enter side of square: ");
				x = sc.nextInt();
				f = new Square(x);
				f.area();
				break;
			case 3:
				System.out.print("Enter dimensions of triangle: ");
				x = sc.nextInt(); y = sc.nextInt();
				f = new Triangle(x,y);
				f.area();
				break;
			}
		}	while (ch!=4);
	}
}