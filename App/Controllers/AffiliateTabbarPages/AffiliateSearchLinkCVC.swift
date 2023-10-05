//  AffiliateSearchLinkCVC.swift
//  App
//
//  Created by RADICAL START on 26/03/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import AARatingBar
import Cosmos
import ISPageControl


class AffiliateSearchLinkCVC: UICollectionViewCell {
        
    //MARK:IBOUTLET CONNECTIONS
    
    @IBOutlet var homeImage: UIImageView!
        
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblCity: UILabel!
    @IBOutlet var lblDescription: UILabel!

    @IBOutlet weak var btnLink: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblTitle.numberOfLines = 0
        lblTitle.lineBreakMode = .byWordWrapping
        lblTitle.textColor = Theme.ENTIRE_COLOR
        lblCity.textColor = Theme.GRAY_COLOR
        lblDescription.textColor = Theme.TextLightColor

        lblDescription.numberOfLines = 0
        lblDescription.lineBreakMode = .byWordWrapping
        img.contentMode = .scaleAspectFill
      
        
        lblDescription.font = UIFont(name: APP_FONT_MEDIUM, size: 14)
        lblTitle.font = UIFont(name: APP_FONT_MEDIUM, size: 23)
        lblPrice.font = UIFont(name: APP_FONT, size: 17)
        lblCity.font = UIFont(name: APP_FONT, size: 17)

        // Initialization code
    }

    
}

