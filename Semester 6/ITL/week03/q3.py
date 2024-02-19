def binary_search(a, low, high, x):
    if high >= low:
        mid = (high + low) // 2
        if a[mid] == x:
            return mid
        elif a[mid] > x:
            return binary_search(a, low, mid - 1, x)
        else:
            return binary_search(a, mid + 1, high, x)
    else:
        return -1

a = [12,2,5,14,23,74]
x = 5
y = binary_search(a, 0, len(a)-1, x)
if y==-1:
    print("Element not found")
else:
    print("Element found at index ", y)