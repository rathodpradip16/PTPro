//
//  BlockCalendarCell.swift
//  App
//
//  Created by RadicalStart on 07/08/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class BlockCalendarCell: UITableViewCell {

    @IBOutlet weak var verifyImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lineLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 14)
        titleLabel.textColor = UIColor(named: "Title_Header")
        titleLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        
        lineLabel.backgroundColor = UIColor(named: "Review_Page_Line_Color")
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
