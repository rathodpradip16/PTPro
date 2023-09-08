//
//  SearchPageVC.swift
//  App
//
//  Created by RADICAL START on 26/03/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import SwiftMessages

class SearchPalceCell: UITableViewCell {
    @IBOutlet var iconImage: UIImageView!
    
    @IBOutlet var lineView: UIView!
    @IBOutlet var locationLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        lineView.backgroundColor = UIColor(named: "Review_Page_Line_Color")
        // Initialization code
    }
    func configCell(locationDict:NSDictionary) {
        
        locationLbl.text = locationDict.value(forKey: "address_full") as? String
        locationLbl.font = UIFont(name: APP_FONT, size:14)
        locationLbl.textColor = UIColor(named: "searchPlaces_TextColor")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
