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
    
    @NSManaged var name: String?
    @NSManaged var location: PFGeoPoint? //Need to check how Parse can handle locations..
    var members: [Person] = []   // Needs to be filled with members
    @NSManaged var streetAddress: String?
    @NSManaged var city: String?
    @NSManaged var state: String?
    @NSManaged var centerThreads: PFRelation
    
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    class func parseClassName() -> String {
        return "SportsCenter"
    }
}
