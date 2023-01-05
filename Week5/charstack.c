#include <stdio.h>
#define MAX 10
struct stack
{
    int top;
	char stk[MAX];
}s;

int isEmpty()
{
	if (s.top==-1) return 1;
	return 0;
}

int isFull()
{
	if (s.top==MAX-1) return 1;
	return 0;
}

void push()
{	
	char x;
	printf("Enter element to push: ");
	scanf(" %c", &x);
	if (isFull()) printf("Stack Overflow\n");
	else 
	{
		s.stk[++s.top] = x;
	}
}

void pop ()
{
	if (isEmpty()) printf("Stack Underflow\n");
	else
	{
		char c=s.stk[s.top];
		s.top--;
		printf("Popped: %c", c);
	}
}

void display()
{
	for (int i=0; i<=s.top; i++)
	{
		printf("%c ", s.stk[i]);
	}
	printf("\n");
}

int main()
{	
	int op;
	s.top=-1;
	do 
	{ 
		printf("1- Push ; 2- Pop ; 3- Display ; 0- Exit\nEnter choice: ");
		scanf("%d", &op);
		switch (op)
		{
			case 1:
				push();
				break;
			case 2:
				pop();
				break;
			case 3:
				display();
				break;
		}
	} while (op!=0);
	return 0;
}