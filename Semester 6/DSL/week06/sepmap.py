import sys
def read_input(file):
	for line in file:
		yield line.split()
def main(separator='\t'):
	data = read_input(sys.stdin)
	for words in data:
		# output here will be the input for reducer.py
		for word in words:
			print ('%s%s%d' % (word, separator, 1))

if __name__ == "__main__":
	main()