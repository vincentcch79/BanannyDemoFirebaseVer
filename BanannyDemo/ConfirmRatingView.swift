//
//  ConfirmRatingView.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/29.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class ConfirmRatingView: UIView {

    @IBAction func confirmRatingAction(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.center = CGPoint(x: UIScreen.mainScreen().bounds.midX, y: UIScreen.mainScreen().bounds.maxY)
            self.layer.opacity = 0
        }) { (_) -> Void in
            if self.ConfirmRatingHandler == nil {
                return
            }
            self.ConfirmRatingHandler!()
        }
        
    }
    private var ConfirmRatingHandler: (() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setActionHandler(actionType: String, handler: () -> Void) {
        
        if actionType == "confirmRatingAction" {
            ConfirmRatingHandler = handler
        }
    }


}
