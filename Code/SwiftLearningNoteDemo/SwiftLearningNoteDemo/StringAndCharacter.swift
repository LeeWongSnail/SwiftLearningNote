//
//  StringAndCharacter.swift
//  SwiftLearningNoteDemo
//
//  Created by LeeWong on 2021/7/3.
//

import Foundation

func stringIndex() -> Void {
    let greeting = "Guten Tag!"
    greeting[greeting.endIndex] // error
    greeting.index(after: greeting.endIndex) // error
}

func stringAppend() -> Void {
//    var chara:Character = "A"
//    chara.append("B")
//    print(chara)
//
//    var chara1:Character = "A"
//    var chara2:Character = "B"
//
//    chara1 += chara2
//    print(chara1)
}

func stringUnicode() -> Void {
    let str = "🐨";
    for character in str.utf8 {
        print(character)
    }
}


func characterCount() -> Void {
    let str = "🐨";
    print(str.count)
    
    let helloStr = "Hello World!"
    print(helloStr.count)
}

func concatenatingString() -> Void {
    let badStart = """
    one
    two
    """
    
    let end = """
    three
    """
    print(badStart+end)

    let goodStart = """
    one
    two
    
    """
    
    print(goodStart+end)
}

func literString() -> Void {
    let extString = "Hello World!"
    for character in extString {
        print(character)
    }
    
    let characterArray:[Character] = ["H","e", "l", "l", "o"]
    print(String(characterArray))
}


func extendStringDelimiters() -> Void {
    // 使用#表示字符串中的特殊字符都转变成了普通的字符串
    let normalString = "Line 1\nLine 2"
    let extendString = #"Line 1\nLine 2"#

    print(normalString, extendString)
    
    let multiplier = 3
    let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
    print(message)
    
}

func stringWithUnicode() -> Void {
    let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
    // "Imagination is more important than knowledge" - Einstein
    let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
    let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
    let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496”
    print(wiseWords, dollarSign, blackHeart, sparklingHeart)
}

func multilineStringPrint() -> Void {
//    let str = """
//
//
//    this line is begain
//        thisi is the content
//        this line is end
//    """
//    print(str)
    
    let strWithConnection = """
    this line is begain
        this is the content
            this line is end
    """
    print(strWithConnection)
    
}
