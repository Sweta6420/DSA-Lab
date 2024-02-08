import sys
mostFreq = []
currMax = -1
for line in sys.stdin:
	count,word = line.strip().split('\t', 1)
	count = int(count)
	if count>currMax:
		currMax = count;
		mostFreq = [word]
	elif count==currMax:
		mostFreq.append(word)
for word in mostFreq:
	print( '%s\t%s' % (word,currMax) )

	