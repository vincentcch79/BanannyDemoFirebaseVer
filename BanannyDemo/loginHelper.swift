//
//  loginHelper.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/26.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import Foundation
import FirebaseAuth
import UIKit
import GoogleSignIn

class Helper {
    static let helper = Helper()
    
    func loginAnonymously() {
        print("login anonymously did tapped")
    
    
        FIRAuth.auth()?.signInAnonymouslyWithCompletion({ (anonymousUser: FIRUser?, error: NSError?) in
            if error == nil {
                print("UserId: \(anonymousUser!.uid)")
    
                self.switchToNavigationViewController()
                
            } else {
                print(error!.localizedDescription)
                return
            }
        })
    
    
    }
    
    
    func loginWithGoogle(authentication: GIDAuthentication) {
        
        let credential = FIRGoogleAuthProvider.credentialWithIDToken(authentication.idToken, accessToken: authentication.accessToken)
        
        FIRAuth.auth()?.signInWithCredential(credential, completion: { (user: FIRUser?, error: NSError?) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                print(user?.email)
                print(user?.displayName)
                
                self.switchToNavigationViewController()
            }
        })
        
    }
    
    
    private func switchToNavigationViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let naviVC = storyboard.instantiateViewControllerWithIdentifier("DashTabBarViewController") as! DashTabBarViewController
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.window?.rootViewController = naviVC
    }
    
}
