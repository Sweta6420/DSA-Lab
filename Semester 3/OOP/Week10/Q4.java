import java.util.*;
class NumericFunc<T extends Number>
{
	T num;
	NumericFunc(T n)
	{
		num = n;
	}
	double reciprocal()
	{
		return 1/num.doubleValue();
	}
	double fraction()
	{
		return (num.doubleValue() - num.intValue());
	}
	boolean absEqual(NumericFunc<?> ob)
	{
		if(Math.abs(num.doubleValue()) == Math.abs(ob.num.doubleValue()))
		{
			return true;
		}
		return false;
	}
}
class Q4
{
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("Enter Integer : ");
		int i = sc.nextInt();
		System.out.print("Enter Double : ");
		double d = sc.nextDouble();
		NumericFunc<Integer> iOb = new NumericFunc<Integer>(i);
		NumericFunc<Double> dOb = new NumericFunc<Double>(d);
		System.out.println("Reciprocal of "+i+" is " + iOb.reciprocal());
		System.out.println("Fractional part of "+d+" is "+dOb.fraction());
		if(iOb.absEqual(dOb)) System.out.println("Absolute values are equal.");
		else System.out.println("Absolute values are not equal.");
	}
} 