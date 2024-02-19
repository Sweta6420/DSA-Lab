def sort_alphabetically(a): 
    n = len(a)
    for i in range(1, n):
        key = a[i]
        j = i - 1
        while j >= 0 and a[j] > key:
            a[j+1] = a[j]
            j -= 1
        a[j+1] = key
    return a

def main():
    arr = ['hello','world','this','is','array']
    print(arr)
    newarr = sort_alphabetically(arr)
    print(newarr)
    
if __name__ == '__main__':
	main()