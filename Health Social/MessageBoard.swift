//
//  MessageBoard.swift
//  Health Social
//
//  Created by Ori's Air on 3/30/15.
//  Copyright (c) 2015 OriGen Health. All rights reserved.
//

import UIKit

class MessageBoard: PFObject, PFSubclassing {
    override class func initialize() {
        var title: String? = nil
        var groupName: String? = nil
        var threads: [Thread?] = []
        var sportsCenter: SportsCenter? = nil
        
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    class func parseClassName() -> String! {
        return "MessageBoard"
    }
    
//    var title: String?
//    var groupName: String?
//    var threads: [Thread?]
//    var sportsCenter: SportsCenter?
//    
//    init(title: String? = nil, groupName: String? = nil, threads: [Thread?] = [], sportsCenter: SportsCenter? = nil) {
//        self.title = title
//        self.groupName = groupName
//        self.threads = threads
//        self.sportsCenter = sportsCenter

    }
