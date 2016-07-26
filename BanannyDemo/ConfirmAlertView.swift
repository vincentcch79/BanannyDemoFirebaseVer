//
//  ConfirmAlertView.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/19.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class ConfirmAlertView: UIView {

    @IBOutlet weak var confirmLabel: UILabel!
    @IBOutlet weak var confirmTitle: UILabel!
    @IBOutlet weak var confirmBackgroundView: UIView!
    @IBOutlet weak var cancelOutlet: UIButton!
    @IBOutlet weak var confirmOutlet: UIButton!
    
    
    
    
    @IBAction func confirmButton(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.center = CGPoint(x: UIScreen.mainScreen().bounds.midX, y: UIScreen.mainScreen().bounds.maxY)
            self.layer.opacity = 0
        }) { (_) -> Void in
            if self.confirmHandler == nil {
                return
            }
            self.confirmHandler!()
        }
    }
    
    @IBAction func cancelButton(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.center = CGPoint(x: UIScreen.mainScreen().bounds.midX, y: UIScreen.mainScreen().bounds.maxY)
            self.layer.opacity = 0
        }) { (_) -> Void in
            if self.cancelHandler == nil {
                return
            }
            self.cancelHandler!()
        }
    }
    
    private var cancelHandler: (() -> Void)?
    private var confirmHandler: (() -> Void)?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.center = CGPoint(x: UIScreen.mainScreen().bounds.midX, y: UIScreen.mainScreen().bounds.midY)
        confirmTitle.textColor = UIColor(red: 139/255, green: 133/255, blue: 101/255, alpha: 1)
        confirmBackgroundView.backgroundColor = UIColor(red: 255/255, green: 238/255, blue: 184/255, alpha: 1)
        cancelOutlet.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        cancelOutlet.tintColor = UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1)
        confirmOutlet.tintColor = UIColor(red: 254/255, green: 249/255, blue: 249/255, alpha: 1)
        confirmOutlet.backgroundColor = UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 1)
    }
    
    func setActionHandler(actionType: String, handler: () -> Void) {
        
        if actionType == "cancel" {
            cancelHandler = handler
        }else if actionType == "OK" {
            confirmHandler = handler
        }
    }

    
    
}
