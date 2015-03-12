//
//  LoginViewController.swift
//  Health Social
//
//  Created by Ori's Air on 3/9/15.
//  Copyright (c) 2015 OriGen Health. All rights reserved.
//


import UIKit

class LoginViewController: UIViewController {
    

    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var userNameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logIn(sender: UIButton) {
        //Authentication Code
        
        let username = userNameText.text
        let password = passwordText.text
        
        let usernameStored = NSUserDefaults.standardUserDefaults().stringForKey("username")
        let passwordStored = NSUserDefaults.standardUserDefaults().stringForKey("password")
        
        if(usernameStored == username && passwordStored == password) {

                // Login is successful
            NSUserDefaults.standardUserDefaults().setBool(true,forKey:"isUserLoggedIn")
                NSUserDefaults.standardUserDefaults().synchronize()
                self.performSegueWithIdentifier("goToLoggedIn", sender: self)
              //  self.dismissViewControllerAnimated(true, completion: nil)
        } else {
            loginLabel.textColor = UIColor.redColor()
            loginLabel.text = "Incorrect login information. Try again."
            userNameText.text = ""
            passwordText.text = ""
        }
        
    }
}
