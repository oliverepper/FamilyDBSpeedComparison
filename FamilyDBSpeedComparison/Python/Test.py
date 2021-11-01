class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def __str__(self):
        return "My name is " + self.name

class Family:
    def __init__(self, name):
        self.name = name
        self.members = []

    def add(self, member):
        self.members.append(member)


def run():
    test = Family("Test")
    for i in range(0, 1000000):
        test.add(Person("Test Person", i))
    print("Family size " + str(len(test.members)))
