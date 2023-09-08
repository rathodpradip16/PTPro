//
//  BookingFourCell.swift
//  App
//
//  Created by RadicalStart on 30/05/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class BookingFourCell: UITableViewCell {

    @IBOutlet weak var listBtn: UIButton!
    @IBOutlet weak var listImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var listnameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stepLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        titleLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "reviewpay_small"))!)"
        stepLabel.font = UIFont(name: APP_FONT, size: 16)
         dateLabel.font = UIFont(name: APP_FONT, size: 16)
         
         titleLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 25)
        listnameLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 18)
        listBtn.titleLabel?.font = UIFont(name: APP_FONT, size: 15)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
