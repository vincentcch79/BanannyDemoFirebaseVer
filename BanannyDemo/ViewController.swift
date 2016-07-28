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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
            //button ui setting
            self.parentButton.backgroundColor = UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1)
            self.babysitterButton.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 233/255, alpha: 1)
            self.babysitterButton.tintColor = UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1)

        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func parentLoginButton(sender: AnyObject) {


        let parentLoginViewcontroller = self.storyboard?.instantiateViewControllerWithIdentifier("ParentFirstViewController") as! ParentFirstViewController
            self.presentViewController(parentLoginViewcontroller, animated: false, completion: nil)
        
    }


}

