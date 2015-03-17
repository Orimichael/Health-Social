//
//  SignUpViewController.swift
//  Health Social
//
//  Created by Ori's Air on 3/9/15.
//  Copyright (c) 2015 OriGen Health. All rights reserved.
//

import UIKit


class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    var identity = 0
    
    var userList = [Person?]()
    @IBOutlet weak var userNameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    @IBOutlet weak var confirmPasswordText: UITextField!
    
    
    @IBAction func signUpButton(sender: UIButton) {
        let username = userNameText.text
        let password = passwordText.text
        let confirmPassword = confirmPasswordText.text
        
        // Check for empty fields
        if (username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
            //Display alert message
            displayAlertMessage("All fields are required")
            return
        }
        
        // Alternatively, might check for error, if error != nil, print NSError.desscription
        
        // Check if passwords match
        if (password != confirmPassword){
            // Display an alert message
            displayAlertMessage("Passwords do not match")
            return
        }
        
        // Store data
        NSUserDefaults.standardUserDefaults().setObject(username, forKey:"username")
        NSUserDefaults.standardUserDefaults().setObject(password, forKey:"password")
        
    NSUserDefaults.standardUserDefaults().setBool(true,forKey:"isUserLoggedIn")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        // Display alert message with confirmation
        var myAlert = UIAlertController(title:"Alert", message: "Registration successful!", preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "OK", style:UIAlertActionStyle.Default) { action in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        var newUser = Person()
        newUser.userName = username
        newUser.password = password
        var uuid = NSUUID().UUIDString
        println(uuid)
        newUser.userID = uuid
        userList.append(newUser)
        println(userList.count)
        
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
        

        
    }
    
    func displayAlertMessage(userMessage: String) {
        var myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style:UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    @IBAction func logInButton(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
