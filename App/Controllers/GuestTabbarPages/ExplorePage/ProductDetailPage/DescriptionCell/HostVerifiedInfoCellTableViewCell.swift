//
//  HostVerifiedInfoCellTableViewCell.swift
//  App
//
//  Created by radicalstart on 09/05/22.
//  Copyright © 2022 RADICAL START. All rights reserved.
//

import UIKit

class HostVerifiedInfoCellTableViewCell: UITableViewCell {
   
    
    @IBOutlet var learnMoreButton: UIButton!
    
    @IBOutlet var lblDescription: UILabel!
    
    @IBOutlet var lblVerifiedInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblVerifiedInfo.font = UIFont(name: APP_FONT_MEDIUM, size: 18)
        lblDescription.font = UIFont(name: APP_FONT, size: 15)
        learnMoreButton.titleLabel?.font = UIFont(name: APP_FONT, size: 15)
        lblVerifiedInfo.text = "\((Utility.shared.getLanguage()?.value(forKey:"verfiediinfo"))!)"
      
        learnMoreButton.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"Learn More"))!)", for: .normal)
        
        if(Utility.shared.isRTLLanguage()){
            learnMoreButton.contentHorizontalAlignment = .right
        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
