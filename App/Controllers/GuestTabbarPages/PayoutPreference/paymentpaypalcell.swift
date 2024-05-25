//
//  paymentpaypalcell.swift
//  App
//
//  Created by RadicalStart on 19/08/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class paymentpaypalcell: UITableViewCell {

    @IBOutlet weak var paydescriptionLabel: UILabel!
    @IBOutlet weak var paypalLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        paydescriptionLabel.text = String(format:"\((Utility.shared.getLanguage()?.value(forKey:"paypaldescription"))!)",appName,appName)

        paydescriptionLabel.font = UIFont(name: APP_FONT, size: 14)
        paydescriptionLabel.textColor =   UIColor(named: "searchPlaces_TextColor")
       
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
