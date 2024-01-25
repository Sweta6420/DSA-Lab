# #1
# l = int(input("Enter length: "))
# b = int(input("Enter breadth: "))
# print("Area: ", l*b);


#2
# a = int(input("Enter a: "))
# b = int(input("Enter b: "))
# temp=a
# a=b
# b=temp
# print("a = ",a)
# print("b = ",b)

# #3
# a = int(input("Enter number: "))
# if a%2==0:
# 	print("Even")
# else:
# 	print("Odd")

#4
# a = int(input("Enter num1: "))
# b = int(input("Enter num2: "))
# c = int(input("Enter num3: "))
# if a>b and a>c:
# 	print(a)
# elif b>a and b>c:
# 	print(b)
# else:  
# 	print(c)

#5
# list = ['a','b','c']
# print(list * 2)
# print(list+['d'])
# list.append('e')
# print(list)
# del list[3]
# print(list)
# print(len(list))
# print(list.count('b'))
# print(list.pop())
# print(list)
# list.insert(1,'f')
# print(list)
# list.remove('f')
# print(list)
# list.reverse()
# print(list)

#6
# from math import * 
# t = (1,3,5,7,9,2,4,6,8,10)
# n = len(t)
# half = floor(n/2)
# print(t[:half],'\n',t[half:])

#7
# t = (12, 7, 38, 56, 78 )
# leven = []
# for i in t:
# 	if i%2==0:
# 		leven.append(i)
# print(leven)

#8
# l = [11, -21, 0, 45, 66, -93]
# for i in l:
# 	if i<0:
# 		print(i)

#9 
# l = [11, -21, 45, 66, -93]
# pcount=ncount=0
# for i in l:
# 	if i<0:
# 		ncount+=1
# 	elif i>0:
# 		pcount+=1
# print("Positives: ",pcount,"\nNegatives: ",ncount)

#10
list = [1,2,3,4]
for i in list.copy():
    if i%2==0:
        list.remove(i)
print(list)
