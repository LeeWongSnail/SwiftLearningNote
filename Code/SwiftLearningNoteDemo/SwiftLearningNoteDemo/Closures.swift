//
//  Closures.swift
//  SwiftLearningNoteDemo
//
//  Created by LeeWong on 2021/7/6.
//

import Foundation

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//names.sort(by: <#T##(String, String) throws -> Bool#>)

func compareString(str1: String, str2: String) -> Bool {
    return str1 > str2
}


