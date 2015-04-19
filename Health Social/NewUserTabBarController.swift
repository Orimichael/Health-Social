//
//  NewUserTabBarController.swift
//  Health Social
//
//  Created by Ori's Air on 3/10/15.
//  Copyright (c) 2015 OriGen Health. All rights reserved.
//

import UIKit


class NewUserTabBarController: UIViewController, UIImagePickerControllerDelegate {
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        requiredFields.hidden = true
        clearAllTextfields()
    }
    
    @IBOutlet weak var userPhoto: UIImageView!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var requiredFields: UILabel!
    
    @IBOutlet weak var firstNameText: UITextField!
    
    @IBOutlet weak var lastNameText: UITextField!
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var phoneText: UITextField!
    
    @IBOutlet weak var birthdateText: UITextField!
    
    @IBOutlet weak var heightText: UITextField!
    
    @IBOutlet weak var weightText: UITextField!
    
    @IBAction func loadPhoto(sender: UIButton) {
        let imagePicker = UIImagePickerController()
        
//        imagePicker.delegate = self
//        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
//        imagePicker.mediaTypes = [kUTTypeImage as NSString]
//        imagePicker.allowsEditing = false
//        
//        self.presentViewController(imagePicker, animated: true,
//            completion: nil)
    }
    
    
    
    @IBAction func genderSwitch(sender: UISwitch) {
        if sender.on {
            genderLabel.text = "Male"
            Person.currentUser()!.gender = "Male"
        } else {
            genderLabel.text = "Female"
            Person.currentUser()!.gender = "Female"
        }
    }
    
    @IBAction func saveButtonTapped(sender: UIButton) {
        var current = Person.currentUser()
        
        if requiredFieldsFilled() {
        
        current!.firstName = firstNameText.text
        current!.lastName = lastNameText.text
        if isValidEmail(emailText.text) {
            current!.email = emailText.text
        } else {
            clearTextField(emailText)
            displayAlertMessage("Please enter a valid email")
        }
        
        if phoneText.text != "" {
            println(phoneText.text)
            if isValidPhone(phoneText.text) {
                current!.phone = phoneText.text
            } else {
                clearTextField(phoneText)
                displayAlertMessage("Please enter phone number in correct format: XXX-XXX-XXXX")
            }
        }
        
        if birthdateText.text != "" {
            println("birthday is not nil")
            println(birthdateText.text)
            if isCorrectBirthdayFormat(birthdateText.text).0 {
            current!.birthdate = isCorrectBirthdayFormat(birthdateText.text).1
            } else {
            clearTextField(birthdateText)
            displayAlertMessage("Please enter birthdate in correct format: YYYY-MM-DD")
            }
        }
        
        if heightText.text != "" {
            println("height is not nil")
            println(heightText.text)
            if isValidHeight(heightText.text) {
                var heightAsInt = heightText.text.toInt()!
                current!.height = heightAsInt
            } else {
                clearTextField(heightText)
                displayAlertMessage("Please enter height as a whole number greater than zero")
            }
        }
            
        if weightText.text != "" {
            println("weight is not nil")
            if isValidWeight(weightText.text) {
                var weightAsInt = weightText.text.toInt()!
                current!.weight = weightAsInt
            } else {
                clearTextField(weightText)
                displayAlertMessage("Please enter weight as a whole number greater than zero")
            }
        }
        

        
        current!.save()
        performSegueWithIdentifier("newUserToMain", sender: self)
        }
    }
    
    func isValidPhone(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        var phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        var result =  phoneTest.evaluateWithObject(value)
        
        return result
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let range = testStr.rangeOfString(emailRegEx, options:.RegularExpressionSearch)
        let result = range != nil ? true : false
        return result
    }
    
    func isCorrectBirthdayFormat(birthday:String) -> (Bool, NSDate?) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        if let birthdate = dateFormatter.dateFromString(birthday) {
            return (true, birthdate)
        } else {
            return (false, nil)
        }
    }
    
    func isValidWeight(weight: String) -> Bool {
        let PHONE_REGEX = "[0-9]+"
        var weightTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        var result =  weightTest.evaluateWithObject(weight)
        
        return result
    }
    
    func isValidHeight(height: String) -> Bool {
        let PHONE_REGEX = "[0-9]+"
        var heightTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        var result =  heightTest.evaluateWithObject(height)
        
        return result
    }
    
    func clearTextField (textField: UITextField!) {
        textField.text = nil
    }
    
    func clearAllTextfields() {
        firstNameText.text = nil
        println(firstNameText.text)
        lastNameText.text = nil
        emailText.text = nil
        phoneText.text = nil
        birthdateText.text = nil
        heightText.text = nil
        weightText.text = nil
    }
    
    func requiredFieldsFilled() -> Bool {
        if firstNameText.text != "" && lastNameText.text != "" && emailText.text != "" {
            println("none of required fields are nil")
            return true
        } else {
            displayAlertMessage("Required fields are missing")
            requiredFields.hidden = false
            clearAllTextfields()
            return false
        }
    }
    
    func displayAlertMessage(userMessage: String) {
        var myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "OK", style:UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
}
