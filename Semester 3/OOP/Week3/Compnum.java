import java.util.Scanner;

class Complex
{
	int real;
	int imag;
	Complex(int r, int i)
	{
		real = r;
		imag = i;
	}
	void display()
	{
		System.out.println(real+"+ i" + imag);
	}
	Complex add(Complex c)
	{
		int rsum= real + c.real;
		int isum = imag + c.imag;
		Complex sum= new Complex(rsum,isum);
		return sum;
	}
	Complex subtract(Complex c)
	{
		int rdiff = real - c.real;
		int idiff = imag - c.imag;
		Complex diff= new Complex(rdiff,idiff);
		return diff;
	}
}

class Compnum
{
	public static void main(String args[])
	{	
		int r1,r2,i1,i2;
		System.out.println("Enter real and imaginary for 1st number: ");
		Scanner sc = new Scanner(System.in);
		r1 = sc.nextInt();
		i1 = sc.nextInt();
		System.out.println("Enter real and imaginary for 1st number: ");
		r2 = sc.nextInt();
		i2 = sc.nextInt();	
		Complex c1 = new Complex(r1,i1);
		Complex c2 = new Complex(r2,i2);		
		System.out.print("Complex 1:");
		c1.display();
		System.out.print("Complex 2:");
		c2.display();
		Complex result = c1.add(c2);
		Complex differ = c1.subtract(c2);
		System.out.print("Sum: ");
		result.display();
		System.out.print("Difference: ");
		differ.display();
	}
}