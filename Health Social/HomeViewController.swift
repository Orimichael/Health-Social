//
//  HomeViewController.swift
//  Health Social
//
//  Created by Ori's Air on 3/9/15.
//  Copyright (c) 2015 OriGen Health. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var parseButton: UIButton!
    
    @IBOutlet weak var logOutButton: UIButton!
    
    @IBAction func editMyProfile(sender: UIButton) {
        performSegueWithIdentifier("goToEditProfile", sender: self)
    }
    @IBAction func parseTapped(sender: UIButton) {
        var currentUser = Person.currentUser()
        if currentUser != nil {
            println(currentUser!)
            parseButton.userInteractionEnabled = false
            userNameLabel.text = currentUser!.username
            logOutButton.userInteractionEnabled = true
        } else {
            println("current user is nil")
        performSegueWithIdentifier("goToParse", sender: self)
        }
    }

    @IBAction func logOutTapped(sender: UIButton) {
        var currentUser = Person.currentUser()
        logOutButton.userInteractionEnabled = false
        parseButton.userInteractionEnabled = true
        userNameLabel.text = ""
        if currentUser != nil {
        var loggedStatus = currentUser!.isLoggedIn
        println(loggedStatus!)
        currentUser!.isLoggedIn = false
        currentUser!.save()
        PFUser.logOut()
        currentUser = Person.currentUser()
        println(currentUser)
        }
       // self.performSegueWithIdentifier("goToLogIn", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //instantiate a gray Activity Indicator View
        var activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        //add the activity to the ViewController's view
        view.addSubview(activityIndicatorView)
        //position the Activity Indicator View in the center of the view
        activityIndicatorView.center = view.center
        //tell the Activity Indicator View to begin animating
        activityIndicatorView.startAnimating()
        
        Parse.setApplicationId("ShPIp8XrYII5GG5hsqQBKDpIXdTqyyy1YFz3nx98", clientKey:"TOVT0AifDifBx9u0nCKDefIYmRa6GVdP3MvEWOyT")
        
        var object = PFObject(className: "testDataClass")
        object.addObject("iOSBlog", forKey: "websiteUrl")
        object.addObject("Five", forKey: "websiteRating")
        object.save()
        
      //  view.backgroundColor = UIColor.brownColor()
        let isUserLoggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn")
        if isUserLoggedIn {
            logOutButton.userInteractionEnabled = true
            parseButton.userInteractionEnabled = false
            userNameLabel.text = Person.currentUser()!.username
        } else {
            userNameLabel.text = ""
        }
        
        activityIndicatorView.removeFromSuperview()
    }
    
    
}
