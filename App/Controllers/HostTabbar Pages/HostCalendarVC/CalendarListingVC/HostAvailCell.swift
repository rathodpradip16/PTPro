//
//  HostAvailCell.swift
//  App
//
//  Created by RadicalStart on 07/08/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import SwiftMessages

class HostAvailCell: UITableViewCell {

    @IBOutlet weak var availabilityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        availabilityLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"availability"))!)"
        availabilityLabel.textColor = UIColor(named: "Title_Header")
        availabilityLabel.font = UIFont(name: APP_FONT_SEMIBOLD, size: 20.0)
        availabilityLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        
        dateLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 18)
        dateLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        dateLabel.textColor = UIColor(named: "Title_Header")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
