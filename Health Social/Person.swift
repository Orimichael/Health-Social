//
//  Person.swift
//  Health Social
//
//  Created by Ori's Air on 3/9/15.
//  Copyright (c) 2015 OriGen Health. All rights reserved.
//


import UIKit

class Person: NSObject {
    
    var firstName: String?
    var lastName: String?
    var userName: String?
    var userID: String?
    var password: String?
    var photo: UIImage?
    var fitnessGoals: NSArray?
    // var fitnessCenter: SportsCenter
    var height: Int? // inches or cm
    var weight: Int? // pounds or kg
    var age: Int? // years
    var birthdate: NSDate?
    var personalSettings: NSUserDefaults?
    var numberOfLogins: Int?
    // var classes: Lessons
    // var friends: [Person()]
    // var relatives: [Person()]
    // var favoriteExercises: Exercise
    var diet: String?
    var healthPoints: Int?
    var isLoggedIn: Bool?
    var isTrialMember: Bool?
    
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
    
}