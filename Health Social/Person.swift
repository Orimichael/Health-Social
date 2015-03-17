//
//  Person.swift
//  Health Social
//
//  Created by Ori's Air on 3/9/15.
//  Copyright (c) 2015 OriGen Health. All rights reserved.
//


import UIKit

class Person: PFUser {
    // @NSManaged allows Parse to managed thes variables
    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var userName: String?
    @NSManaged var userID: String?
    @NSManaged var photo: UIImage?
    @NSManaged var fitnessGoals: NSArray? //Will consider using Parse Relationship object... relation is a pointer
    // var fitnessCenter: SportsCenter
    @NSManaged var height: NSNumber? // inches or cm //NSNumber for Int or Bool
    @NSManaged var weight: NSNumber? // pounds or kg
    @NSManaged var age: NSNumber? // years
    @NSManaged var birthdate: NSDate?
    var personalSettings: NSUserDefaults?
    @NSManaged var numberOfLogins: NSNumber?
    // var classes: Lessons
    // var friends: [Person()]
    // var relatives: [Person()]
    // var favoriteExercises: Exercise
    @NSManaged var diet: String?
    @NSManaged var healthPoints: NSNumber?
    @NSManaged var isLoggedIn: NSNumber?
    @NSManaged var isTrialMember: NSNumber?
    
    init(firstName: String? = nil,
        lastName: String? = nil,
        userName: String? = nil,
        userID: String? = nil,
        password: String? = nil,
        photo: UIImage? = nil,
        fitnessGoals: NSArray? = nil,
        numberOfLogins: Int? = nil,
        // var fitnessCenter: SportsCenter
        height: Int? = nil,  // inches or cm
        weight: Int? = nil, // pounds or kg
        age: Int? = nil,  // years
        birthdate: NSDate? = nil,
        isTrialMember: Bool? = nil,
        personalSettings: NSUserDefaults? = nil,
        // var classes: Lessons
        // var friends: [Person()]
        // var relatives: [Person()]
        // var favoriteExercises: Exercise
        diet: String? = nil,
        healthPoints: Int? = nil, isLoggedIn: Bool? = false) {
            super.init()
            self.firstName = firstName
            self.lastName = lastName
            self.userName = userName
            self.userID = userID
            self.password = password
            self.photo = photo
            self.isTrialMember = isTrialMember
            self.fitnessGoals = fitnessGoals
            self.height = height
            self.weight = weight
            self.age = age
            self.birthdate = birthdate
            self.personalSettings = personalSettings
            self.diet = diet
            self.healthPoints = healthPoints
            self.isLoggedIn = isLoggedIn
            self.numberOfLogins = numberOfLogins
    }
    
    override class func parseClassName () -> String {
        return "User"
    }
    
    override class func currentUser() -> Person {
        return PFUser.currentUser() as Person
    }
    
}