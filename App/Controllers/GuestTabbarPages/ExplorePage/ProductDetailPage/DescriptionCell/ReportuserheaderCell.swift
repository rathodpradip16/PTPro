//
//  ReportuserheaderCell.swift
//  App
//
//  Created by RadicalStart on 28/11/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class ReportuserheaderCell: UITableViewCell {

    @IBOutlet var followLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        titleLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 24)
        titleLabel.textColor =  UIColor(named: "Title_Header")
        titleLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        
        followLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"choosereasons"))!)"
        followLabel.font = UIFont(name: APP_FONT, size: 16)
        titleLabel.textColor =  UIColor(named: "Title_Header")
        followLabel.textColor =  UIColor(named: "Title_Header")
        titleLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
      
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
