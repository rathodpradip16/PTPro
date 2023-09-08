//
//  AgreetermsCell.swift
//  App
//
//  Created by RadicalStart on 30/05/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class AgreetermsCell: UITableViewCell {

    @IBOutlet weak var agreeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        agreeLabel.textColor = UIColor(named: "searchPlaces_TextColor")
        let fullString = "\((Utility.shared.getLanguage()?.value(forKey:"agreeterm"))!)"
        // Choose wwhat you want to be colored.
        let coloredString = "\((Utility.shared.getLanguage()?.value(forKey:"houseRules"))!)"

        // Get the range of the colored string.
       let rangeOfColoredString = (fullString as! NSString).range(of: coloredString)

        // Create the attributedString.
        let attributedString = NSMutableAttributedString(string:fullString)
        attributedString.setAttributes([NSAttributedString.Key.foregroundColor: Theme.PRIMARY_COLOR , NSAttributedString.Key.font: APP_FONT_SEMIBOLD],
                                range: rangeOfColoredString)
        agreeLabel.attributedText = attributedString
        
      
        
        agreeLabel.font = UIFont(name: APP_FONT, size: 14)
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
