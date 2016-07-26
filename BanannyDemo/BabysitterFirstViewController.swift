//
//  BabysitterFirstViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/14.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class BabysitterFirstViewController: UIViewController {

    @IBOutlet weak var babysitterLogin: UIButton!
    @IBOutlet weak var babysitterFBLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // trasparent navigation bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        // button ui setting
        self.babysitterLogin.backgroundColor = UIColor(red: 255/255, green: 246/255, blue: 219/255, alpha: 1)
        self.babysitterLogin.tintColor = UIColor(red: 143/255, green: 143/255, blue: 143/255, alpha: 1)
        self.babysitterLogin.layer.shadowOpacity = 0.5
        self.babysitterLogin.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.babysitterLogin.layer.shadowRadius = 4.0
        self.babysitterFBLogin.backgroundColor = UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1)
        
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

}
