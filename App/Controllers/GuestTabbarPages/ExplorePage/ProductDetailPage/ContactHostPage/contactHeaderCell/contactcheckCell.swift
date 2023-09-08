//
//  contactcheckCell.swift
//  App
//
//  Created by RadicalStart on 17/05/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class contactcheckCell: UITableViewCell {

    @IBOutlet var guestImg: UIImageView!
    @IBOutlet var checkinimg: UIImageView!
    @IBOutlet var guestCountsLabel: UILabel!
    
    @IBOutlet var checkinoutLabel: UILabel!
    @IBOutlet weak var checkguestLabel: UILabel!
    @IBOutlet weak var checkoutLabel: UILabel!
    @IBOutlet weak var checkinLabel: UILabel!
    @IBOutlet weak var guestLabel: UIButton!
    @IBOutlet weak var addDateinLabel: UIButton!
    @IBOutlet weak var addOutDateLabel: UIButton!
    
    @IBOutlet var lineView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        checkinLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"checkinn"))!) / \((Utility.shared.getLanguage()?.value(forKey:"checkoutt"))!)"
//        checkoutLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"checkout"))!)"
        checkguestLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"guests"))!)"
        
        lineView.backgroundColor = UIColor(named: "Review_Page_Line_Color")
      
         addOutDateLabel.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
         guestLabel.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        addOutDateLabel.titleLabel?.font = UIFont(name: APP_FONT, size: 14)
       
          guestLabel.titleLabel?.font = UIFont(name: APP_FONT, size: 14)
          
        checkguestLabel.font = UIFont(name: APP_FONT_SEMIBOLD, size: 14)
         checkinLabel.font = UIFont(name: APP_FONT_SEMIBOLD, size: 14)
        
        checkinoutLabel.font = UIFont(name: APP_FONT, size: 14)
         guestCountsLabel.font = UIFont(name: APP_FONT, size: 14)
        
        guestLabel.setTitle("  \((Utility.shared.getLanguage()?.value(forKey:"edit"))!)  ", for: .normal)
        addOutDateLabel.setTitle("  \((Utility.shared.getLanguage()?.value(forKey:"edit"))!)  ", for: .normal)

        
        checkinLabel.textColor = UIColor(named: "Title_Header")
        
        checkguestLabel.textColor = UIColor(named: "Title_Header")
        
        checkinoutLabel.textColor = UIColor(named: "searchPlaces_TextColor")
        guestCountsLabel.textColor = UIColor(named: "searchPlaces_TextColor")
        if(Utility.shared.isRTLLanguage()) {
            guestLabel.imageView?.performRTLTransform()
            checkinimg.performRTLTransform()
            guestImg.performRTLTransform()
            checkinLabel.textAlignment = .right
            checkguestLabel.textAlignment = .right
            guestLabel.imageEdgeInsets = UIEdgeInsets(top: 0, left:0, bottom: 0, right:56)
        }
       else{
           
         
      }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
