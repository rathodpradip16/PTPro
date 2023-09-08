//
//  ItenaryaddressCell.swift
//  App
//
//  Created by RadicalStart on 31/05/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class ItenaryaddressCell: UITableViewCell {
    
    @IBOutlet weak var lineLabel: UILabel!
    
    @IBOutlet weak var addressTitleLabel: UILabel!
    @IBOutlet weak var viewListingBtn: UIButton!
    @IBOutlet weak var addressLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewListingBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"viewlisting"))!)", for:.normal)
        viewListingBtn.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        viewListingBtn.titleLabel?.font = UIFont(name: APP_FONT, size: 13)
        
        addressTitleLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"address"))!)"
        addressTitleLabel.textColor = UIColor(named: "Title_Header")
        addressTitleLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        addressTitleLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 14.0)
        
        lineLabel.backgroundColor = UIColor(named: "Review_Page_Line_Color")
        
        addressLabel.textColor = UIColor(named: "searchPlaces_TextColor")
        addressLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        addressLabel.font = UIFont(name: APP_FONT, size: 13.0)
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
