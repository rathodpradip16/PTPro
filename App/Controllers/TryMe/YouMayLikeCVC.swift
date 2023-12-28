

import UIKit
import ISPageControl
import FlexiblePageControl

class YouMayLikeCVC: UICollectionViewCell, ImageScrollerDelegate {
  
    func pageChanged(index: Int, indexpath: Int) {
        pageControllView.setCurrentPage(at:index, animated:true)
    }
    
    @IBOutlet weak var imgScrollerView: ImageScroller!
    
    @IBOutlet var pageControllView: FlexiblePageControl!
    @IBOutlet weak var listTypeLabel: UILabel!
    @IBOutlet weak var listTitleLabel: UILabel!
    @IBOutlet weak var listPriceLabel: UILabel!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var ratingCount: UILabel!
    @IBOutlet weak var ratingImgView: UIImageView!
    
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

        pageControllView.cornerRadius = 5
        pageControllView.pageIndicatorTintColor = UIColor(named: "Review_Page_Line_Color")!
        pageControllView.currentPageIndicatorTintColor = Theme.PRIMARY_COLOR
        
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
    }
    
    
}
