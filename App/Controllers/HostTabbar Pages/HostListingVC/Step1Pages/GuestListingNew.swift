//
//  GuestListingNew.swift
//  App
//
//  Created by radicalstart on 02/08/22.
//  Copyright © 2022 RADICAL START. All rights reserved.
//

import UIKit

class GuestListingNew: UITableViewCell {
    
    @IBOutlet var lineView: UILabel!
    @IBOutlet var arrow_img: UIImageView!
    @IBOutlet var btn: UIButton!
    @IBOutlet var borderView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        if(Utility.shared.isRTLLanguage()){
            arrow_img.performRTLTransform()
        }
        
        lineView.backgroundColor = UIColor(named: "Review_Page_Line_Color")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
