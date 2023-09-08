//
//  CalendarListCell.swift
//  App
//
//  Created by RadicalStart on 05/08/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import SwiftMessages

class CalendarListCell: UITableViewCell {

    @IBOutlet var lineview: UILabel!
    @IBOutlet weak var tickImage: UIImageView!
    @IBOutlet weak var entireLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var listimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      //  self.tickImage.image = self.tickImage.image?.withRenderingMode(.alwaysTemplate)
     //   self.tickImage.tintColor = Theme.PRIMARY_COLOR
        
       // entireLabel.textColor = UIColor.gray
        entireLabel.font = UIFont(name: APP_FONT, size: 12)
        entireLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        
        entireLabel.textColor = UIColor(named: "searchPlaces_TextColor")
        
        lineview.backgroundColor = UIColor(named: "Review_Page_Line_Color")
        
        titleLabel.font = UIFont(name: APP_FONT_SEMIBOLD, size: 14)
        titleLabel.textColor = UIColor(named: "Title_Header")
        titleLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if Utility.shared.isRTLLanguage() {
            listimage.halfroundedCorners(corners: [.topRight,.bottomLeft,.topLeft,.bottomRight], radius: 10.0)
        }else{
            listimage.halfroundedCorners(corners: [.topRight,.bottomLeft,.topLeft,.bottomRight], radius: 10.0)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
