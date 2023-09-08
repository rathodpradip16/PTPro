//
//  ItenaryImageCell.swift
//  App
//
//  Created by RadicalStart on 31/05/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class ItenaryImageCell: UITableViewCell {
    
    @IBOutlet var likeBtn: UIButton!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var ratingStarImg: UIImageView!
    @IBOutlet weak var ratingCountLabel: UILabel!
    @IBOutlet weak var listImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    
    
    @IBOutlet var topConstant: NSLayoutConstraint!
    @IBOutlet var lineview: UILabel!
    
    @IBOutlet var heightConstant: NSLayoutConstraint!
    @IBOutlet weak var listLocationLabel: UILabel!
    @IBOutlet weak var listTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        bgView.backgroundColor = Theme.Recom_most_cell_BG
        
        listTitleLabel.textColor = UIColor(named: "Title_Header")
        listTitleLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        listTitleLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 15.0)
        listTitleLabel.backgroundColor = .clear
        
        lineview.backgroundColor = UIColor(named: "Review_Page_Line_Color")
        
        listLocationLabel.textColor = UIColor(named: "searchPlaces_TextColor")
        listLocationLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        listLocationLabel.font = UIFont(name: APP_FONT, size: 12.0)
        listLocationLabel.backgroundColor = .clear
        
        ratingCountLabel.textColor = UIColor(named: "Title_Header")
        ratingCountLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        ratingCountLabel.font = UIFont(name: APP_FONT, size: 12.0)
        
        
        ratingLabel.textColor = UIColor(named: "Title_Header")
        ratingLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        ratingLabel.font = UIFont(name: APP_FONT, size: 12.0)
        
        
        
        ratingView.backgroundColor = .clear
        listImage.layer.cornerRadius = 15
        listImage.layer.masksToBounds = true
        
        
        
//        if(Utility.shared.isRTLLanguage()) {
//            listImage.halfroundedCorners(corners: [.topRight, .bottomLeft], radius: 15.0)
//            bgView.halfroundedCorners(corners: [.topRight, .bottomRight, .bottomLeft], radius: 15.0)
//        }else{
//            listImage.halfroundedCorners(corners: [.topLeft, .bottomRight], radius: 15.0)
//            bgView.halfroundedCorners(corners: [.topLeft, .bottomRight, .bottomLeft], radius: 15.0)
//        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        if(Utility.shared.isRTLLanguage()) {
//            listImage.halfroundedCorners(corners: [.topRight, .bottomLeft], radius: 15.0)
//            bgView.halfroundedCorners(corners: [.topRight, .bottomRight, .bottomLeft], radius: 15.0)
//        }else{
//            listImage.halfroundedCorners(corners: [.topLeft, .bottomRight], radius: 15.0)
//            bgView.halfroundedCorners(corners: [.topLeft, .bottomRight, .bottomLeft], radius: 15.0)
//        }
    }
    
}
