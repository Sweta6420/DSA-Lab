class Stack<T>
{
	private int size;
	private int top;
	T a[];
	Stack(int size)
	{
		this.size = size;
		a = (T[]) new Object[size];
		top=-1;
	}
	void push(T data)
	{
		if(top==size-1) System.out.println("Stack Overflow!");
		else a[++top] = data;
	}
	void pop()
	{
		if (top==-1) System.out.println("\nStack Underflow");
		else System.out.println("\nPopped: "+ a[top--]);
	}
	void display()
	{	
		if (top==-1) System.out.println("\nStack Empty");
		else
		{
			for (int i=0; i<=top; i++)
			{
				System.out.print(a[i] + " ");
			}
		}
	}
}
class Student
{
	int grade;
	Student(int x) 
	{
		grade=x;
	}
	public String toString()
	{
		return (grade+" ");
	}
}
class Employee
{
	int salary;
	Employee(int x)
	{
		salary = x;
	}
	public String toString()
	{
		return (salary+" ");
	}
}
class Q2
{
	public static void main(String args[])
	{
		Stack<Student> s1 = new Stack<Student>(5);
		Stack<Employee> s2 = new Stack<Employee>(5);
		Student stud1 = new Student(5);
		Student stud2 = new Student(2);
		Student stud3 = new Student(6);
		Employee e1 = new Employee(500);
		Employee e2 = new Employee(2500);
		s1.push(stud1);s1.push(stud2);s1.push(stud3);
		System.out.print("Stack 1: "); s1.display();
		s2.push(e1); s2.push(e2);
		s2.pop();
		System.out.print("Stack 2: ");
		s2.display();
	}
}