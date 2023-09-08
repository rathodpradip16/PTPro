//
//  StepPublishCell.swift
//  App
//
//  Created by RadicalStart on 26/07/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class StepPublishCell: UITableViewCell {

    @IBOutlet weak var previewBtn: UIButton!
    @IBOutlet weak var publishBtn: UIButton!
    @IBOutlet weak var listnameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.publishBtn.layer.cornerRadius = 4.0
//        self.publishBtn.layer.masksToBounds = true
//        self.previewBtn.layer.cornerRadius = 4.0
//        self.previewBtn.layer.masksToBounds = true
//        self.previewBtn.layer.borderWidth = 1.0
//        self.previewBtn.layer.borderColor = Theme.PRIMARY_COLOR.cgColor
      
        previewBtn.setTitle("  \((Utility.shared.getLanguage()?.value(forKey:"previewlist"))!)  ", for:.normal)
        
//        publishBtn.backgroundColor = Theme.PRIMARY_COLOR
//        previewBtn.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        
        previewBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
        publishBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
        
        publishBtn.setTitleColor(UIColor.white, for: .normal)
                                                 
        listnameLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 14)
        listnameLabel.textColor =  UIColor(named: "Title_Header")
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
