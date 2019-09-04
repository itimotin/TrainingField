//
//  CoolString.swift
//  TrainingField
//
//  Created by itimotin on 7/30/19.
//  Copyright © 2019 ITS. All rights reserved.
//

import Foundation


/*Let's call a string cool if it is formed only by English letters and no two lowercase and no two uppercase letters are in adjacent positions. Given a string, check if it is cool.*/
class CoolString {
    func coolString(inputString: String) -> Bool {
        let a = Array(inputString)
        for i in 0..<a.count {
            if i+1 < a.count {
                if !(a[i].isLowercase && a[i+1].isUppercase || a[i+1].isLowercase && a[i].isUppercase) {
                    return false
                }
            } else{
                break
            }
        }
        return true
    }
    
    func run() {
        print("\n================================")
        print("Is 'aQwFdA' cool string?")
        print(coolString(inputString: "aQwFdA"))
        print("Is 'aAA' cool string?")
        print(coolString(inputString: "aAA"))
        print("Is 'q q' cool string?")
        print(coolString(inputString: "q q"))
        print("================================\n")
    }
}
