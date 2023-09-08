//
//  PriceRangeCell.swift
//  App
//
//  Created by RADICAL START on 28/03/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import RangeSeekSlider

class PriceRangeCell: UITableViewCell {
    //MARK: IBOUTLET CONNECTIONS 
    
    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet weak var priceshowLabel: UILabel!
    
    
    @IBOutlet var sliderView: RangeSeekSlider!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if  Utility.shared.isRTLLanguage() { //Arabic
            UIView.animate(withDuration: 0.1) {
              //  self.sliderView.transform = CGAffineTransform(scaleX: -1, y: 1)
                self.sliderView.semanticContentAttribute = .forceRightToLeft
               
            }
        } else {
            self.sliderView.semanticContentAttribute = .forceLeftToRight
        }

        sliderView.colorBetweenHandles = Theme.PRIMARY_COLOR
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
