//
//  HometypeCell.swift
//  App
//
//  Created by RADICAL START on 28/03/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class HometypeCell: UITableViewCell {
    //MARK: IBOUTLET CONNECTIONS 
    
    @IBOutlet var homeTypeLabel: UILabel!
    
    @IBOutlet var checkBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkBtn.layer.borderWidth = 1.5
        checkBtn.layer.borderColor = Theme.PRIMARY_COLOR.cgColor
        homeTypeLabel.font = UIFont(name: APP_FONT, size: 14)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
