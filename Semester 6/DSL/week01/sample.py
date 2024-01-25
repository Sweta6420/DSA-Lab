# counter = 100 # An integer assignment
# miles = 1000.0 # A floating point
# name = "John" # A string
# print (counter)
# print (miles)
# print (name)

# a = b = c = 1
# print(a)
# print(b)
# print(c)
# a, b, c = 1, 2, "john"
# print(a)
# print(b)
# print(c)

# a = 5 # integer assignment
# b= 4.56 #floating point assignment
# #mathematical operations with scalar variables
# print (5*a) # result 25
# print (a/2) # would give the result 2.5
# print(a**2)

# str = 'Hello World!'
# print (str) # Prints complete string
# print (str[0]) # Prints first character of the string
# print (str[2:5]) # Prints characters starting from 3rd to 5th
# print (str[2:]) # Prints string starting from 3rd character
# print (str * 2) # Prints string two times
# print (str + "TEST") # Prints concatenated string

# var1 = 'Hello World!'
# print ("Updated String :", var1[:6] + 'Python')

# print( "My name is %s and weight is %d kg!" % ('Abay', 55))
# str = "thIS is string example wow!!!";
# print(str.capitalize())
# print (str.lower())
# print(str.count('s'))
# print(str.find('s'))
# print(str.replace("is", "was"))
# print (str.swapcase())
# print (str.title())

# list = [ 'abcd', 786 , 2.23, 'john', 70.2 ]
# tinylist = [123, 'john']
# print (list) # Prints complete list
# print (list[0]) # Prints first element of the list
# print (list[1:3]) # Prints elements starting from 2nd till 3rd
# print (list[2:]) # Prints elements starting from 3rd element
# print (tinylist * 2) # Prints list two times
# print (list + tinylist) # Prints concatenated lists

# list = ['physics', 'chemistry', 1997, 2000];
# list.append('maths')
# print(list)
# del list[2]
# print(list)
# print('physics' in list)
# print('english' in list)
# print(len(list))
# print(list.count('physics'))
# print(list.pop())
# print(list)
# list.insert (2, 'maths')
# print(list)
# list.remove('chemistry')
# print(list)
# list.reverse()
# print(list)

# from math import *
# x= [9, 41, 12, 3, 74, 15]
# Largest=-inf
# for i in x:
# 	if i>Largest:
# 		Largest=i
# print(Largest)

total = 0
number = int(input('Enter a number: '))
# add numbers until number is zero
while number != 0:
	total += number # total = total + number
	number = int(input('Enter a number: '))
print('total =', total)