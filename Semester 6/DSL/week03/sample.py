import numpy as np
import random
# A = np.array ([2,5,10])
# print(A.dtype)

# B=np.array ([2.4,10.6,5.2])
# print(B.dtype)

# A=np.array([(3,4,5),(12,6,1)])
# Z=np.zeros((2,4))
# print(A)
# print(Z)

# S=np.arange(10,30,5)
# print(S)

# S1=np.linspace(0,2,9)
# print(S1)

# print("random functions")
# print(random.choice([1,2,3,4,5]))
# print(random.choice('python'))
# print(random.randrange(25,50))
# print(random.randrange(25,50,2))
# print(random.random())
# print(random.uniform(5,10))
# print(random.shuffle([1,2,3,4,5]))
# print(random.seed(10))


# a = np.arange(15).reshape(3, 5)
# print(a)
# print(a.shape)
# print(a.size)
# print(a.T)
# c = np.arange(24).reshape(2,3,4)
# print(c)

# print()
# a = np.array( [20,30,40,50] )
# b = np.arange( 4 )
# print(b)
# c = a-b
# print(c)


# b = np.arange(12).reshape(3,4)
# print(b.sum(axis=0))
# print(b.sum(axis=1))


# A1=np.array([(3,4,5),(12,6,1)])
# A2=np.array([(1,2,6),(-4,3,8)])
# D1=np.vstack((A1,A2))
# print(D1)
# D2=np.hstack((A1,A2))
# print(D2)
# a = np.array([4.,2.])
# b = np.array([3.,8.])
# print(np.column_stack((a,b)))
# print(np.hstack((a,b)))

a=np.array([(3,2,9),(1,6,7)])
s1=0
for row in a:
	for col in row:
		s1+=col
print(s1)

a=np.array([(3,2,9),(1,6,7)])
s=0
for i in range(a.shape[0]):
	for j in range(a.shape[1]):
		s+=a[i,j]
print(s)

