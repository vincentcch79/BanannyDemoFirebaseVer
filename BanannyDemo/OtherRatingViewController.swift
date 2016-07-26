//
//  OtherRatingViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/20.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class OtherRatingViewController: UIViewController {
    
    @IBOutlet weak var otherRatingContentView: UIView!

    @IBOutlet weak var otherRatingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "張保母評價了你"
        
        //shadow
        otherRatingContentView.layer.shadowColor = UIColor(white: 0, alpha: 0.22).CGColor
        otherRatingContentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        otherRatingContentView.layer.shadowOpacity = 0.5
        otherRatingView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)

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
