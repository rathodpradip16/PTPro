//
//  BecomeHostStepTitleCell.swift
//  App
//
//  Created by RadicalStart on 09/06/22.
//  Copyright © 2022 RADICAL START. All rights reserved.
//

import UIKit

class BecomeHostStepTitleCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lineBorderView: UIView!
    
    @IBOutlet var imgBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lineBorderView.layer.borderWidth = 1.0
        lineBorderView.layer.cornerRadius = 22.5
        lineBorderView.clipsToBounds = true
        
        lblTitle.textAlignment = .center
        lblTitle.font = UIFont(name: APP_FONT, size: 14.0)
    }

}
