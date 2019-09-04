//
//  WeirdFibonaci.swift
//  TrainingField
//
//  Created by itimotin on 7/30/19.
//  Copyright © 2019 ITS. All rights reserved.
//


//https://projecteuler.net/problem=25
//What is the index of the first term in the Fibonacci sequence to contain 1000 digits?

import Foundation

struct WeirdFibonacci {
    var contor : Int = 0
    var fibArray : [UInt64] = [0]
    mutating func calculateFibonacciRecursively(forIndex id:Int) -> UInt64 {
        
        if id == 1 || id == 2 {
            return 1
        }
        contor += 1
        return calculateFibonacciRecursively(forIndex: (id-1)) + calculateFibonacciRecursively(forIndex: (id-2))
    }
    
    mutating func calculateFibIterationMethod(forIndex id:Int) -> UInt64 {
        var i = 1
        var array : [UInt64] = [0]
        while i <= id {
            if i == 1 {
                array.append(1)
            }else {
                array.append(array[i-1]+array[i-2])
            }
            i += 1
            contor += 1
        }
        return array.last!
    }
    
    mutating func calculateFibonacciWithMemoization(forIndex id:Int) -> UInt64 {
        if (fibArray[id] != 0 || id == 0) {
            return fibArray[id]
        } else if id == 1 {
            fibArray[id] = 1
            contor += 1
            return 1
        } else {
            contor += 1
            let fibSum = calculateFibonacciWithMemoization(forIndex: id-1) + calculateFibonacciWithMemoization(forIndex: id-2)
            fibArray[id] = fibSum
            return fibSum
        }
    }
    
    mutating func initializeArray(lenght l: Int) {
        fibArray = Array(repeating: 0, count: l+1)
    }
    
    mutating func calculateFibIterationMethodVerbose() -> Int {
        var countIndex = 0
        var i = 1
        let zeroLinkedList = LinkedList<Int8>()
        zeroLinkedList.append(value: 0)
        var array : [LinkedList<Int8>] = [zeroLinkedList]
        print("\(array[0].count) digits at index \(countIndex)")
        while array[i-1].count < 1000 {
            if i == 1 {
                let oneLinkedList = LinkedList<Int8>()
                oneLinkedList.append(value: 1)
                array.append(oneLinkedList)
            }else {
                let nextLinkedList = array[i-1].add(list:array[i-2])
                array.append(nextLinkedList)
            }
            
            countIndex += 1
            print("\(array[i].count) digits at index \(countIndex)")
            i += 1
        }
        array.last?.printListAsString()
        return countIndex
    }
    
    
    mutating func run(){
//        contor = 0
//        let index = 93 // no more than 93
//        let linkedList = LinkedList<Int8>()
//        print(calculateFibIterationMethodVerbose(forIndex: index))
         let indexWith1000Digits = calculateFibIterationMethodVerbose()
        print("fibonacci with 1000 Digits are at index \(indexWith1000Digits)")
        
//        var timeStart = CFAbsoluteTimeGetCurrent()
        
//        print("Recusion method")
//        timeStart = CFAbsoluteTimeGetCurrent()
//        print("Fibonacci at index \(index) is \(calculateFibonacciRecursivelyTo(forIndex: index))")
//        print("Spend time \(CFAbsoluteTimeGetCurrent()-timeStart)")
//        print("For recursion we made \(contor) steps\n")

//        contor = 0
//        print("Iteration method")
//        timeStart = CFAbsoluteTimeGetCurrent()
//        print(calculateFibIterationMethod(forIndex: index))
//        print("Spend time \(CFAbsoluteTimeGetCurrent()-timeStart)")
//        print("For iteration method we made \(contor) steps\n")
        
//        contor = 0
//        print("Recursive MEMOIZATION method")
//        initializeArray(lenght: index)
//        timeStart = CFAbsoluteTimeGetCurrent()
//        print(calculateFibonacciWithMemoization(forIndex: index))
//        print("Spend time \(CFAbsoluteTimeGetCurrent()-timeStart)")
//        print("For recursive memoization we made \(contor) steps\n")
//
//        let result = calculateFibonacciWithMemoization(forIndex: index)
//                print("Fib at index \(index) = \(result)")
//                print("fibonacci sequence contains \(String(result).count)")

    }
    
}
