//
//  CancellationPolicyCell1.swift
//  App
//
//  Created by radicalstart on 09/05/22.
//  Copyright © 2022 RADICAL START. All rights reserved.
//

import UIKit

class CancellationPolicyCell1: UITableViewCell {
    @IBOutlet var lblTitle: UILabel!
    
    @IBOutlet var lblExample: UILabel!
    @IBOutlet var lblDescription: UILabel!
    
    @IBOutlet var lblFooter: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblDescription.textColor = UIColor(named: "searchPlaces_TextColor")
        lblTitle.textColor = UIColor(named: "Title_Header")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        lblTitle.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
        lblDescription.font = UIFont(name: APP_FONT, size: 14)
        lblExample.font = UIFont(name: APP_FONT, size: 14)
        
        lblFooter.backgroundColor = UIColor(named: "Review_Page_Line_Color")
        // Configure the view for the selected state
    }
    
}
