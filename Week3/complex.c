#include <stdio.h>

struct complex
{
	int real;
	int imag;
};

void add(struct complex a, struct complex b)
{
	int realsum, imagsum;
	realsum = a.real + b.real;
	imagsum = a.imag + b.imag;
	printf("Sum: %d + %di\n", realsum, imagsum);
}

void subtract(struct complex a,struct complex b)
{
	int realdiff, imagdiff;
	realdiff = a.real - b.real;
	imagdiff = a.imag - b.imag;
	printf("Difference: %d + (%di)\n", realdiff, imagdiff);
}

void multiply(struct complex a, struct complex b)
{
	int realpart, imagpart;
	realpart = a.real*b.real - b.imag*a.imag;
	imagpart = a.real*b.imag + b.real*a.imag;
	printf("Product: %d + %di\n", realpart, imagpart);
}

int main()
{
	struct complex a;
	struct complex b;
	printf("Enter number: ");
	scanf("%d %d", &a.real, &a.imag);
	printf("Enter number: ");
	scanf("%d %d", &b.real, &b.imag);
	add(a,b);
	subtract(a,b);
	multiply(a,b);
}