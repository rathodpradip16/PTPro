//
//  DateCell.swift
//  App
//
//  Created by radicalstart on 12/05/22.
//  Copyright © 2022 RADICAL START. All rights reserved.
//

import UIKit

class DateCell: UITableViewCell {

    @IBOutlet var rightArrow: UIImageView!
    @IBOutlet var dateBtn: UIButton!
    @IBOutlet var dateView: UIView!
    
    
    @IBOutlet var dateBtnLeading: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        if(Utility.shared.isRTLLanguage()){
           
            rightArrow.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
        
        
        dateView.layer.cornerRadius = (dateView.frame.size.height / 2)
        dateBtn.setTitleColor(UIColor(named: "Title_Header"), for: .normal)
        dateView.layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
