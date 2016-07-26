//
//  ConfirmMsgView.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/19.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class ConfirmMsgView: UIView {
    @IBOutlet weak var backgroundMsgView: UIView!
    @IBOutlet weak var backgroundMsgTitle: UILabel!
    @IBOutlet weak var confirmMsgButton: UIButton!
    
    
    @IBAction func secondConfirm(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.center = CGPoint(x: UIScreen.mainScreen().bounds.midX, y: UIScreen.mainScreen().bounds.maxY)
            self.layer.opacity = 0
        }) { (_) -> Void in
            if self.secondConfirmHandler == nil {
                return
            }
            self.secondConfirmHandler!()
        }

    }
    private var secondConfirmHandler: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundMsgView.backgroundColor = UIColor(red: 255/255, green: 238/255, blue: 184/255, alpha: 1)
        backgroundMsgTitle.textColor = UIColor(red: 139/255, green: 133/255, blue: 101/255, alpha: 1)
        confirmMsgButton.backgroundColor = UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1)
        confirmMsgButton.tintColor = UIColor(red: 254/255, green: 249/255, blue: 249/255, alpha: 1)
    }
    
    func setActionHandler(actionType: String, handler: () -> Void) {
        
        if actionType == "secondConfirm" {
            secondConfirmHandler = handler
        }
    }
    

}
