//
//  UpdatedSearchCell.swift
//  App
//
//  Created by RadicalStart on 12/04/22.
//  Copyright © 2022 RADICAL START. All rights reserved.
//

import UIKit
import ISPageControl
import FlexiblePageControl

class UpdatedSearchCell: UICollectionViewCell, ImageScrollerDelegate {
    func pageChanged(index: Int, indexpath: Int) {
        pageControllView.setCurrentPage(at:index, animated:true)
      
    }
    

    @IBOutlet var thunderTop: NSLayoutConstraint!
    @IBOutlet weak var imgScrollerView: ImageScroller!
//    @IBOutlet weak var pageControllView: ISPageControl!
    
    @IBOutlet var pageControllView: FlexiblePageControl!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var listTypeLabel: UILabel!
    @IBOutlet weak var listTitleLabel: UILabel!
    @IBOutlet weak var listPriceLabel: UILabel!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var ratingCount: UILabel!
    @IBOutlet weak var ratingImgView: UIImageView!
    @IBOutlet weak var lightImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        self.backgroundColor = Theme.Recom_most_cell_BG
        
        self.imgScrollerView.delegate = self
        self.imgScrollerView.backgroundColor = UIColor.clear
        self.imgScrollerView.isAutoScrollEnabled = false
        self.imgScrollerView.scrollTimeInterval = 2.0
        self.imgScrollerView.scrollView.bounces = false
        
        listTypeLabel.font = UIFont(name:APP_FONT, size: 12)
        listTypeLabel.textColor = UIColor(named: "searchPlaces_TextColor")
        ratingCount.font = UIFont(name: APP_FONT, size: 11)
        listTitleLabel.font = UIFont(name:APP_FONT_MEDIUM, size: 15)
        listPriceLabel.font = UIFont(name:APP_FONT_MEDIUM, size: 11)
//        self.pageControllView.radius = 4
//        self.pageControllView.padding = 6
//        self.pageControllView.inactiveTintColor = UIColor(named: "Review_Page_Line_Color")!
//        self.pageControllView.currentPageTintColor = Theme.PRIMARY_COLOR
        
        pageControllView.cornerRadius = 5
        //imagePageControll.pa = 8
        pageControllView.pageIndicatorTintColor = UIColor(named: "Review_Page_Line_Color")!
        pageControllView.currentPageIndicatorTintColor = Theme.PRIMARY_COLOR
        
        self.likeBtn.layer.cornerRadius = 18
        self.likeBtn.clipsToBounds = true
        self.likeBtn.setTitle("", for: .normal)
        imgScrollerView.contentMode = .scaleAspectFit
        imgScrollerView.clipsToBounds = true
        
        self.listTitleLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        self.imgScrollerView.layer.cornerRadius = 15
        self.imgScrollerView.layer.masksToBounds = true
        self.imgScrollerView.clipsToBounds = true
        if (Utility.shared.isRTLLanguage()){
//            self.halfroundedCorners(corners: [.topRight, .bottomRight, .bottomLeft], radius: 10.0)
//            self.imgScrollerView.halfroundedCorners(corners: [.bottomLeft, .topRight, .topLeft,.bottomRight], radius: 15.0)
        }else{
//            self.halfroundedCorners(corners: [.topLeft, .bottomRight, .bottomLeft], radius: 10.0)
//            self.imgScrollerView.halfroundedCorners(corners: [.bottomRight, .topRight, .topLeft, .bottomLeft], radius: 15.0)
        }
        
    }
}
