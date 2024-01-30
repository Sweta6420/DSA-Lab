class solution:
    def pow(x,n):
        ans=1
        for i in range(n):
            ans*=x
        return ans

print(solution.pow(3,4))


