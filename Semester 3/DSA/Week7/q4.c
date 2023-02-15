#include<stdio.h>  
#define MAX 5  
int stack1[5], stack2[5]; 
int top1=-1, top2=-1;   
int count=0;  
void push1(int data)  
{  
   if(top1==MAX-1)   printf("\n Stack Overflow");   
   else  stack1[++top1]=data; 
}  
int pop1()  
{  
   if(top1==-1)  printf("Empty stack");  
   else return stack1[top1--];   
}   
void push2(int x)  
{    
   stack2[++top2]=x;  
}   
int pop2()  
{  
   return stack2[top2--];  
}   
void enqueue(int x)  
{  
   push1(x);  
   printf("Added %d\n",x);
   count++;  
} 
int isEmpty(int top)
{
   return top==-1;
} 
void dequeue()  
{  
   if((top1==-1) && (top2==-1)) printf("Queue is empty");  
   else  
   {  
      if (isEmpty(top2)) 
      {
         while(!isEmpty(top1)) push2(pop1());
      }
      printf("Deleted: %d\n",pop2());
   }
}   
void main()  
{  
   enqueue(10);  
   enqueue(20);  
   enqueue(30);  
   dequeue();  
   enqueue(40);
   dequeue();  
   dequeue();    
   dequeue();  
   dequeue();    
}  