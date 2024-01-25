import numpy as np
#1
# x = int(input("Enter number: "))
# for i in range(1,x+1):
# 	if x%i==0:
# 		print(i)


#2
# a = np.arange(9).reshape(3,3)
# print(a)
# print(a.sum(axis=0))
# print(a.sum(axis=1))


#3
# a = np.array([1.0,2.0,3.0,4.0])
# print(a)
# b = np.array((1.0,2.0,3.0,4.0))
# print(b)
# c = np.zeros((3,4))
# print(c)
# d = np.arange(0,21,5)
# print(d)
# print()
# e = np.arange(12).reshape((3,4))
# print(e)
# e = e.reshape((2,2,3))
# print(e)
# f = np.array([1, 2, 3, 4, 5])
# print("max: ",np.max(f))
# print("min: ",np.min(f))
# f = np.array([[11, 2, 3],[4, 5, 16],[7, 81, 22]])
# print(np.max(f, 0)) #maxcol
# print(np.max(f, 1))
# print(np.min(f, 0)) #mincol
# print(np.min(f, 1))
# print(np.sum(f))


#4
# a = np.arange(1,10).reshape((3,3))
# m,n = a.shape
# b = np.array([[0 for x in range(m)] for y in range(n)])
# print(a)
# for i in range(0,m):
# 	for j in range(0,n):
# 		b[j][i]=a[i][j]
# print(b)

#5
a = np.array([[1, 2, 3],[4, 5, 6],[7, 8, 9]])
b = np.array([[1, 2, 3],[4, 5, 6],[7, 8, 9]])
m = a.shape[0]
n = a.shape[1]
c = np.zeros((m,n))
for i in range(m):
	for j in range(n):
		c[i][j] = a[i][j]+b[i][j]
print(c)

#6
# a = np.array([[1, 2, 3],[4, 5, 6],[7, 8, 9]])
# b = np.array([[1, 2, 3],[4, 5, 6],[7, 8, 9]])
# m = a.shape[0]
# n = a.shape[1]
# c = np.zeros((m,n))
# for i in range(0,m):
# 	for j in range(0,n):
# 		c[i][j] = a[i][j]*b[i][j]
# print(c)
