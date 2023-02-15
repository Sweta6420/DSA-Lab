#include <stdio.h>
#define MAX 10
int stack[MAX];
int top1 = -1;
int top2 = MAX;
void push1 (int data)
{
   if (top1 < top2 - 1)stack[++top1] = data;
   else printf ("Stack Full! \n");
}
void push2 (int data)
{
   if (top1 < top2 - 1) stack[--top2] = data; 
   else printf ("Stack Full!\n");
}
void pop1 ()
{
   if (top1 >= 0)
   {
      int popped = stack[top1--];
      printf ("%d is being popped from Stack 1\n", popped);
   }
   else printf ("Stack Empty! \n");
}
void pop2 ()
{
   if (top2 < MAX)
   {
      int popped = stack[top2++];
      printf ("%d is being popped from Stack 2\n", popped);
   }
   else printf ("Stack Empty! \n");
}
void display1 ()
{
   int i;
   for (i = top1; i >= 0; --i) printf ("%d ", stack[i]);
   printf ("\n");
}
void display2 ()
{
   int i;
   for (i = top2; i < MAX; ++i) printf ("%d ", stack[i]);
   printf ("\n");
}
int main()
{
   int c;
   int ele;
   printf("1) Push in stack1\n2) Push in stack 2\n3) Pop in stack 1\n4) Pop in stack 2 \n5) Print stack 1 \n6) Print stack 2\n7) Exit\n");
   do{
      printf("Enter choice: ");
      scanf("%d",&c);
      switch(c){
         case 1:
            printf("Enter element to be pushed: ");
            scanf("%d",&ele);
            push1 (ele);
            break;
         case 2:
            printf("Enter element to be pushed: ");
            scanf("%d",&ele);
            push2 (ele);
            break;
         case 3:    
            pop1 ();
            break;
         case 4:    
            pop2 ();
            break;
         case 5:
            display1 ();
            break;
         case 6:
            display2 ();
            break;
      }}while( c!=7 );
return 0;
}
