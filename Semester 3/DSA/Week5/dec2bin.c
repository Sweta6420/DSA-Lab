#include <stdio.h>
#define MAX 20
int stack[MAX];
int top=-1;
void push(int x)
{
	stack[++top] = x;
}
int pop()
{
	return stack[top--];
}
void dec2bin(int n)
{
	while(n>0)
	{
		push(n%2);
		n/=2;
	}
	int i=top;
	while(top!=-1) printf("%d", pop());
}
int main()
{
	int n;
	printf("Enter number to convert: ");
	scanf("%d", &n);
	dec2bin(n);
}