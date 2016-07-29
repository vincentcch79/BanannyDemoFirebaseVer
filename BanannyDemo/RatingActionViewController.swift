//
//  RatingActionViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/20.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class RatingActionViewController: UIViewController {

    @IBOutlet weak var sendRatingButton: UIButton!
    @IBOutlet weak var ratingActionBackground: UIView!
    @IBOutlet weak var ratingScrollBackground: UIScrollView!
    @IBOutlet weak var ratingActionContentView: UIView!
    
    @IBOutlet weak var ratingBlurView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "請完成評價"
        ratingActionBackground.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        ratingScrollBackground.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        sendRatingButton.backgroundColor = UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1)
        
        
        
        //shadow
        ratingActionContentView.layer.shadowColor = UIColor(white: 0, alpha: 0.22).CGColor
        ratingActionContentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        ratingActionContentView.layer.shadowOpacity = 0.5
        
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
    @IBAction func sendRatingActionButton(sender: AnyObject) {
        self.ratingBlurView.hidden = false
        let AlertView = NSBundle.mainBundle().loadNibNamed("ConfirmRatingView", owner: nil, options: nil).first as! ConfirmRatingView
        AlertView.frame.size = CGSize(width: 300, height: 380)
        AlertView.center = CGPoint(x: UIScreen.mainScreen().bounds.midX, y: UIScreen.mainScreen().bounds.height * 0.4)
        
        self.view.addSubview(AlertView)
        
        AlertView.setActionHandler("confirmRatingAction") { () -> Void in
            self.ratingBlurView.hidden = true
            AlertView.removeFromSuperview()
            
            self.navigationController?.popToRootViewControllerAnimated(true)
        
     }
    }
}
