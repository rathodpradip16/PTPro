//
//  HouseRulesCell.swift
//  App
//
//  Created by RadicalStart on 26/04/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class HouseRulesCell: UITableViewCell {

    
    @IBOutlet var amenitieslistTile: UILabel!
    
    
    @IBOutlet var checkBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        checkBtn.layer.borderWidth = 1.5
        checkBtn.layer.borderColor = Theme.PRIMARY_COLOR.cgColor
             amenitieslistTile.font = UIFont(name: APP_FONT, size: 14)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
