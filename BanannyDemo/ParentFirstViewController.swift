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
import GoogleSignIn
import Firebase

class ParentFirstViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    @IBOutlet weak var parentNormalLoginButton: UIButton!
    @IBOutlet weak var parentFBLoginButton: UIButton!
    @IBOutlet weak var parentSignUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Transparent NavigationBar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        
        // button ui setting
        self.parentNormalLoginButton.backgroundColor = UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1)
        
        self.parentNormalLoginButton.layer.shadowOpacity = 0.5
        self.parentNormalLoginButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.parentNormalLoginButton.layer.shadowRadius = 4.0
        self.parentFBLoginButton.backgroundColor = UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1)
        
        self.parentSignUpButton.tintColor = UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1)
        self.parentSignUpButton.layer.borderWidth = 1
        self.parentSignUpButton.layer.borderColor = UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1).CGColor

        
        // Do any additional setup after loading the view.
        //GIDSignIn
        GIDSignIn.sharedInstance().clientID = "134113229853-1rhvp7nmcih0puqa8urgqa3h9g6fh4hg.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self

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
                    let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
                    FIRAuth.auth()?.signInWithCredential(credential, completion: nil)
                }
            } else if (result.isCancelled) {
                print(error.localizedDescription)
                
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

    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
        if error != nil {
            print(error!.localizedDescription)
            return
        }
        print(user.authentication)
        Helper.helper.loginWithGoogle(user.authentication)
    }
    
}
