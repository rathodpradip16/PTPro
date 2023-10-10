//  AffiliateSearchLinkCVC.swift
//  App
//
//  Created by RADICAL START on 26/03/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import Cosmos


class AffiliateSearchLinkCVC: UICollectionViewCell {
        
    //MARK:IBOUTLET CONNECTIONS
    
    @IBOutlet var homeImage: UIImageView!
        
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblCity: UILabel!
    @IBOutlet var lblDescription: UILabel!

    @IBOutlet weak var btnLink: UIButton!
    
    @IBOutlet weak var imgLocation: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        imgLocation.tintColor = .black
    }

    
}

