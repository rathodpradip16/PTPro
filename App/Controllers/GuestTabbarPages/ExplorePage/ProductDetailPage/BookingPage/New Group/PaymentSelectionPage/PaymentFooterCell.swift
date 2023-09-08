//
//  PaymentFooterCell.swift
//  App
//
//  Created by radicalstart on 18/05/22.
//  Copyright © 2022 RADICAL START. All rights reserved.
//

import UIKit
import SwiftMessages

class PaymentFooterCell: UITableViewCell {
    @IBOutlet var containerView: UIView!
    
    @IBOutlet var lineview: UILabel!
    
    @IBOutlet var countryBtn: UIButton!
    @IBOutlet var txtFiled: CustomUITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = containerView.frame.size.height / 2
        containerView.layer.masksToBounds = true
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = Theme.PRIMARY_COLOR.cgColor
        
        containerView.backgroundColor = UIColor(named: "colorController")
        txtFiled.attributedPlaceholder = NSAttributedString(
            string: "Placeholder Text",
            attributes: [NSAttributedString.Key.foregroundColor: Theme.PRIMARY_COLOR]
        )
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
