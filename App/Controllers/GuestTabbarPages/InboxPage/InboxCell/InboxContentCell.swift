//
//  InboxContentCell.swift
//  App
//
//  Created by RadicalStart on 10/06/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class InboxContentCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var approvedLabel: UILabel!
    @IBOutlet weak var approvedLabelWidthConstraints: NSLayoutConstraint!
    
    @IBOutlet var lineview: UILabel!
    
    @IBOutlet weak var nameLAbel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        approvedLabel.font = UIFont(name: APP_FONT, size: 12)
        approvedLabel.textColor = .white
        approvedLabel.layer.cornerRadius = approvedLabel.frame.size.height/2
        approvedLabel.clipsToBounds = true
        
        nameLAbel.font = UIFont(name: APP_FONT_MEDIUM, size: 14)
        nameLAbel.textColor = UIColor(named: "Title_Header")
        
        lineview.backgroundColor = UIColor(named: "Review_Page_Line_Color")
        
        messageLabel.font = UIFont(name: APP_FONT, size: 12)
        messageLabel.textColor = UIColor(named: "searchPlaces_TextColor")
        
        dateLabel.font = UIFont(name: APP_FONT, size: 12)
        dateLabel.textColor = UIColor(named: "searchPlaces_TextColor")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
