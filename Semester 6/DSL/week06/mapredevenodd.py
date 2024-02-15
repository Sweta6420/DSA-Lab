# import random
# f = open('natural.txt','w+')
# for i in range(1000):
# 	line = str(random.randint(1, 10000))+" "
# 	f.write(line)
# f.close()

f = open('natural.txt','r')
even,odd = 0,0
data = f.read().strip().split(" ")
for i in data:
	i = int(i)
	if i%2==0:
		even+=1
	else:
		odd+=1
print("even ", even)
print("odd ", odd)