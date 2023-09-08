//AnimationView
//  InstantBookCell.swift
//  App
//
//  Created by RADICAL START on 28/03/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import Lottie
class InstantBookCell: UITableViewCell {
     //MARK:  IBOUTLET CONNECTIONS 
    
    @IBOutlet var instantbookLabel: UILabel!
    
    @IBOutlet var DecsriptionLabel: UILabel!
    @IBOutlet  var lottieSwitch: AirbnbSwitch!
    
    @IBOutlet var lotSwitch: UISwitch!
    @IBOutlet var lottieView: LottieAnimationView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lotSwitch.onTintColor = Theme.PRIMARY_COLOR
        lotSwitch.tintColor = UIColor(named: "Button_Grey_Color")
        if(Utility.shared.isRTLLanguage()) {
            lotSwitch.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
 
               instantbookLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
        DecsriptionLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 14)
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
