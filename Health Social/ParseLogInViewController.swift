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
        if(PFUser.currentUser() == nil){
            var logInViewController = PFLogInViewController()
            logInViewController.delegate = self
            
            //customize logInViewController
            logInViewController.fields = PFLogInFields.UsernameAndPassword | PFLogInFields.LogInButton | PFLogInFields.PasswordForgotten | PFLogInFields.Facebook | PFLogInFields.SignUpButton
            logInViewController.facebookPermissions = NSArray(objects:"friends_about_me")
            logInViewController.logInView.logo  = UIImageView(image: UIImage(named: "Logo"))
            
            //create a signUpViewController instance
            var signUpViewController = PFSignUpViewController()
            signUpViewController.delegate = self
            
            //add signUpViewController instance to logInViewController for signUp module.
            logInViewController.signUpController = signUpViewController
            self.presentViewController(logInViewController, animated: true, completion: nil)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
