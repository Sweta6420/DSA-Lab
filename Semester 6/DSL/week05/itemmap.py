import fileinput
for line in fileinput.input():
	data = line.strip().split("\t")
	if len(data) == 4:
		age,cp,chol,thalach= data
		print ("{0}\t{1}".format(age,chol))

