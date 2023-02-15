// Pointers and Functions Demonstration

#include <stdio.h>

void swap (int *a, int *b)
{
	int t;
	t = *a;
	*a = *b;
	*b = t;
}
void add(int *a, int *b, int *c)
{
	*c = *a + *b;
}

int main()
{
	int a, b, c;
	printf("Enter 2 numbers: ");
	scanf("%d %d", &a, &b);
	swap(&a, &b); 	// passing pointers to a function swap 
	printf("Numbers after swapping: %d %d", a, b);
	add (&a, &b, &c);	// returning pointer from a function 
	printf("\nSum: %d", c);
	int *p1, **p2;
	p1 = &a; //p1 points to an integer a
	p2 = &p1; //p2 points to a pointer which points to an integer
	printf("\nValue of a: %d\nAddress of a: %p\nAddress of address of a: %p", *p1, p1, p2);
return 0;
}