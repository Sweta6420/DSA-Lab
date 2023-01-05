#include <stdio.h>
#include <string.h>
#define MAX 20
char stack[MAX];
int top=-1;
void push(char x)
{	
	stack[++top] = x;
}
char pop ()
{
	return stack[top--];
}
int isPalin(char str[MAX])
{	
	int n = strlen(str);
	for (int i=0; i<n; i++) push(str[i]);
	int f=1, i=0;
	while(top!=-1) {	
		if (pop()!=str[i++])
		{
			f=0;
			break;
		}
	return f;
	}
}
int main()
{
	char str1[MAX];
	printf("Enter string: ");
	scanf("%s", str1);
	if (isPalin(str1)) printf("Palindrome");
	else printf("Not a palindrome");
}
