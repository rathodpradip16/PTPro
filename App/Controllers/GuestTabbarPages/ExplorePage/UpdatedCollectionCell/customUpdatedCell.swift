//
//  customUpdatedCell.swift
//  App
//
//  Created by RadicalStart on 06/04/22.
//  Copyright © 2022 RADICAL START. All rights reserved.
//

import UIKit

class customUpdatedCell: UICollectionViewCell {
    @IBOutlet var thunderTop: NSLayoutConstraint!
    
    @IBOutlet var heartTop: NSLayoutConstraint!
    @IBOutlet var imgTop: NSLayoutConstraint!
    @IBOutlet var heightConstant: NSLayoutConstraint!
    @IBOutlet var heartBtnTrailing: NSLayoutConstraint!
    @IBOutlet var leftConstant: NSLayoutConstraint!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var heartBtn: UIButton!
    @IBOutlet weak var listTypeLabel: UILabel!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var listTitleLabel: UILabel!
    @IBOutlet weak var listPriceLabel: UILabel!
    @IBOutlet weak var lightningImageView: UIImageView!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        
//        self.backgroundColor = Theme.Recom_most_cell_BG
        
       // self.imageView.backgroundColor = UIColor.lightGray
        
        self.heartBtn.layer.cornerRadius = 20
        self.heartBtn.clipsToBounds = true
        self.heartBtn.setTitle("", for: .normal)
        
        listTypeLabel.font = UIFont(name:APP_FONT, size: 11)
        ratingLabel.font = UIFont(name: APP_FONT, size: 11)
        listTitleLabel.font = UIFont(name:APP_FONT_MEDIUM, size: 13)
        listPriceLabel.font = UIFont(name:APP_FONT_MEDIUM, size: 11)
        
        
        listTypeLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        listTitleLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        listPriceLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        
        
        
        
        self.heartBtn.imageView?.contentMode = .scaleAspectFill
        
       // listPriceLabel.semanticContentAttribute = .forceLeftToRight
        
        
        
       // self.listTitleLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        
        self.lineView.backgroundColor = Theme.PRIMARY_COLOR
        
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        if (Utility.shared.isRTLLanguage()){
//            self.halfroundedCorners(corners: [.topRight, .bottomRight, .bottomLeft], radius: 10.0)
//            self.imageView.halfroundedCorners(corners: [.bottomLeft, .topRight], radius: 10.0)
//        }else{
//            self.halfroundedCorners(corners: [.topLeft, .bottomRight, .bottomLeft], radius: 10.0)
//            self.imageView.halfroundedCorners(corners: [.bottomRight, .topLeft], radius: 10.0)
//        }
//
    }

}
