import com.course.structure.Building;
import com.course.structure.House;
import com.course.structure.School;
class Q1
{
	public static void main(String args[])
	{
		Building b1 = new Building();
		b1.setbuild(4,1800);
		System.out.println("Building");
		b1.getbuild();
		House h1 = new House();
		h1.sethouse(4,1800,3,3);
		System.out.println("House");
		h1.gethouse();
		School s1 = new School();
		s1.setschool(4,1800,10,"Middle");
		System.out.println("School");
		s1.getschool();
	}
}