#include <stdio.h>
#include <stdlib.h>
#define MAX 5
#define STRMAX 10
struct cqstr{
	char **str;
	int front,rear;
};

void init (struct cqstr *c)
{
	c->front = c->rear = -1;
	c->str = malloc (MAX *sizeof(char *));
	for (int i=0; i<MAX; i++) c->str[i] = malloc(sizeof(char)*STRMAX);
}

void insert(struct cqstr *c, char x[])
{
	int temp = (c->rear + 1)%MAX;
	if ((c->rear==MAX-1 && c->front==-1)|| c->front == temp) printf("Queue Overflow");
	else
	{
		c->rear = temp;
		for (int i=0; x[i]!='\0'; i++) *(*(c->str + c->rear)+i) = x[i];
}}

char* delete(struct cqstr *c)
{
	char *ch;
	char carr[STRMAX]="";
	if (c->front == c->rear) return "Queue underflow";
	c->front = (c->front + 1)%MAX;
	for (int i=0; *(*(c->str + c->front)+i)!='\0'; i++)
	{
		carr[i]=*(*(c->str + c->front)+i);
		*(*(c->str + c->front)+i) = ' ';
	}
	ch = carr;
	return ch;
}

void display(struct cqstr c)
{
	for(int temp = (c.front+1)%MAX; temp!=(c.rear); temp=(temp+1)%MAX)
	{
		printf("%s ",(*(c.str + temp)));
	}
	printf("%s\n",(*(c.str + c.rear)));
}

int main()
{	
	struct cqstr cq;
	init(&cq);
	int choice;
	printf("1) Insert\t2)Delete\t3)Display\t4)Exit\n");
	do
	{
		printf("Enter choice: ");
		scanf("%d",&choice);
		switch(choice)
		{
			case 1:
				printf("Enter string to insert: ");
				char s[STRMAX];
				scanf("%s",s);
				insert(&cq,s);
				break;
			case 2:
				printf("Deleted: %s\n",delete(&cq));
				break;
			case 3:
				printf("Queue values: ");
				display(cq);
		}
	}while (choice!=4);
return 0;
}