//
//  ViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/14.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit


class ViewController: UIViewController {

    @IBOutlet weak var parentButton: UIButton!
    @IBOutlet weak var babysitterButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
            //button ui setting
            self.parentButton.backgroundColor = UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1)
            self.babysitterButton.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 233/255, alpha: 1)
            self.babysitterButton.tintColor = UIColor(red: 91/255, green: 91/255, blue: 92/255, alpha: 1)
            self.signupButton.tintColor = UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1)
            self.signupButton.layer.borderWidth = 1
            self.signupButton.layer.borderColor = UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1).CGColor

        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func parentLoginButton(sender: AnyObject) {
        if FBSDKAccessToken.currentAccessToken() != nil {
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let DashTabBarViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("DashTabBarViewController")
            self.presentViewController(DashTabBarViewController, animated: true, completion: nil)
        } else {
            let viewcontroller = self.storyboard?.instantiateViewControllerWithIdentifier("ParentFirstViewController") as! ParentFirstViewController
            self.presentViewController(viewcontroller, animated: false, completion: nil)
        }
    }


}



