class circle:
    radius = 0
    def __init__(self,radius):
        self.radius = radius
    def area(self):
        return (3.14*self.radius*self.radius)
    def perimeter(self):
        return (6.28*self.radius)
    
c1 = circle(10)
print(c1.area())
print(c1.perimeter())