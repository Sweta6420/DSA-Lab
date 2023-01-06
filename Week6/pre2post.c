#include<stdio.h>
#include<string.h>
#include<stdlib.h>
# define MAX 20
char stack[MAX];
int top=-1;
void push(char c)
{
   stack[++top]=c;
}
char pop()
{
   return stack[top--];
}
int isOper(char c)
{
   switch(c)
   {
      case '+':
      case '-':
      case '/':
      case '*':
      case '^':
         return 1;
         break;
   }
   return 0;
}
int main()
{
   int n,i,j=0;
   char a,b,op,postfix[20],prefix[20];
   printf("Enter the prefix expression: ");
   scanf("%s",prefix);
   n=strlen(prefix);
   for(i=0;i<MAX;i++)
   stack[i]='\0';
   for(i=0;i<n;i++)
   {
      if(isOper(prefix[i]))
      {
         push(prefix[i]);
      }
      else
      { 
         postfix[j++]=prefix[i];
         while((top!=-1)&&(stack[top]=='@'))
         {
            a=pop(); postfix[j++]=pop();
         }
         push('@');
      }
   }
   postfix[j]='\0';
   printf("Postfix expression is: %s\n", postfix);
return 0;
}
