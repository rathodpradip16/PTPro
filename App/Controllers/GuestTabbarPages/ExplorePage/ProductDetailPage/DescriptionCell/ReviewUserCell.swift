//
//  ReviewUserCell.swift
//  App
//
//  Created by RadicalStart on 28/11/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class ReviewUserCell: UITableViewCell {

    @IBOutlet var lineview: UILabel!
    @IBOutlet var reviewImg: UIImageView!
    @IBOutlet var reviewLabel: UILabel!
    @IBOutlet var reviewBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        reviewLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"reviews"))!)"
        reviewLabel.textColor = UIColor(named: "Title_Header")
        reviewBtn.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        reviewBtn.titleLabel?.font = UIFont(name: APP_FONT, size: 15)
        reviewLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 18)
        if(Utility.shared.isRTLLanguage()) {
            reviewBtn.contentHorizontalAlignment = .right
        }
        
        lineview.backgroundColor = UIColor(named: "Review_Page_Line_Color")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
