#include <stdio.h>
double pow(double base, double exp)
{	
	double ans=1;
	for (int i=0; i<exp; i++) ans*=base;
	return ans;
}
void toh(int n, char s, char i, char d){
	if (n==1){
		printf("Disc 1 moved from %c to %c\n", s, d);
		return;
	} else {
		toh(n-1, s, d, i);
		printf("Disc %d moved from %c to %c\n", n, s, d);
		toh(n-1, i, d, s);
}}
int main(){	
	int n, moves;
	printf("Number of discs: ");
	scanf("%d", &n);
	toh(n,'A','B','C');
	moves = (int) pow(2,(double)n);
	printf("Number of moves: %d",moves-1);
}