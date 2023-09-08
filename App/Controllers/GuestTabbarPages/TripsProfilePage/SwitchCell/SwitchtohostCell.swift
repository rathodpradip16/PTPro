//
//  SwitchtohostCell.swift
//  App
//
//  Created by RadicalStart on 06/05/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import SwiftMessages

class SwitchtohostCell: UITableViewCell {

    @IBOutlet weak var profileSettingLabel: UILabel!

    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var profilesettingImage: UIImageView!
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var profileRightValueLabel: UILabel!
    @IBOutlet weak var profileLblLeadingConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        profileSettingLabel.font = UIFont(name: APP_FONT, size: 14)
        if(Utility.shared.isRTLLanguage()) {
            profilesettingImage.performRTLTransform() }
        
        lineLabel.backgroundColor =  UIColor(named: "Review_Page_Line_Color")
        
        profileRightValueLabel.isHidden = true
        profileRightValueLabel.textAlignment = Utility.shared.isRTLLanguage() ? .left : .right
        profileRightValueLabel.textColor = Theme.Button_BG
        profileRightValueLabel.font = UIFont(name: APP_FONT, size: 14.0)
        
        
        profileSettingLabel.textColor =  UIColor(named: "searchPlaces_TextColor")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
