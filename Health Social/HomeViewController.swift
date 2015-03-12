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
    
    
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var logOutButton: UIButton!
    
    @IBAction func logInTapped(sender: UIButton) {
        
        
    }
    @IBAction func logOutTapped(sender: UIButton) {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn")
        NSUserDefaults.standardUserDefaults().synchronize()
        logInButton.userInteractionEnabled = true
        logOutButton.userInteractionEnabled = false
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

      //  view.backgroundColor = UIColor.brownColor()
        let isUserLoggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn")
        if isUserLoggedIn {
            logInButton.userInteractionEnabled = false
            logOutButton.userInteractionEnabled = true
        //    userNameLabel.text = currentUser
        }
        
        activityIndicatorView.removeFromSuperview()
    }
    
    
}
