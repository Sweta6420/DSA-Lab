#include <stdio.h>
#define MAX 20
struct queue{
	int a[MAX];
	int front,rear;
};

struct queue q1;
struct queue q2;

void insertq(struct queue * q,int x)
{
	if(q->rear==MAX) printf("Overflow\n");
	else
	{
		q->a[++q->rear]=x;
		if(q->front==-1) q->front=0;
	}	
}

int deleteq(struct queue * q)
{
	int x;
	if(q->front==-1) printf("\nUnderflow!!!\n");
	else if(q->front==q->rear)
	{
		x=q->a[q->front];
		q->front=q->rear=-1;
		return x;
	}
	else return q->a[q->front++];
}

void display(struct queue q)
{
	for (int i=q.front; i<=q.rear; i++) printf("%d ",q.a[i]);
	printf("\n");
}
void find(int n,int ele)
{	
	int i,f=0;
	for (i=0; i<n; i++)
	{	
		int x = deleteq(&q1);
		insertq(&q2,x);
		if (x == ele) 
		{
			printf("Element found\n");
			f=1;
	}}
	if (i==n && f==0) printf("Element not found\n");
}
void complete(struct queue *qu1,struct queue *qu2)
{	
	while (qu2->front!=qu2->rear) 
	{
		int x = deleteq(qu2);
		insertq(qu1,x);
	}
	int x = deleteq(qu2);
	insertq(qu1,x);
}
int main()
{	
	int n,ele,x;
	q1.front = -1; q1.rear = -1;
	q2.front = -1; q2.rear = -1;
	printf("Enter number of elements: ");
	scanf("%d",&n);
	printf("Enter elements: ");
	for (int i=0; i<n; i++) 
	{
		scanf("%d", &x);
		insertq(&q1,x);
	}
	display(q1);
	printf("Enter element to search: ");
	scanf("%d",&ele);
	find(n,ele);
	complete(&q1,&q2);
	display(q1);
}