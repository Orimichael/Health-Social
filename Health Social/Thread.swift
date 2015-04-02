//
//  Thread.swift
//  Health Social
//
//  Created by Ori's Air on 3/30/15.
//  Copyright (c) 2015 OriGen Health. All rights reserved.
//

import UIKit

class Thread: NSObject {
    var posts: [Post]
    var author: Person?
    var content: String?
    var title: String?
    
    init(posts: [Post] = [], author: Person? = nil, content: String? = nil, title: String? = nil) {
        self.posts = posts
        self.author = author
        self.content = content
        self.title = title
        
    }
}
