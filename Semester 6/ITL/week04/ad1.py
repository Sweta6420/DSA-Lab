class solution:
    def isValid(str):
        stack = []
        for i in str:
            if i=='{' or i=='(' or i=='[':
                stack.append(i)
            if i=='}' and stack.pop()=='{':
                continue
            if i==']' and stack.pop()=='[':
                continue
            if i==')' and stack.pop()=='(':
                continue
        if len(stack)==0:
            return True
        return False
    
print(solution.isValid("{{([][])}}"))


