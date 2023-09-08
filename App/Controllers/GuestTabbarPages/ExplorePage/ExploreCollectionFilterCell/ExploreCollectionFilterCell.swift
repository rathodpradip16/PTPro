//
//  ExploreCollectionFilterCell.swift
//  App
//
//  Created by RADICAL START on 26/03/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import AARatingBar
import Cosmos
import ISPageControl


class ExploreCollectionFilterCell: UICollectionViewCell,ImageScrollerDelegate {
    
    func pageChanged(index: Int, indexpath: Int) {
        Pagecontrol.currentPage = index
        Pagecontrol.inactiveTintColor = UIColor(named: "Review_Page_Line_Color")!
    }
    
    
    //MARK:IBOUTLET CONNECTIONS 
    
    @IBOutlet var homeImage: UIImageView!
    
    @IBOutlet weak var Pagecontrol: ISPageControl!
    @IBOutlet weak var likeBtn: UIButton!
    
    @IBOutlet weak var imageScroller: ImageScroller!
    
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var entirehomeLabel: UILabel!
    
    @IBOutlet weak var updatedRatingView: UIView!
    @IBOutlet weak var starImgView: UIImageView!
    @IBOutlet weak var starRatingCount: UILabel!
    @IBOutlet weak var lightningImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageScroller.delegate = self
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        entirehomeLabel.textColor = Theme.ENTIRE_COLOR
        
        
        imageScroller.contentMode = .scaleAspectFill
      
        
        entirehomeLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 14)
        titleLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 23)
        priceLabel.font = UIFont(name: APP_FONT, size: 17)
        // Initialization code
    }

    
}
