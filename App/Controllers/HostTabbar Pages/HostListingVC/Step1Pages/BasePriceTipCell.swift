//
//  TipCell.swift
//  App
//
//  Created by radicalstart on 01/08/22.
//  Copyright © 2022 RADICAL START. All rights reserved.
//

import UIKit

class BasePriceTipCell: UITableViewCell {
    @IBOutlet weak var viewTipTop: UIView!
    @IBOutlet var tipText: UILabel!
    
    @IBOutlet weak var viewMainQuickTip: UIView!
    @IBOutlet weak var btnQuickTip: UIButton!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblBestPriceTitle: UILabel!
    @IBOutlet weak var viewQuickTip: UIView!
    @IBOutlet weak var btnViewDetails: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tipText.font = UIFont(name: APP_FONT, size: 12)
        tipText.textColor = UIColor(named: "searchPlaces_TextColor")
        if(Utility.shared.isRTLLanguage()) {
            tipText.textAlignment = .right
        } else {
            tipText.textAlignment = .left
        }
        self.btnViewDetails.setTitle("", for: .normal)
        self.btnQuickTip.setTitle("", for: .normal)
       
        self.viewQuickTip.dropShadow(scale: true)

        self.viewQuickTip.layer.cornerRadius = 25
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
