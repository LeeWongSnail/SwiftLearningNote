//
//  ControlFlow.swift
//  SwiftLearningNoteDemo
//
//  Created by LeeWong on 2021/7/4.
//

import Foundation

func switchFallthrough() -> Void {
    let integerToDescribe = 5
    var description = "The number \(integerToDescribe) is"
    switch integerToDescribe {
    case 2, 3, 5, 7, 11, 13, 17, 19:
        description += " a prime number, and also"
        fallthrough
    case 9:
        description += " fallthrough"
        fallthrough
    default:
        description += " an integer."
    }
    print(description)
    // 输出“The number 5 is a prime number, and also an integer.”
}

func forinLiteral() -> Void {
    let minuteInterval = 5;
    let minutes = 60;
    for trckMark in stride(from: 0, to: minutes, by: minuteInterval) {
        // 从0-60范围内打印 每次的变化量为5
        print(trckMark)
    }
    print("--------------------")
    let hours = 12
    let hourInterval = 3
    for trckMark in stride(from: 3, through: hours, by: hourInterval) {
        print(trckMark)
    }
}

func switchCase() -> Void {
//    let anotherCharacter: Character = "a"
//    switch anotherCharacter {
//    case "a": // 无效，这个分支下面没有语句
//    case "A":
//        print("The letter A")
//    default:
//        print("Not the letter A")
//    }
    // 这段代码会报编译错误
}
