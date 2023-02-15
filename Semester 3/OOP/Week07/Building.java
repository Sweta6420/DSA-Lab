package com.course.structure;

public class Building
{
	int sqft;
	int stories;
	public void setbuild(int st, int sq){stories=st; sqft = sq;}
	public void getbuild()
	{
		System.out.println("Number of stories: " + stories);
		System.out.println("Square footage: " + sqft);
	}
}


