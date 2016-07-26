//
//  ParentFirstViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/14.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit


class ParentFirstViewController: UIViewController {
    
    @IBOutlet weak var parentNormalLoginButton: UIButton!
    @IBOutlet weak var parentFBLoginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Transparent NavigationBar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        // button ui setting
        self.parentNormalLoginButton.backgroundColor = UIColor(red: 255/255, green: 246/255, blue: 219/255, alpha: 1)
        self.parentNormalLoginButton.tintColor = UIColor(red: 143/255, green: 143/255, blue: 143/255, alpha: 1)
        self.parentNormalLoginButton.layer.shadowOpacity = 0.5
        self.parentNormalLoginButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.parentNormalLoginButton.layer.shadowRadius = 4.0
        self.parentFBLoginButton.backgroundColor = UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1)
        
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
    @IBAction func parentNormalLoginButton(sender: AnyObject) {
    }
    @IBAction func parentFBLoginButton(sender: AnyObject) {
        
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logInWithReadPermissions(["email"], fromViewController: self) { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result
                if(fbloginresult.grantedPermissions.contains("email"))
                {
                    self.getFBUserData()
                }
            }
        }
    }
    
    func getFBUserData(){
        if((FBSDKAccessToken.currentAccessToken()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).startWithCompletionHandler({ (connection, result, error) -> Void in
                if (error == nil){
                    //everything works print the user data
                    print(result)
                }
            })
        }
    }
    
}
