//
//  Person.swift
//  Health Social
//
//  Created by Ori's Air on 3/9/15.
//  Copyright (c) 2015 OriGen Health. All rights reserved.
//


import UIKit
import Foundation

class Person: PFUser, PFSubclassing {
    
    override class func load() {
        self.registerSubclass()
    }
    
    // @NSManaged allows Parse to manage these variables
    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var phone: String?
    @NSManaged var photo: UIImage?
    @NSManaged var fitnessGoals: NSArray? //Will consider using Parse Relationship object... relation is a pointer
    @NSManaged var myFitnessCenter: SportsCenter?
    @NSManaged var height: NSNumber? // inches or cm //NSNumber for Int or Bool
    @NSManaged var weight: NSNumber? // pounds or kg
    @NSManaged var age: NSNumber? // years
    @NSManaged var birthdate: NSDate?
    var personalSettings: NSUserDefaults?
    @NSManaged var numberOfLogins: NSNumber?
    // var classes: Lessons
     var friends: [Person] = []
     var relatives: [Person] = []
    // var favoriteExercises: Exercise
    @NSManaged var diet: String?
    @NSManaged var healthPoints: NSNumber?
    @NSManaged var isLoggedIn: NSNumber?
    @NSManaged var isTrialMember: NSNumber?
    @NSManaged var myThreads: PFRelation
    var myPosts: [Post] = []
    @NSManaged var checkInCount: NSNumber? // each time a user checks into sportscenter
    
    // Some properties are inherited by PFUSer:
    // var password: String, var username: String, var objectID: String, var email: String, var authdata: authdata, var emailVerified: Bool, var createdAt: Date, var updatedAt: Date, var ACL: ACL (this is access control list) can be public/private read, write
    
//    Looks like the initializer is NOT required for PFUser subclassing????
    
//    init(firstName: String? = nil,
//        lastName: String? = nil,
//        userName: String? = nil,
//        password: String? = nil,
//        photo: UIImage? = nil,
//        fitnessGoals: NSArray? = nil,
//        numberOfLogins: Int? = nil,
//        // var fitnessCenter: SportsCenter
//        height: Int? = nil,  // inches or cm
//        weight: Int? = nil, // pounds or kg
//        age: Int? = nil,  // years
//        birthdate: NSDate? = nil,
//        isTrialMember: Bool? = nil,
//        personalSettings: NSUserDefaults? = nil,
//        // var classes: Lessons
//        // var friends: [Person()]
//        // var relatives: [Person()]
//        // var favoriteExercises: Exercise
//        diet: String? = nil,
//        healthPoints: Int? = nil, isLoggedIn: Bool? = false) {
//            super.init()
//            self.firstName = firstName
//            self.lastName = lastName
//            self.userName = userName
//            self.password = password
//            self.photo = photo
//            self.isTrialMember = isTrialMember
//            self.fitnessGoals = fitnessGoals
//            self.height = height
//            self.weight = weight
//            self.age = age
//            self.birthdate = birthdate
//            self.personalSettings = personalSettings
//            self.diet = diet
//            self.healthPoints = healthPoints
//            self.isLoggedIn = isLoggedIn
//            self.numberOfLogins = numberOfLogins
//    }
//    Apparently for PFUser only, this class function should NOT be included:
//    override class func parseClassName () -> String {
//        return "User"
//    }
    
    
    override class func currentUser() -> Person! {
        return PFUser.currentUser() as Person!
    }
    
}