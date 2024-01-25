//
//  FeebackHeaderCell.swift
//  Rent_All
//
//  Created by RadicalStart on 08/07/20.
//  Copyright © 2020 RADICAL START. All rights reserved.
//

import UIKit

class FeebackHeaderCell: UITableViewCell {

    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"howwedo") ?? "How are we doing?")"
        titleLabel.textColor = UIColor(named: "Title_Header")
        titleLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        titleLabel.font = UIFont(name: APP_FONT_SEMIBOLD, size: 16)
        
        descLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"feedDesc") ?? "We're always working to improve the PTPRO experience, so we'd love to hear what's working and how we can do better.")"
        descLabel.textColor = UIColor(named: "searchPlaces_TextColor")
        descLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        descLabel.font = UIFont(name: APP_FONT, size: 14)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
