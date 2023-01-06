//Evaluation of prefix expression
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#define MAX 20
typedef struct stack
{
    int data[MAX];
    int top;
}stack;
int evaluate(char x,int op1,int op2)
{
    if(x=='+')
    return(op2+op1);
    if(x=='-')
    return(op2-op1);
    if(x=='*')
    return(op2*op1);
    if(x=='/')
    return(op2/op1);
    if(x=='%')
    return(op2%op1);
}
void init(stack *s)
{
    s->top=-1;
}

void push(stack *s,int x)
{
    s->top=s->top+1;
    s->data[s->top]=x;
}
int pop(stack *s)
{
    int x;
    x=s->data[s->top];
    s->top=s->top-1;
    return x;
}
void rev(char s[MAX])
{
    char temp;
    int n = strlen(s);
    for (int i=0; i<=(n/2); i++)
    {
        temp = s[i];
        s[i] = s[n-i-1];
        s[n-i-1] = temp;
    }
}
int main()
{
    stack s;
    char x[MAX];
    int op1,op2,val,i=0;
    init(&s);
    printf("Enter the prefix expression: ");
    scanf("%s", x);
    rev(x);
    while(x[i]!='\0')
    {
        if(isdigit(x[i]))
        push(&s,x[i]-'0');
        else
        {
            op2=pop(&s);
            op1=pop(&s);
            val=evaluate(x[i],op1,op2);
            push(&s,val);
        }
        i++;
    }
    val=pop(&s);
    printf("Value of expression: %d\n",val);
    return 0;
}