//
//  AppDelegate.swift
//  Health Social
//
//  Created by Ori's Air on 3/5/15.
//  Copyright (c) 2015 OriGen Health. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var mpcManager: MPCManager!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        
        Parse.setApplicationId("ShPIp8XrYII5GG5hsqQBKDpIXdTqyyy1YFz3nx98", clientKey:"TOVT0AifDifBx9u0nCKDefIYmRa6GVdP3MvEWOyT")
        
        var object2 = PFObject(className: "TestClass")
        object2.addObject("Banana", forKey: "favoriteFood")
        object2.addObject("Chocolate", forKey: "favoriteIceCream")
        object2.saveInBackground()
        
        // setACL()
        
        //  PFFacebookUtils.initializeFacebook()
        
        // Override point for customization after application launch.
        
        
        mpcManager = MPCManager()
        
        return true
    }
    
    func setACL() {
        // Setting the Access Control List. Default for current user, will create PFRoles and set ACL per role
        PFACL.setDefaultACL(PFACL(), withAccessForCurrentUser: true)
        
        var roleACL = PFACL()
        var admin = PFRole(name: "Administrator", acl: roleACL)
        var moderator = PFRole(name: "Moderator", acl: roleACL)
        var trainer = PFRole(name: "Trainer", acl: roleACL)
        admin.saveInBackground()
        moderator.saveInBackground()
        trainer.saveInBackground()
        
        roleACL.setWriteAccess(true, forRole: admin)
        roleACL.setWriteAccess(true, forRole: moderator)
        roleACL.setWriteAccess(false, forRole: trainer)
        
        admin.saveInBackground()
        moderator.saveInBackground()
        trainer.saveInBackground()
        
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

