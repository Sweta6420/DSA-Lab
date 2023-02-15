class Node<T>
{
	T data;
	Node<T> next;
	Node(T d)
	{
		data=d;
		next=null;
	}
}
class List<T>
{
	Node<T> head;
	List()
	{
		head=null;
	}
	void insertFront(T x)
	{
		Node<T> temp = new Node<T>(x);
		if (head==null) head=temp;
		else 
		{
			temp.next=head;
			head=temp;
		}
	}
	void deleteFront()
	{	
		if (head==null) System.out.println("Cannot Delete!");
		else 
		{
			T value = head.data;
			head = head.next;
			System.out.println("\nDeleted:  " + value);			
		}
	}
	void display()
	{	
		if (head==null) System.out.println("Empty");
		for (Node<T> t = head; t!=null; t=t.next)
		{
			System.out.print(t.data+ " ");
		}
	}
}
class Q3
{	
	public static void main(String args[])
	{
		List<Integer> intList = new List<>();
		List<Double> doubList = new List<>();
		// Integer x = 10; Integer y = 20;
		// Double z = 10.5;
		intList.insertFront(10); intList.insertFront(20);
		System.out.print("Integer List: "); intList.display();
		intList.deleteFront();
		doubList.insertFront(10.5);
		System.out.print("Double List: "); doubList.display();	
		doubList.deleteFront();
		doubList.deleteFront();
	}

}