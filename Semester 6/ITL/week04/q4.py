class solution:
    string = ""
    def getString(self,str):
        self.string = str
    def printString(self):
        return self.string.upper()
    
ans = solution()
ans.getString("Hello World")
print(ans.printString())


