#include <stdio.h>
#include <stdlib.h>
struct dofb{
	int day;
	int *month;
	int year;
};
struct info{
	int reg_no;
	char *name;
	char address[20];
};
struct coll{
	char *cname;
	char uname[20];
};
struct student{
	struct dofb *dob;
	struct info stu_info;
	struct coll college;
};
void read(struct student *p){
	printf("Enter date of birth: ");
	scanf("%d %d %d", &(p->dob->day), p->dob->month, &(p->dob->year));
	printf("Enter Registration Number: ");
	scanf("%d", &p->stu_info.reg_no);
	printf("Enter Name: ");
	scanf("%s", p->stu_info.name);
	printf("Enter Address: ");
	scanf("%s", p->stu_info.address);
	printf("Enter College Name: ");
	scanf("%s", p->college.cname);
	printf("Enter University name: ");
	scanf("%s", p->college.uname);
}
void display(struct student *p){
	printf("Date of Birth\t\tReg_no\t\tName\t\tAddress\t\tCollege\t\tUniversity");
	printf("\n%d-%d-%d\t\t%d\t\t%s\t\t%s\t\t%s\t\t%s", p->dob->day, *(p->dob->month), p->dob->year, p->stu_info.reg_no, p->stu_info.name, p->stu_info.address, p->college.cname,p->college.uname);
}
int main()
{
	struct student *p;
	p = (struct student*) malloc (sizeof(struct student));
	p->dob = (struct dofb*) malloc (sizeof(struct dofb));
	p->dob->month = (int*) malloc (sizeof(int));
	p->stu_info.name = (char *) malloc (sizeof(char));
	p->college.cname = (char *) malloc (sizeof(char));
	read(p);
	display(p);
}