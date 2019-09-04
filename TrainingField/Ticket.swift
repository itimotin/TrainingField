//
//  IsLucky.swift
//  TrainingField
//
//  Created by itimotin on 7/29/19.
//  Copyright © 2019 ITS. All rights reserved.
//
/*
 Ticket numbers usually consist of an even number of digits. A ticket number is considered
 lucky if the sum of the first half of the digits is equal to the sum of the second half.
 
 Given a ticket number n, determine if it's lucky or not.
 
 Example
 
 For n = 1230, the output should be
 isLucky(n) = true;
 For n = 239017, the output should be
 isLucky(n) = false.
 */

import Foundation
struct Ticket {
    func isLucky(n: Int) -> Bool {
        var array2 = [Int]()
        var i = n
        while i > 0 {
            array2.append(i%10);
            i/=10
        }
        
        if array2.count % 2 != 0 {
            return false
        }
        
        var firstPartPosition = 0
        var lastPartPosition = array2.count-1
        var sumFirstPart = 0
        var sumLastPart = 0
        while firstPartPosition < lastPartPosition {
            sumFirstPart += array2[firstPartPosition]
            sumLastPart += array2[lastPartPosition]
            firstPartPosition += 1
            lastPartPosition -= 1
        }
        
        return sumFirstPart == sumLastPart
    }
    
    public func isLuckyOtherMethod(n:Int) -> Bool {
        let array = n.digits
        let middle : Int = array.count / 2

        return  array.prefix(middle).reduce(0, +) == array.suffix(middle).reduce(0, +)
    }
    
    func getArrayFrom(number n: Int) -> [Int]{
        
        let array = String(describing: n).compactMap {Int(String($0))}
        print("\nConvert: \(n) => \(array)\n")
        return array
    }
    
    func run (){
        let ticket = Ticket()
        print(ticket.isLucky(n: 1212))
        print(isLucky(n: 123321))
        let answer = ticket.isLuckyOtherMethod(n: 221132)
        print(answer)
        
        _ = ticket.getArrayFrom(number: 1002002001)
    }
}
extension BinaryInteger {
    var digits: [Int] {
        return String(describing: self).compactMap { Int(String($0)) }
    }
}
