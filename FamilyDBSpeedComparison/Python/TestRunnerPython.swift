//
//  TestRunnerPython.swift
//  FamilyDBSpeedComparison
//
//  Created by Oliver Epper on 31.10.21.
//

import Foundation
import PythonKit

func runPython() {
    let sys = Python.import("sys")
    let path = FileManager.default.currentDirectoryPath
    sys.path.append(path)
    let test = Python.import("Test")
    test.run()
}
