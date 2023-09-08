//
//  ReportuserSelectionCell.swift
//  App
//
//  Created by RadicalStart on 28/11/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class ReportuserSelectionCell: UITableViewCell {
    
    

    @IBOutlet var lineview: UIView!
    @IBOutlet var selectionImg: UIImageView!
    @IBOutlet var reportuserLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        lineview.backgroundColor = UIColor(named: "Review_Page_Line_Color")
        reportuserLabel.textColor = UIColor(named: "Title_Header")
             reportuserLabel.font = UIFont(name: APP_FONT, size: 16)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
