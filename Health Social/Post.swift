//
//  Post.swift
//  Health Social
//
//  Created by Ori's Air on 3/30/15.
//  Copyright (c) 2015 OriGen Health. All rights reserved.
//

import UIKit

class Post: NSObject {
    var messages: [String?]
    var timeStamp: NSDate?
    var parentThread: Thread?
    
    init(messages: [String?] = [], timeStamp: NSDate? = nil, parentThread: Thread? = nil) {
        self.messages = messages
        self.timeStamp = timeStamp
        self.parentThread = parentThread
    }
}
