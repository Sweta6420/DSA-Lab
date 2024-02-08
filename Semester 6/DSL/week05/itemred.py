import fileinput
records = 0
chol_total = 0
for line in fileinput.input(): 
	data = line.strip().split("\t")
	if len(data) != 2:
		continue
	age, chol = data
	if chol=="chol":
		continue
	records += 1
	chol_total += float(chol)
print (records, "\t", chol_total)

