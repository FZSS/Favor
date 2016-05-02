//
//  Favor.swift
//  Favor
//
//  Created by Fangzhou Chen on 5/1/16.
//  Copyright © 2016 Kevin Fangzhou Chen. All rights reserved.
//

import Foundation

class Favor {
    var ownerID : Int!
    var content : String!
    var category : String!
    var bounty : Int!
    
    
    init(ownerID : Int, content : String, category: String, bounty : Int) {
        self.ownerID = ownerID
        self.content = content
        self.category = category
        self.bounty = bounty
    }
}