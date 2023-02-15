package com.course.structure;

public class School extends Building
{
	int classes;
	String grade;
	public void setschool(int st,int sq,int c,String g) {stories=st; sqft = sq; classes = c; grade = g;}
	public void getschool()
	{
		System.out.println("Number of stories: " + stories);
		System.out.println("Square footage: " + sqft);
		System.out.println("Number of classrooms: " + classes);
		System.out.println("Grade Level: " + grade);
	}
}