//
//  TipCell.swift
//  App
//
//  Created by radicalstart on 01/08/22.
//  Copyright © 2022 RADICAL START. All rights reserved.
//

import UIKit

class TipCell: UITableViewCell {
    @IBOutlet var tipText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tipText.font = UIFont(name: APP_FONT, size: 12)
        tipText.textColor = UIColor(named: "searchPlaces_TextColor")
        if(Utility.shared.isRTLLanguage()) {
            tipText.textAlignment = .right
        } else {
            tipText.textAlignment = .left
        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
