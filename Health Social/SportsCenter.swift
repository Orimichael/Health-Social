//
//  SportsCenter.swift
//  Health Social
//
//  Created by Ori's Air on 3/30/15.
//  Copyright (c) 2015 OriGen Health. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SportsCenter: PFObject, PFSubclassing {
    
    override class func initialize() {
        var location: CLLocation?
        var members: Array<Person>? // Needs to be filled with members
        var streetAddress: String?
        var city: String?
        var state: String?
        
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    class func parseClassName() -> String! {
        return "SportsCenter"
    }
}
