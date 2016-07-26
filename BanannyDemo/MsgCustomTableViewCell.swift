//
//  MsgCustomTableViewCell.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/20.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class MsgCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var msgBackgroundView: UIView!
    @IBOutlet weak var msgImageView: UIImageView!
    @IBOutlet weak var msgTitleLabel: UILabel!
    @IBOutlet weak var msgDateLabel: UILabel!
    @IBOutlet weak var msgContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        msgBackgroundView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
