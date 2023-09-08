//
//  ReadmoreCell.swift
//  App
//
//  Created by RadicalStart on 06/04/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class ReadmoreCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    
        descriptionLabel.font = UIFont(name: APP_FONT, size: 14)
        descriptionLabel.textColor = UIColor(named: "searchPlaces_TextColor")
        if(Utility.shared.isRTLLanguage()) {
            descriptionLabel.textAlignment = .right
        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
