//
//  ClassAndStruct.swift
//  SwiftLearningNoteDemo
//
//  Created by LeeWong on 2021/7/11.
//

import Foundation
import UIKit



func copyTest() -> Void {
    var array: Array = ["1","2"]
//    var other = array
//    printAddress(values: array)
//    printAddress(values: other)
  
    
    array.append("3")
    array.append("4")
}

func printAddress(values:AnyObject...){
    for value in values {
        print(Unmanaged.passUnretained(value).toOpaque())
    }
    line()
}
func line(){
    print("----------------")
}
