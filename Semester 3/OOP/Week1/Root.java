import java.util.*;
import java.io.*;
import java.lang.Math;

class Root
{
	public static void main(String args[])
	{	
		int a, b, c, d;
		char s;
		System.out.println("Enter coefficients of quadratic equation: ");
		Scanner sc = new Scanner(System.in);
		a = sc.nextInt();
		b = sc.nextInt();
		c = sc.nextInt();
		d = b*b - 4*a*c;
		if (d>0) s='p';
		else if (d==0) s='z';
		else s='n';
		switch(s)
		{
		case 'z':
			System.out.println("Both roots are real and equal. Roots are " + -b/(2*a) + " and " + -b/(2*a));
			break;
		case 'p':
			System.out.println("Roots are real and different. Roots are " + (-b+Math.sqrt(d))/(2*a) + " and " +  (-b-Math.sqrt(d))/(2*a));
			break;
		case 'n': 
			System.out.println("Roots are imaginary. Roots are " + -b/(2*a) + "+" + Math.sqrt(-d)/(2*a)+ "i" + " and " + -b/(2*a) +"-"+ Math.sqrt(-d)/(2*a)+ "i");
			break;
		}
	}
}

//sqrt in java
