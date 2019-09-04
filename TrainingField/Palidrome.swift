//
//  Palidrome.swift
//  TrainingField
//
//  Created by itimotin on 7/30/19.
//  Copyright © 2019 ITS. All rights reserved.
//

import Foundation

class Palindrome {
    
    
    private func isOneSwapEnough(inputString: String) -> Bool {
        var array = Array(inputString)
        let length = inputString.count
        var i = 0
        var diffCounter = 0
        var diffArray = [[Character]]()
        diffArray.append([Character("-"), Character("-")])
        diffArray.append([Character("-"), Character("-")])

        
        
        while i < length/2 {
            if array[i] != array[length - i - 1]{
                if diffCounter == 2 {
                    i = length
                    return false
                }
                
                diffArray[diffCounter][0] = array[i]
                diffArray[diffCounter][1] = array[length-i-1]
                diffCounter += 1
            }
            i += 1
        }
        
        switch diffCounter {
        case 0:
            return true
        case 1:
            let mid = array[i]
            if length % 2 != 0 && (diffArray[0][0] == mid || diffArray[0][1] == mid) {
                return true
            }
        case 2:
            if ((diffArray[0][0] == diffArray[1][0] && diffArray[0][1] == diffArray[1][1])
                || (diffArray[0][0] == diffArray[1][1] && diffArray[0][1] == diffArray[1][0])){
                return true
            }
        default:
            return false
        }
        return false
    }
    
    func run(){
        var b : Bool = false
        var text = "aabaa"
        b = self.isOneSwapEnough(inputString: text)
        print("Can text:[\(text)] be palindrome by at most one swap: \(b)")
        
        text = "abab"
        b = self.isOneSwapEnough(inputString: text)
        print("Can text:[\(text)] be palindrome by at most one swap: \(b)")
        
        text = "aabcba"
        b = self.isOneSwapEnough(inputString: text)
        print("Can text:[\(text)] be palindrome by at most one swap: \(b)")
    }
}
