//
//  Node.swift
//  TrainingField
//
//  Created by itimotin on 7/30/19.
//  Copyright © 2019 ITS. All rights reserved.
//

import Foundation

public class LinkedNode<T> {
    var value: T? = nil
    weak var previous: LinkedNode?
    var next : LinkedNode?

    
    public init(value: T) {
        self.value = value
    }
}
