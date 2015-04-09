//
//  Post.swift
//  Health Social
//
//  Created by Ori's Air on 3/30/15.
//  Copyright (c) 2015 OriGen Health. All rights reserved.
//

import UIKit

class Post: PFObject, PFSubclassing {
    
    @NSManaged var message: String?
    @NSManaged var parent: PFRelation
    @NSManaged var author: Person?
    
    override class func initialize() {

        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    class func parseClassName() -> String {
        return "Post"
    }
}
