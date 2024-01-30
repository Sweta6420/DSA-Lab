# class Person:
#     "This is a person class"
#     age = 10
#     def greet(self):
#         print('Hello')
# harry = Person()
# print(Person.greet)
# print(harry.greet)
# print(Person.__doc__)
# harry.greet()




# class Human:
#     species = "H. sapiens"
#     def __init__(self, name):
#         self.name = name
#         self._age = 0
#     def say(self, msg):
#         print("{name}: {message}".format(name=self.name, message=msg))
#     def sing(self):
#         return 'yo... yo... microphone check... one two... one two...'
    
#     #class method is shared among all instances. Called with the calling class as the first argument
#     @classmethod
#     def get_species(cls):
#         return cls.species
#     # A static method is called without a class or instance reference
#     @staticmethod
#     def grunt():
#         return "*grunt*"
    
#     # A property is just like a getter. Turns the method age() into an read-only attribute of the same name.
#     @property
#     def age(self):
#         return self._age
#     # This allows the property to be set
#     @age.setter
#     def age(self, age):
#         self._age = age
#     # This allows the property to be deleted
#     @age.deleter
#     def age(self):
#         del self._age

# if __name__ == '__main__':
#     # Instantiate a class
#     i = Human(name="Ian")
#     i.say("hi") 
#     j = Human("Joel")
#     j.say("hello") 
#     # Call our class method
#     i.say(i.get_species()) # "Ian: H. sapiens"
#     # Change the shared attribute
#     Human.species = "H. neanderthalensis"
#     i.say(i.get_species()) # => "Ian: H. neanderthalensis"
#     j.say(j.get_species()) # => "Joel: H. neanderthalensis"
#     # Call the static method
#     print(Human.grunt()) # => "*grunt*"
#     # Cannot call static method with instance of object because i.grunt() will automatically put "self" (the object i) as an argument
#     print(i.grunt())
#     # Update the property for this instance
#     i.age = 42
#     i.say(i.age) 
#     j.say(j.age) 
#     del i.age


# class py_solution:
#     def int_to_Roman(self, num):
#         val = [
#         1000, 900, 500, 400,
#         100, 90, 50, 40,
#         10, 9, 5, 4,
#         1
#         ]
#         syb = [
#         "M", "CM", "D", "CD",
#         "C", "XC", "L", "XL",
#         "X", "IX", "V", "IV",
#         "I"
#         ]
#         roman_num = ''
#         i = 0
#         while num > 0:
#             for _ in range(num // val[i]):
#                 roman_num += syb[i]
#                 num -= val[i]
#             i += 1
#         return roman_num
# print(py_solution().int_to_Roman(400))