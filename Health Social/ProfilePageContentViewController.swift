//
//  ProfilePageContentViewController.swift
//  Health Social
//
//  Created by Ori's Air on 4/17/15.
//  Copyright (c) 2015 OriGen Health. All rights reserved.
//

import UIKit

class ProfilePageContentViewController: UIViewController {

    @IBOutlet weak var myProfileLabel: UILabel!
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    var pageIndex: Int? = nil
    var titleText: String? = nil
    var imageFile: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.backgroundImageView.image = UIImage(named: self.imageFile!)
        self.myProfileLabel.text = self.titleText!
        self.myProfileLabel.alpha = 0.1
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.myProfileLabel.alpha = 1.0
        })
        
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
