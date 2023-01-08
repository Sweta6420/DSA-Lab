#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX 10

typedef struct
{
    char arr[MAX];
    int front,rear;
}DQ_STR;

int isEmpty(DQ_STR *s)
{
    if(s->rear == -1) return 1;
    return 0;
}
void insert(DQ_STR *s, char x)
{
    if(isEmpty(s))
    {
        s->front=s->rear=0;
        s->arr[0]=x;
    }
    else s->arr[++s->rear]=x;
}

char deleteleft(DQ_STR *s)
{
    char c = s->arr[s->front++];
    return c;
}

char deleteright(DQ_STR *s)
{
    char c = s->arr[s->rear--];
    return c;
} 
void display(DQ_STR s)
{
    for(int temp = s.front; temp<=s.rear; temp++)
        printf("%c",s.arr[temp]);
}

int main()
{
    DQ_STR s;
    s.front = s.rear =-1;
    printf("Enter a string : ");
    char arr[MAX];
    scanf("%s",arr);
    for(int i=0; arr[i]!='\0'; i++) insert(&s,arr[i]);
    display(s);
    int f=1;
    while(s.front!=s.rear && !isEmpty(&s))
    {
        char c1=deleteleft(&s);
        char c2=deleteright(&s);
        if(c1!=c2) f=0; break;
    }
    if(f==0) printf("\nNot a palindrome");
    else if(f==1) printf("\nPalindrome");
    return 0;
}