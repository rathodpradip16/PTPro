//
//  AffiliateCell.swift
//  App
//
//  Created by Phycom Mac Pro on 31/01/24.
//  Copyright © 2024 RADICAL START. All rights reserved.
//

import UIKit

class AffiliateCell: UITableViewCell {

    @IBOutlet var affiliateListTile: UILabel!
    @IBOutlet var checkBtn: UIButton!

    @IBOutlet weak var revenueTitleLbl: UILabel!
    @IBOutlet weak var txtField: CustomUITextField!

    @IBOutlet weak var affiliateStackview: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        affiliateListTile.font = UIFont(name: APP_FONT_MEDIUM, size: 14)
        affiliateListTile.textColor = UIColor(named: "Title_Header")
        affiliateListTile.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
            
        checkBtn.layer.borderColor = Theme.PRIMARY_COLOR.cgColor
        checkBtn.layer.borderWidth = 1.0
        checkBtn.layer.cornerRadius = 5.0
        checkBtn.clipsToBounds = true
        
        
        revenueTitleLbl.font = UIFont(name: APP_FONT, size: 14)
        revenueTitleLbl.textColor = UIColor(named: "searchPlaces_TextColor")
        revenueTitleLbl.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        
    
        txtField.font = UIFont(name: APP_FONT_MEDIUM, size: 14)
        txtField.textColor = UIColor(named: "Title_Header")
        
        txtField.layer.borderColor = UIColor(named: "text_borderColor")?.cgColor
        txtField.layer.borderWidth = 1.0
        txtField.layer.cornerRadius = 5.0
        txtField.layer.masksToBounds = true
        
        txtField.tintColor = UIColor(named: "Title_Header")
        
        
      txtField.semanticContentAttribute = (Utility.shared.isRTLLanguage()) ? .forceRightToLeft : .forceLeftToRight
        
        txtField.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
