//
//  main.swift
//  FamilyDBSpeedComparison
//
//  Created by Oliver Epper on 31.10.21.
//

import Foundation

func measure(_ name: String, _ block: @escaping () -> Void) {
    print(name)
    var start = timespec()
    var end = timespec()
    clock_gettime(CLOCK_MONOTONIC_RAW, &start)
    block()
    clock_gettime(CLOCK_MONOTONIC_RAW, &end)
    let delta_us = (end.tv_sec - start.tv_sec) * 1000000 + (end.tv_nsec - start.tv_nsec) / 1000;
    print("delta \(delta_us) microsenconds")
    print("or \(delta_us/1000) milliseconds\n")
}

measure("SwiftStructs") {
    runSwiftStructs()
}

measure("SwiftClasses") {
    runSwiftClasses()
}

measure("Cpp") {
    runCpp()
}

measure("C") {
    runC()
}

measure("Python") {
    runPython()
}

