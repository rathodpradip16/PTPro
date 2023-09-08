//
//  ReservationCell.swift
//  App
//
//  Created by RadicalStart on 29/05/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class ReservationCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var reservationLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        reservationLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"pricebreak"))!)"
        reservationLabel.textColor = UIColor(named: "Title_Header")
        reservationLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        reservationLabel.font = UIFont(name: APP_FONT_SEMIBOLD, size: 14.0)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
