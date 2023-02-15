class Building
{
	int sqft;
	int stories;
	void setvalues(int st, int sq){stories=st; sqft = sq;}
	void getvalues()
	{
		System.out.println("Number of stories: " + stories);
		System.out.println("Square footage: " + sqft);
	}
}
class House extends Building
{
	int bed;
	int bath;
	void setvalues(int st,int sq,int be, int ba) {stories=st; sqft = sq; bed = be; bath = ba;}
	void getvalues()
	{
		System.out.println("Number of stories: " + stories);
		System.out.println("Square footage: " + sqft);
		System.out.println("Number of bedrooms: " + bed);
		System.out.println("Number of bathrooms: " + bath);
	}
}
class School extends Building
{
	int classes;
	String grade;
	void setvalues(int st,int sq,int c,String g) {stories=st; sqft = sq; classes = c; grade = g;}
	void getvalues()
	{
		System.out.println("Number of stories: " + stories);
		System.out.println("Square footage: " + sqft);
		System.out.println("Number of classrooms: " + classes);
		System.out.println("Grade Level: " + grade);
	}
}

class Q2
{
	public static void main(String args[])
	{
		Building b1 = new Building();
		b1.setvalues(4,1800);
		System.out.println("Building");
		b1.getvalues();
		House h1 = new House();
		h1.setvalues(4,1800,3,3);
		System.out.println("House");
		h1.getvalues();
		School s1 = new School();
		s1.setvalues(4,1800,10,"Middle");
		System.out.println("School");
		s1.getvalues();
	}
}
