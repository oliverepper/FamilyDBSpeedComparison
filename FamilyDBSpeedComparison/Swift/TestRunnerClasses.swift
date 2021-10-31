//
//  TestRunnerClasses.swift
//  FamilyDBSpeedComparison
//
//  Created by Oliver Epper on 31.10.21.
//

import Foundation

private final class Person {
    let name: String
    let age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

private final class Family {
    let name: String
    var members: [Person] = []

    init(_ name: String) {
        self.name = name
    }

    func addPerson(_ person: Person) {
        members.append(person)
    }

    func removePerson(_ person: Person) {
        members.removeAll(where: { $0.name == person.name} )
    }
}

public func runSwiftStructs() {
    let family = Family("Test")
    (1...1_000_000).forEach { int in
        family.addPerson(Person(name: "Test Person", age: int))
    }
    print("Family size: \(family.members.count)")
}

