def main():
    f = open('a.txt', 'r')
    text = f.read()
    f.close()
    text1 = text[::-1]
    f1 = open('b.txt','w+')
    f1.write(text1)
    f1.close()
		
if __name__ == '__main__':
	main()