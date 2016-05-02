//
//  Transaction.swift
//  Favor
//
//  Created by Fangzhou Chen on 5/1/16.
//  Copyright © 2016 Kevin Fangzhou Chen. All rights reserved.
//

import Foundation

class Transaction {
    var transactionID : Int!
    var askerID : Int!
    var doerID : Int!
    var favorID : Int!
    
    init (favorID: Int, doerID : Int, askerID : Int) {
        self.askerID = askerID
        self.doerID = doerID
        self.favorID = favorID
    }
}