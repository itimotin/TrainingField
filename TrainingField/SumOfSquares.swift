//
//  SumOfSquares.swift
//  TrainingField
//
//  Created by itimotin on 7/29/19.
//  Copyright © 2019 ITS. All rights reserved.
//

import Foundation
struct SumOfSquares {
    private func sumOfSquares(n: Int) -> Int {
        
        if n < 1 { return 0 }
        
        return sumOfSquares(n: n - 1) + (n * n)
    }
    
    func run() {
        print(sumOfSquares(n: 5))
    }
}
