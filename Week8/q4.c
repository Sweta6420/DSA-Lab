#include <stdio.h>
#include <stdlib.h>
typedef struct
{
	int size1,f1,r1;
	int arr[100]; 
}Q;
void enqueue(Q *q,int x)
{
	if((q->r1+1)%(q->size1)!=(q->f1))
	{
		q->r1=(q->r1+1)%(q->size1);
		q->arr[q->r1]=x;
	}
}
int dequeue(Q *q)
{
	if(q->f1!=q->r1)
	{
		q->f1=(q->f1+1)%(q->size1);
		return q->arr[q->f1];
	}
	return '\0';
}
int empty(Q *q)
{
	if(q->r1==q->f1) return 1;
	return 0;
}
void rev(Q *q)
{
	if(empty(q)) return;
	int x=dequeue(q);
	rev(q);
	enqueue(q,x);
}
void disp(Q *q)
{
	int n=(q->f1+1)%(q->size1);
	int e=(q->r1+1)%(q->size1);
	while(n!=e)
	{
		printf("%d ",q->arr[n]);
		n=(n+1)%(q->size1);
	}
}
int main()
{
	Q q;
	q.r1=-1; q.f1=-1;
	q.size1=100;
	enqueue(&q,13);enqueue(&q,22);enqueue(&q,45);
	printf("Original: ");
	disp(&q);
	rev(&q);
	printf("\nReversed: ");
	disp(&q);
}