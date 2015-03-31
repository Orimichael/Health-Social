//
//  MessageBoard.swift
//  Health Social
//
//  Created by Ori's Air on 3/30/15.
//  Copyright (c) 2015 OriGen Health. All rights reserved.
//

import UIKit

class MessageBoard: NSObject {
    var title: String?
    var groupName: String?
    var thread: Thread?
    var sportsCenter: SportsCenter?
    
    init(title: String? = nil, groupName: String? = nil, thread: Thread? = nil, sportsCenter: SportsCenter? = nil) {
        self.title = title
        self.groupName = groupName
        self.thread = thread
        self.sportsCenter = sportsCenter
    }
}
