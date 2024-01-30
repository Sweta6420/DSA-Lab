class solution:
    def two_sum(a,target):
        dict = {}
        for i in a:
            if i not in dict:
                dict[i]=a.index(i)
        
        for i in dict:
            if target-i in dict:
                return [dict[i],dict[target-i]]

print(solution.two_sum([10,20,10,40,50,60,70],60))


