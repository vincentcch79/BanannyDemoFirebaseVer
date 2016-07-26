//
//  ParentSecondViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/14.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class ParentSecondViewController: UIViewController {
    @IBOutlet weak var parentEmailTextField: UITextField!
    @IBOutlet weak var parentPWTextField: UITextField!
    @IBOutlet weak var parentLoginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // trasparent navigation bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        
        //configure textfield border
        parentEmailTextField.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.68)
        parentEmailTextField.layer.masksToBounds = true
        parentEmailTextField.layer.borderColor = UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1).CGColor
        parentEmailTextField.layer.borderWidth = 1.0
        parentEmailTextField.attributedPlaceholder = NSMutableAttributedString(string:"Email", attributes:[NSForegroundColorAttributeName: UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1),NSFontAttributeName :UIFont(name: "PingFang TC", size: 18)!])
        

        parentPWTextField.layer.masksToBounds = true
        parentPWTextField.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.68)
        parentPWTextField.layer.borderColor = UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1).CGColor
        parentPWTextField.layer.borderWidth = 1.0
        parentPWTextField.attributedPlaceholder = NSMutableAttributedString(string:"密碼", attributes:[NSForegroundColorAttributeName: UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1),NSFontAttributeName :UIFont(name: "PingFang TC", size: 18)!])
        
        //login button ui setting
        parentLoginButton.backgroundColor = UIColor(red: 255/255, green: 246/255, blue: 219/255, alpha: 1)
        parentLoginButton.tintColor = UIColor(red: 143/255, green: 143/255, blue: 143/255, alpha: 1)
        parentLoginButton.layer.shadowOpacity = 0.5
        parentLoginButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        parentLoginButton.layer.shadowRadius = 4.0
        
        // Do any additional setup after loading the view.
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
    @IBAction func parentLoginButton(sender: AnyObject) {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let DashTabBarViewController: UIViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("DashTabBar")
        self.presentViewController(DashTabBarViewController, animated: true, completion: nil)
    }

}
