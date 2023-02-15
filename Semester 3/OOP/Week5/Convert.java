import java.util.*;
class Strings
{
	String s;
	Strings(String s)
	{
		this.s = s;
	}
	String convert()
	{	
		int len = s.length();
		String res = new String();
		{
			for (int i=0; i<len; i++)
			{
				res = res + s.charAt(i);
				if ((len-i-1)%3==0 && i!=len-1) res=res+","; 
			}
		}
		return res;
	}
}

class Convert
{
	public static void main(String args[])
	{	
		Scanner sc = new Scanner(System.in);
		String s1;
		System.out.println("Enter string of number: ");
		s1 = sc.nextLine();
		Strings str = new Strings(s1);
		String newstr = str.convert();
		System.out.println("New string: " + newstr);
	}
}