def main():
	a = int(input("Enter number 1: "))
	o = input("Enter Operator: ")
	b = int(input("Enter number 2: "))
	if o=='+':
		print(a,' + ',b,' = ',a+b)
	elif o=='-':
		print(a,' - ',b,' = ',a-b)	
	elif o=='*':
		print(a,' * ',b,' = ',a*b)
	else:
		print(a,' / ',b,' = ',a/b)


if __name__ == '__main__':
	main()