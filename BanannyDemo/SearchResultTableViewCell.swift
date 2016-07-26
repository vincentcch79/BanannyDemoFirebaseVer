//
//  SearchResultTableViewCell.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/14.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit
import Cosmos


class SearchResultTableViewCell: UITableViewCell {

    @IBOutlet weak var ResultCellImageView: UIImageView!
    @IBOutlet weak var ResultNameLabel: UILabel!
    @IBOutlet weak var ResultStarRating: CosmosView!
    @IBOutlet weak var ResultHourlyNum: UILabel!
    @IBOutlet weak var ResultFinishedNum: UILabel!
    @IBOutlet weak var ResultStartNum: UILabel!
    @IBOutlet weak var searchBackgroundView: UIView!
    @IBOutlet weak var lowerBackgroundView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lowerBackgroundView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        searchBackgroundView.layer.shadowOpacity = 0.5
        searchBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 2)
        searchBackgroundView.layer.shadowRadius = 3.0
        searchBackgroundView.layer.shadowColor = UIColor(red: 99/255, green: 108/255, blue: 163/255, alpha: 0.49).CGColor
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
