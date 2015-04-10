//
//  ParseLogInViewController.swift
//  Health Social
//
//  Created by Ori's Air on 3/13/15.
//  Copyright (c) 2015 OriGen Health. All rights reserved.
//

import UIKit

class ParseLogInViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
            

    }
    

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if(PFUser.currentUser() == nil){
            // If there is no user currently logged in, instantiate Parse Log In Controller
            println("No current user")
            var logInViewController = PFLogInViewController()
            logInViewController.delegate = self
            
            //customize logInViewController
            logInViewController.fields = PFLogInFields.UsernameAndPassword | PFLogInFields.LogInButton | PFLogInFields.PasswordForgotten | PFLogInFields.Facebook | PFLogInFields.SignUpButton | PFLogInFields.DismissButton
            logInViewController.facebookPermissions = NSArray(objects:"friends_about_me") as [AnyObject]
            logInViewController.logInView!.logo  = UIImageView(image: UIImage(named: "Logo"))

            
            //create a signUpViewController instance
            var signUpViewController = PFSignUpViewController()
            signUpViewController.delegate = self
            //add signUpViewController instance to logInViewController for signUp module.
            logInViewController.signUpController = signUpViewController
            self.presentViewController(logInViewController, animated: true, completion: nil)
        } else {
            // If a user is already logged in, register log in status and update the number of logins
            println("Current user already logged in")
            var current = Person.currentUser()
            current!.isLoggedIn = true
            // Counts the number of times a user has logged in
            current!.incrementKey("numberOfLogins")
            current!.save()
            
            if (current!.firstName != nil && current!.lastName != nil && current!.email != nil) {
                // If the current user has already saved the requisite information, go to main page
                println("Required information has been saved")
                self.performSegueWithIdentifier("goToMain", sender: self)
                
            } else {
                // If the user is missing vital information, go to the new user tab where the required information can be input
                println("current user is new")
                self.performSegueWithIdentifier("goToNewUserTab", sender: self)
            }
        }
       //     self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
//          If I was MANUALLY creating a loginView I would need following to check for errors:
//        Person.logInWithUsernameInBackground(username: String!, password: String!) { (user, error) -> Void in
//             if error != nil {
//                don't log in}
//            else {
//            go to New User Details view
//        }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // TODO: - Delegate Methods 
    Add my delegate methods here
    */
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {

    self.dismissViewControllerAnimated(true, completion: { () -> Void in
     // Enter the Perform Segue code here
        // Segue to New User information if firstname, email, etc. has not been recorded/is nil (or make it a boolean flag, etc.
    })
    }
    
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
