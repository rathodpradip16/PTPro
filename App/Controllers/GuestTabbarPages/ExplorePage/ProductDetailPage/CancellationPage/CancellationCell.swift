//
//  CancellationCell.swift
//  App
//
//  Created by RadicalStart on 17/05/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class CancellationCell: UITableViewCell {
    @IBOutlet weak var checkLabel: UILabel!
    
    
    @IBOutlet var lineView: UILabel!
    
    @IBOutlet var lblExampleDescription: UILabel!
    @IBOutlet var lblExample: UILabel!
    @IBOutlet var lblCancellationPolicy: UILabel!
    @IBOutlet weak var availabilityImg: UIImageView!
    @IBOutlet weak var cancelTitleLabel: UILabel!
    @IBOutlet weak var checkoutLabel: UILabel!
    @IBOutlet weak var fullviewDetailBtn: UIButton!
    @IBOutlet weak var checkoutTimeLabel: UILabel!
    @IBOutlet weak var checkinTimeLabel: UILabel!
    @IBOutlet weak var flexibleLabel: UILabel!
    
    @IBOutlet var lblExampleDescription1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
//        checkoutLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"checkoutt"))!)"
//        checkLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"checkinn"))!)"
        cancelTitleLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"cancellationPolicy"))!)"
//        checkinTimeLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"fri"))!), \((Utility.shared.getLanguage()?.value(forKey:"jun"))!) 09 3:00 PM"
//            checkoutTimeLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"mon"))!), \((Utility.shared.getLanguage()?.value(forKey:"jun"))!) 12 11:00 AM"
    
        cancelTitleLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 24)
        lblExample.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
        lblCancellationPolicy.font = UIFont(name: APP_FONT, size: 14)
        lblExampleDescription.font = UIFont(name: APP_FONT, size: 14)
        lblExampleDescription1.font = UIFont(name: APP_FONT, size: 14)
        
        lblExample.textColor =  UIColor(named: "Title_Header")
        
        lblCancellationPolicy.textColor = UIColor(named: "searchPlaces_TextColor")
        lblExampleDescription.textColor = UIColor(named: "searchPlaces_TextColor")
        lineView.backgroundColor = UIColor(named: "Review_Page_Line_Color")
        cancelTitleLabel.textColor =  UIColor(named: "Title_Header")
//        flexibleLabel.font = UIFont(name: APP_FONT, size: 18)
//        checkinTimeLabel.font = UIFont(name: APP_FONT, size: 18)
//        checkoutLabel.font = UIFont(name: APP_FONT, size: 18)
//        checkoutTimeLabel.font = UIFont(name: APP_FONT, size: 18)
//        checkLabel.font = UIFont(name: APP_FONT, size: 18)
//        if(Utility.shared.isRTLLanguage()) {
//            availabilityImg.performRTLTransform()
//        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
