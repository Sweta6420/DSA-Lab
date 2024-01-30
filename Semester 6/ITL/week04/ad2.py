class solution:
    def reverse_words(str):
        arr = str.split(' ')
        arr = arr[::-1]
        return arr
    
print(solution.reverse_words("This is the first program"))


