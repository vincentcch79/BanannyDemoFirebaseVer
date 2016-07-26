//
//  NotifTableViewCell.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/19.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class NotifTableViewCell: UITableViewCell {

    @IBOutlet weak var notifCellTitleLabel: UILabel!
    @IBOutlet weak var notifCellDateLabel: UILabel!
    @IBOutlet weak var notifCellContentLabel: UILabel!
    @IBOutlet weak var newNotifButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
