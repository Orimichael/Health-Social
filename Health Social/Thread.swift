//
//  Thread.swift
//  Health Social
//
//  Created by Ori's Air on 3/30/15.
//  Copyright (c) 2015 OriGen Health. All rights reserved.
//

import UIKit

class Thread: NSObject {
    var post: Post?
    var author: Person?
    var content: String?
    var title: String?
    
    init(post: Post? = nil, author: Person? = nil, content: String? = nil, title: String? = nil) {
        self.post = post
        self.author = author
        self.content = content
        self.title = title
        
    }
}
