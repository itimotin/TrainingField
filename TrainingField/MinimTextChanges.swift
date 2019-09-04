//
//  MinimTextChanges.swift
//  TrainingField
//
//  Created by itimotin on 7/29/19.
//  Copyright © 2019 ITS. All rights reserved.
//

import Foundation

struct MinimTextChanges {
    //l 
//    let upperCase = CharacterSet.uppercaseLetters
    private func caseUnification(inputString: String) -> String {
        var indicator = 0
        inputString.forEach{
            if $0.isLowercase {
                indicator -= 1
            }else {
                indicator += 1
            }
        }
        
        if indicator <= 0 {
            return inputString.lowercased()
        }else {
            return inputString.uppercased()
        }
    }
    
    func run () {
       var changedText = caseUnification(inputString: "Aba")
        print("Aba => \(changedText)")
        changedText = caseUnification(inputString: "zzzzzz")
        print("zzzzzz => \(changedText)")
    }
}
