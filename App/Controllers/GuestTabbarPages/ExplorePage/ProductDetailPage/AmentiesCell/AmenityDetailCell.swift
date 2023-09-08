//
//  AmenityDetailCell.swift
//  App
//
//  Created by RadicalStart on 04/04/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class AmenityDetailCell: UITableViewCell {
    
    @IBOutlet weak var amenityImage: UIImageView!
    @IBOutlet  var amenityLabel:UILabel!
    @IBOutlet weak var amenityLblLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet var amenityImgLeading: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        amenityLabel.font = UIFont(name: APP_FONT, size: 14)
        amenityLabel.textColor = UIColor(named: "searchPlaces_TextColor")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
