//
//  RentpaymentReceiptCell.swift
//  App
//
//  Created by RadicalStart on 03/06/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class RentpaymentReceiptCell: UITableViewCell {

    @IBOutlet var paymentRTLLabel: UILabel!
    @IBOutlet weak var payemntdescriptionLabel: UILabel!
    @IBOutlet weak var paymentreceiveLAbel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var paymentDateLabel: UILabel!
    
    @IBOutlet var lineView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        payemntdescriptionLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"payment_accept_info"))!)"
        
        paymentreceiveLAbel.text = "\((Utility.shared.getLanguage()?.value(forKey:"paymentreceive"))!)"
        // Initialization code
        
        
        lineView.backgroundColor = UIColor(named: "Review_Page_Line_Color")
          
        
        paymentreceiveLAbel.textColor = UIColor(named: "Title_Header")
        paymentreceiveLAbel.font = UIFont(name: APP_FONT, size: 12.0)
        paymentreceiveLAbel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        
        totalLabel.textColor = UIColor(named: "Title_Header")
        totalLabel.font = UIFont(name: APP_FONT, size: 12.0)
        totalLabel.textAlignment = Utility.shared.isRTLLanguage() ? .left : .right
        
        paymentRTLLabel.textColor = UIColor(named: "Title_Header")
        paymentRTLLabel.font = UIFont(name: APP_FONT, size: 12.0)
      //  paymentRTLLabel.textAlignment = Utility.shared.isRTLLanguage() ? .left : .right
        
        paymentDateLabel.textColor = UIColor(named: "searchPlaces_TextColor")
        paymentDateLabel.font = UIFont(name: APP_FONT, size: 12.0)
        paymentDateLabel.textAlignment = Utility.shared.isRTLLanguage() ? .left : .right
        
        payemntdescriptionLabel.textColor = UIColor(named: "searchPlaces_TextColor")
        payemntdescriptionLabel.font = UIFont(name: APP_FONT, size: 12.0)
        payemntdescriptionLabel.textAlignment = Utility.shared.isRTLLanguage() ? .left : .right
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
