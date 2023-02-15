package myPackages.p1;

public class Maximum
{
	public int max(int a,int b, int c)
	{
		if (a>b && a>c) return a;
		else if (b>a && b>c) return b;
		else return c;
	}
	public float max(float a, float b, float c)
	{
		if (a>b && a>c) return a;
		else if (b>a && b>c) return b;
		else return c;
	}
	public int max(int a[])
	{
		int max=a[0];
		for (int i=0;i<a.length; i++)
		{
			if (a[i]>max) max=a[i];
		}
		return max;
	}
	public int max(int a[][])
	{
		int max=a[0][0];
		for (int i=0;i<a.length; i++)
		{
			for (int j=0; j<a[0].length; j++)
			{
				if (a[i][j]>max) max=a[i][j];
			}
		}
		return max;
	}
}
