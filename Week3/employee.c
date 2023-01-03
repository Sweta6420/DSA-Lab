#include <stdio.h>
#include <stdlib.h>
struct dob
{
	int day;
	int month;
	int year;
};
struct address
{
	int houseno;
	int zip;
	char state[20];
};
struct employee
{
	char name[20];
	struct dob dofb;
	struct address addr;
};
void read(struct employee *p)
{
	printf("Enter name: ");
	scanf("%s", p->name);
	printf("Enter date of birth: ");
	scanf("%d %d %d", &(p)->dofb.day, &(p)->dofb.month, &(p)->dofb.year);
	printf("Enter address: ");
	scanf("%d %d %s", &(p)->addr.houseno, &(p)->addr.zip, p->addr.state);
}
void display(struct employee *p)
{
	printf("Name: %s\n", p->name);
	printf("Date of Birth: %d-%d-%d\n",p->dofb.day, p->dofb.month, p->dofb.year);
	printf("Address: %d, %d, %s\n", p->addr.houseno, p->addr.zip, p->addr.state);
}
int main()
{
	int i, n;
	struct employee *p;
	printf("Enter number of employees: ");
	scanf("%d", &n);
	p = (struct employee*) malloc (n*sizeof(struct employee));
	for (i=0; i<n; i++)
	{
		read(p+i);
	}	
	for (i=0; i<n; i++)
	{
		display(p+i);
}}