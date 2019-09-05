//
//  LinkedList.swift
//  TrainingField
//
//  Created by itimotin on 7/30/19.
//  Copyright © 2019 ITS. All rights reserved.
//

import Foundation

class LinkedList<T> {
    public typealias Node = LinkedNode<T>
    private var head: Node?
    private var tail: Node?
    
    var isEmpty: Bool {
        return head == nil
    }
    var first: Node? {
        return head
    }

    var last: Node? {
        //That takes a lot of running time and is O(n)
        guard var node = head else {
            return nil
        }
        while let next = node.next{
            node = next
        }
        return node
    }
    
    
    
    public func append(value: T) {
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
            tail = newNode
        } else {
            head = newNode
        }
    }
    
    public func insertFirst(value: T){
        let newNode = Node(value: value)
        if let first = first {
            newNode.next = first
            first.previous = newNode
            head = newNode
        }else {
            head = newNode
        }
    }
    
    public func insert(_ node: Node, atIndex index: Int) {
        let newNode = node
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let prev = self.node(atIndex: index-1)
            let next = prev.next
            
            newNode.previous = prev
            newNode.next = prev.next
            prev.next = newNode
            next?.previous = newNode
        }
    }
    
    public func reversed() {
        var node = head
        tail = node // If you had a tail pointer
        while let currentNode = node {
            node = currentNode.next
            swap(&currentNode.next, &currentNode.previous)
            head = currentNode
        }
    }

    
    public var count: Int {
        guard var node = head else {
            return 0
        }
    
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    
    public func node(atIndex index: Int ) -> Node{
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil {
                    break
                }
            }
            return node!
        }
    }
    
    public func reverse() -> LinkedList<T>?{
        guard var node = last else{
            return nil
        }
        let reversedLL = LinkedList<T>()
        reversedLL.append(value: node.value!)
        while let previous = node.previous{
            node = previous
            reversedLL.append(value: node.value!)
        }
        return reversedLL
    }
    
    public func add(list l: LinkedList<T>) -> LinkedList<T>{
        let linkedListResult = LinkedList<Int8>()
        guard var node = last else {
            return l
        }
        guard var addedNode = l.last else {
            return self
        }
        
        var temporarySum : Int8 = 0;
        
        while let previous = node.previous, let previous2 = addedNode.previous {
            let sum = (node.value as! Int8) + (addedNode.value as! Int8) + temporarySum
            temporarySum = sum / 10
            
            linkedListResult.insertFirst(value: sum%10)
            
            node = previous
            addedNode = previous2
            
        }
        
        
        
        let sum = (node.value as! Int8) + (addedNode.value as! Int8) + temporarySum
        temporarySum  = sum / 10
        linkedListResult.insertFirst(value: sum%10)
        
        while let previous = node.previous {
            let sum = (previous.value as! Int8) + temporarySum
            temporarySum = sum / 10
            linkedListResult.insertFirst(value: sum % 10)
            node = previous
        }
        while let previous = addedNode.previous {
            let sum = (previous.value as! Int8) + temporarySum
            temporarySum = sum / 10
            linkedListResult.insertFirst(value: sum % 10)
            addedNode = previous
        }
        
        if temporarySum != 0 {
            linkedListResult.insertFirst(value: temporarySum)
        }
        
        return linkedListResult as! LinkedList<T>
    }
    
    public func printListAsString() {
        guard var node = self.head else {
            print("OPS! the list is empty!")
            return
        }
        var textToPrint : String = "" + String(node.value! as! Int8)
    
        while let next = node.next{
            node = next
            textToPrint = textToPrint + String(node.value! as! Int8)
        }
        print(textToPrint)
    }
    
    public func printList<T>(list l: LinkedList<T>) where T : LosslessStringConvertible{
        guard var node = l.head else {
            print("The list is empty")
            return
        }
        //        var count = 1
        //        print("\(count) item is \(node.value!)")
        var textToPrint = String(node.value!) + " -> "
        while let next = node.next {
            node = next
            //            count += 1
            //            print("\(count) item is \(node.value!)")
            textToPrint = textToPrint + String(node.value!) + " -> "
        }
        textToPrint = textToPrint + " nil"
        print(textToPrint)
    }
    
    public func run () {
        let list = LinkedList<Int8>()
        print("Is list empty? : \(list.isEmpty)")
        print("\nWe will append one item: #1")
        list.append(value: 1)
        print("Show first item in list: \(list.first!.value!)")
        print("Show last item in list: \(list.last!.value!)")
        print("\nJust Appended 2nd element: #2")
        list.append(value: 2)
        print("Show first item in list: \(list.first!.value!)")
        print("Show last item in list: \(list.last!.value!)")
        
        print("get number at index 1: \(list.node(atIndex: 1).value!)")
        
        print("\nJust Appended 3rd element: #3")
        list.append(value: 3)
        
        print("We will reverse the list. Output need to be 3 -> 2 -> 1")
        printList(list: list.reverse()!)
        print("I will add an item at first position, this item will be #0")
        list.insertFirst(value: 9)
        print("Output need to be like 9 -> 1 -> 2 -> 3")
        printList(list: list)
//        let listReversed = reverse()
//        printList(list: listReversed)
        let list2 = LinkedList<Int8>()
        list2.append(value: 9)
        list2.append(value: 9)
        list2.append(value: 9)
        
        let listSum = list2.add(list: list)
        printList(list: listSum)
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String{
        var s = "["
        var node = head
        while node != nil {
            s += "\(node!.value!)"
            node = node!.next
            if node != nil {s += ", "}
        }
        return s + "]"
    }
}
