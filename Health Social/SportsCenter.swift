//
//  SportsCenter.swift
//  Health Social
//
//  Created by Ori's Air on 3/30/15.
//  Copyright (c) 2015 OriGen Health. All rights reserved.
//

import UIKit

class SportsCenter: NSObject {
    var location: String? // Needs to be turned into a geolocation with MapKit, instead of a String
    var members: Array<Person>? // Needs to be filled with members
    
    init(location: String? = nil, members: Array<Person>? = nil) {
        self.location = location
        self.members = members
        
    }
}
