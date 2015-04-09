//
//  MessageBoard.swift
//  Health Social
//
//  Created by Ori's Air on 3/30/15.
//  Copyright (c) 2015 OriGen Health. All rights reserved.
//

import UIKit

class MessageBoard: PFObject, PFSubclassing {
    
    @NSManaged var title: String?
    @NSManaged var groupName: String?
    var threads: [Thread]? = []
    var sportsCenter: SportsCenter? = nil
    
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    class func parseClassName() -> String {
        return "MessageBoard"
    }
}
