import java.util.*;

class Student
{
	int regno;
	String name;
	GregorianCalendar date;
	short sem;
	float gpa;
	float cgpa;
	static int temp=1;
	Student()
	{
		regno = 0;
		name = "";
		sem = 0;
		gpa = 0.0f ;
		cgpa = 0.0f ;
		date= new GregorianCalendar();
	}
	Student(String n, int y, int m, int day, short s, float gpa, float cgpa)
	{
		name = new String(n);
		date= new GregorianCalendar(y,m,day);
		sem = s;
		this.gpa = gpa;
		this.cgpa = cgpa;
		regno = (y%100)*100 + temp;
		temp++;
	}
	void display()
	{	
		System.out.println("Registration number: " + regno);
		System.out.println("Name: " + name);
		System.out.println("Date of joining: " + date.get(Calendar.DATE) + "/" + date.get(Calendar.MONTH) + "/" + date.get(Calendar.YEAR));
		System.out.println("Semester: " + sem);
		System.out.println("GPA: " + gpa);
		System.out.println("CGPA: " + cgpa);
	}
	static void sortsem(Student s[])
	{	
		int i, j;
		Student temp;
		for (i=0; i<s.length-1; i++){
			for (j=i+1; j<s.length; j++){
				if (s[i].sem>s[j].sem){
					temp = s[i];
					s[i]=s[j];
					s[j]=temp;
				}
				if (s[i].sem==s[j].sem)
				{
					if (s[i].cgpa>s[j].cgpa) 
					{
						temp = s[i];
						s[i]=s[j];
						s[j]=temp;
					} 
				}
	}}}
	static void sortname(Student s[])
	{	
		int i, j;
		Student temp;
		for (i=0; i<s.length-1; i++){
			for (j=i+1; j<s.length; j++){
				if ((s[i].name.compareTo(s[j].name))>0){
					temp = s[i];
					s[i]=s[j];
					s[j]=temp;
	}}}}
	static void namestart(Student s[], char c)
	{
		for (int i=0; i<s.length; i++)
		{
			if (s[i].name.charAt(0)==c) s[i].display();
		}
	}
	static void namesubstr(Student s[], String sub)
	{
		for (int i=0; i<s.length; i++)
		{
			if (s[i].name.contains(sub)) s[i].display();
		}
	}
	void modifyname()
	{	
		String words[] = name.split(" ");
		for (int i=0; i<words.length-1; i++)
			words[i]=Character.toString(words[i].charAt(0));
		name = String.join(" ",words);
	}
}

class Records
{
	public static void main(String args[])
	{	
		Scanner sc = new Scanner(System.in);
		int day,mon,year,i,choice,index,n; 
		String name, substr; 
		short sem; 
		float gpa,cgpa;
		char ch;
		System.out.print("Enter number of students: ");
		n = sc.nextInt();
		Student s[] = new Student[n];
		for (int i=0; i<n; i++)
		{
			sc.nextLine();
			System.out.println("Enter details of student" + (i+1)+": ");
			System.out.print("Enter name: "); name = sc.nextLine();
			System.out.print("Enter date of joining: "); day = sc.nextInt(); mon = sc.nextInt(); year = sc.nextInt();
			System.out.print("Enter semester: "); sem = sc.nextShort();
			System.out.print("Enter gpa: "); gpa = sc.nextFloat();
			System.out.print("Enter cgpa: "); cgpa = sc.nextFloat();
			s[i] = new Student(name, year, mon, day, sem, gpa, cgpa);
		}
		System.out.print("Choices: \n1) Display\n2)Sort wrt sem and cgpa\n3) Sort wrt name\n4) Names starting with entered character:\n5) Names with given substring\n6) Modify name in object\n7) Exit");
		do {
			System.out.print("Enter choice: "); choice = sc.nextInt();
			switch(choice){
			case 1:
				System.out.print("Student Records: ");
				for (i=0; i<n; i++) s[i].display(); 
				break;
			case 2:
				Student.sortsem(s);
				System.out.println("Records sorted wrt sem and cgpa");
				break;
			case 3:
				Student.sortname(s);
				System.out.print("Records sorted wrt name");
				break;
			case 4:
				System.out.print("Enter character: "); ch = sc.next().charAt(0);
				Student.namestart(s,ch);
				break;
			case 5:
				System.out.print("Enter substring: "); substr = sc.next();
				Student.namesubstr(s,substr);
				break;
			case 6:
				System.out.print("Enter index of object to be modified: "); index = sc.nextInt();
				s[index].modifyname();
				System.out.print("Object Modified");
				break;
			}
		}while (choice!=7);
	}
}