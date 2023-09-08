//
//  TripsLocationCell.swift
//  App
//
//  Created by radicalstart on 13/05/22.
//  Copyright © 2022 RADICAL START. All rights reserved.
//

import UIKit

class TripsLocationCell: UITableViewCell {
    @IBOutlet var lblRoomType: UILabel!
    
    @IBOutlet var lblRatingTop: NSLayoutConstraint!
    
    
    @IBOutlet var lineView: UILabel!
    
    @IBOutlet var lblDescriptionTop: NSLayoutConstraint!
    
    @IBOutlet var lblReviewTop: NSLayoutConstraint!
    @IBOutlet var lblReview: UILabel!
    @IBOutlet var lblRating: UIButton!
    @IBOutlet var lblDescription: UILabel!
    @IBOutlet var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lblDescription.font = UIFont(name: APP_FONT, size: 14)
        lblRoomType.font = UIFont(name: APP_FONT, size: 13)
        lblReview.font = UIFont(name: APP_FONT, size: 12)
        lblRating.titleLabel?.font = UIFont(name: APP_FONT, size: 12)
        imgView.layer.cornerRadius = 8
        imgView.layer.masksToBounds = true
        lblReview.textColor = UIColor(named: "viewList_Title")
        lblRating.setTitleColor(UIColor(named: "viewList_Title"), for: .normal)
        lblRoomType.textColor = UIColor(named: "searchPlaces_TextColor")
        
        lineView.backgroundColor = UIColor(named: "Review_Page_Line_Color")
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        if Utility.shared.isRTLLanguage()
//        {
//
//        }else{
//            imgView.halfroundedCorners(corners: [.topLeft,.bottomRight], radius: 10)
//        }
       
    }
    
}
