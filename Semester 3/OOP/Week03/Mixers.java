import java.util.Scanner;

class Mixer
{
	int n;
	int arr[];
	Mixer(int num)
	{
		n = num; 
		arr= new int[n];
	}
	void accept()
	{
		System.out.print("Enter elements of array: ");
		Scanner sc = new Scanner(System.in);
		for (int i=0; i<n; i++)
		{
			arr[i] = sc.nextInt();
	}}
	void display()
	{	
		for (int i=0; i<n; i++)
		{
			System.out.print(arr[i] + " ");
		}
		System.out.println();
	}
	Mixer mix(Mixer m1)
	{	
		int i=0, j=0, k=0;
		Mixer m2 = new Mixer(this.n+m1.n);
		m2.arr= new int[n+m1.n];
		while(i<n && j<m1.n)
		{
			if (arr[i]<m1.arr[j]) m2.arr[k++] = arr[i++];
			else if (arr[i]==m1.arr[j])
			{
				m2.arr[k++]=this.arr[i++];
				j++;
			}
			else m2.arr[k++] = m1.arr[j++];
		}
		while(i<n)
		{
			m2.arr[k++] = this.arr[i++];
		}
		while(j<m1.n)
		{
			m2.arr[k++] = m1.arr[j++];
		}
		return m2;
}}

class Mixers
{
	public static void main(String args[])
	{
		int n1, n2;
		Scanner sc = new Scanner(System.in);
		System.out.print("Enter number of elements in first array: ");
		n1= sc.nextInt();
		System.out.print("Enter number of elements in second array: ");
		n2 = sc.nextInt();
		Mixer m1 = new Mixer(n1);
		//m1.Mixer(10);
		Mixer m2 = new Mixer(n2);
		//m2.Mixer(20);
		m1.accept();
		m2.accept();
		System.out.print("Array 1: ");
		m1.display();
		System.out.print("Array 2: ");
		m2.display();
		m2 = m1.mix(m2);
		System.out.print("Merged and Sorted Array: ");
		m2.display();
	}
}