//
//  TestRunnerStructs.swift
//  FamilyDBSpeedComparison
//
//  Created by Oliver Epper on 31.10.21.
//

import Foundation

private struct Person: Equatable {
    let name: String
    let age: Int
}

private struct Family {
    let name: String
    var members: [Person] = []

    init(_ name: String) {
        self.name = name
    }

    mutating func addPerson(_ person: Person) {
        members.append(person)
    }

    mutating func removePerson(_ person: Person) {
        members.removeAll(where: { $0.name == person.name })
    }
}

public func runSwiftClasses() {
    var family = Family("Test")
    (1...1_000_000).forEach { int in
        family.addPerson(Person(name: "Test Person", age: int))
    }
    print("Family size: \(family.members.count)")
}
