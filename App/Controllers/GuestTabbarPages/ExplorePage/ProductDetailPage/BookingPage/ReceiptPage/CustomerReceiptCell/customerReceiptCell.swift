//
//  customerReceiptCell.swift
//  App
//
//  Created by RadicalStart on 03/06/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class customerReceiptCell: UITableViewCell {

    @IBOutlet weak var customerReceiptLabel: UILabel!
    @IBOutlet weak var confirmCodeLAbel: UILabel!
    @IBOutlet weak var receiptNumberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
//        customerReceiptLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"customerReceipt"))!)"
        // Initialization code
        
   
        dateLabel.textColor = UIColor(named: "Title_Header")
        dateLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        dateLabel.font = UIFont(name: APP_FONT, size: 14.0)
        
        receiptNumberLabel.textColor = UIColor(named: "Title_Header")
        receiptNumberLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        receiptNumberLabel.font = UIFont(name: APP_FONT_SEMIBOLD, size: 24.0)
        
        lineView.backgroundColor = UIColor(named: "Review_Page_Line_Color")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
