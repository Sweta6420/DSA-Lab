package com.course.structure;

public class House extends Building
{
	int bed;
	int bath;
	public void sethouse(int st,int sq,int be, int ba) {stories=st; sqft = sq; bed = be; bath = ba;}
	public void gethouse()
	{
		System.out.println("Number of stories: " + stories);
		System.out.println("Square footage: " + sqft);
		System.out.println("Number of bedrooms: " + bed);
		System.out.println("Number of bathrooms: " + bath);
	}
}