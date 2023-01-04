#include <stdio.h>
#include <string.h>
int rIsPalin(char str[100], int l, int r){	
	if (l==r) return 1;
	if (str[l]!=str[r]) return 0;
	if (l<r) return rIsPalin(str, l+1, r-1);
}
void main(){	
	char str[100];	
	printf("Enter string: ");
	scanf("%s", str);
	int n = strlen(str);
	if (rIsPalin(str, 0, n-1)) printf("Palindrome");
	else printf("Not a Palindrome");
}