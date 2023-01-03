#include <stdio.h>
#include <stdlib.h>
struct student
{	
	char name[20];
	int rollno;
	float cgpa;
};
void read(struct student *p)
{
	printf("Enter name: ");
	scanf("%s", p->name);
	printf("Enter rollno: ");
	scanf("%d", &(p)->rollno);
	printf("Enter cgpa: ");
	scanf("%f", &(p)->cgpa);
}
void display(struct student *p)
{
	printf("%s\t%d\t%.2f\n",p->name, p->rollno, p->cgpa);
}
void sort(struct student *p, int n)
{
	int i, j, temp;
	for (i=0; i<n-1; i++)
	{
		for(j=i+1; j<n; j++)
		{
			if ((p+i)->rollno > (p+j)->rollno)
			{
				temp = (p+i)->rollno;
				(p+i)->rollno = (p+j)->rollno;
				(p+j)->rollno = temp;
}}}}
int main()
{
	int n,i;
	printf("Enter number of students: ");
	scanf("%d", &n);
	struct student *p;
	p = (struct student*) malloc (n*sizeof(struct student));
	for (i=0; i<n; i++)
	{
		read(p+i);
	}
	sort(p, n);
	printf("Name\tRollNo\tCGPA\n" );
	for (i=0; i<n; i++)
	{
		display(p+i);
}}