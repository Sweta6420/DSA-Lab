#include <stdio.h>
void rstrcopy(char str1[100], char str2[100], int i)
{
	str2[i]=str1[i];
	if (str1[i]=='\0') return;
	else rstrcopy(str1, str2, i+1);
}
void main()
{
	printf("Enter a string: ");
	char str[100], str2[100];
	scanf("%s", str);
	rstrcopy(str, str2, 0);
	printf("Copied string: %s", str2);
}