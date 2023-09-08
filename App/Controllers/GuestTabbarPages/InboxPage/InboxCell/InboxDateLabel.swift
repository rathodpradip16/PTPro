//
//  InboxDateLabel.swift
//  App
//
//  Created by RadicalStart on 11/06/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class InboxDateLabel: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var typeLAbel: UILabel!
    
    @IBOutlet weak var circleIndicationView: UIView!
    @IBOutlet weak var bottomLineView: UIView!
    @IBOutlet weak var topLineView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        typeLAbel.font = UIFont(name: APP_FONT, size: 14)
        typeLAbel.textColor = UIColor(named: "Title_Header")
        typeLAbel.textAlignment = .center
        
        dateLabel.font = UIFont(name: APP_FONT, size: 12)
        dateLabel.textColor = UIColor(named: "searchPlaces_TextColor")
        dateLabel.textAlignment = .center
        
        circleIndicationView.layer.cornerRadius = circleIndicationView.frame.size.height/2
        circleIndicationView.clipsToBounds = true

        topLineView.backgroundColor = UIColor(named: "Review_Page_Line_Color")
        bottomLineView.backgroundColor = UIColor(named: "Review_Page_Line_Color")
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
