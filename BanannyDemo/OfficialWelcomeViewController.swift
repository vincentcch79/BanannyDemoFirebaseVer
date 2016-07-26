//
//  OfficialWelcomeViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/19.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class OfficialWelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeContentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Bananny 歡迎你！"
        self.view.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        //contentView shadow
        
        welcomeContentView.layer.shadowColor = UIColor(white: 0, alpha: 0.22).CGColor
        welcomeContentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        welcomeContentView.layer.shadowOpacity = 0.5

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
