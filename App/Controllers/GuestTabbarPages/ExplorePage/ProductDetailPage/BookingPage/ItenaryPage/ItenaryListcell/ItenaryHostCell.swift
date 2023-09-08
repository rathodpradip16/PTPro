//
//  ItenaryHostCell.swift
//  App
//
//  Created by RadicalStart on 31/05/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class ItenaryHostCell: UITableViewCell {

    @IBOutlet weak var hosttitleLAbel: UILabel!
    @IBOutlet weak var messageHostBtn: UIButton!
    @IBOutlet weak var hostImage: UIImageView!
    @IBOutlet weak var hostNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        messageHostBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"messagehost"))!)", for:.normal)
        messageHostBtn.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        messageHostBtn.titleLabel?.font = UIFont(name: APP_FONT, size: 13)
        
        hosttitleLAbel.text = "\((Utility.shared.getLanguage()?.value(forKey:"host"))!)"
        hosttitleLAbel.textColor = UIColor(named: "Title_Header")
        hosttitleLAbel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        hosttitleLAbel.font = UIFont(name: APP_FONT_MEDIUM, size: 14.0)
        
        hostNameLabel.textColor = UIColor(named: "searchPlaces_TextColor")
        hostNameLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        hostNameLabel.font = UIFont(name: APP_FONT, size: 13.0)
        
        hostImage.layer.cornerRadius = 27
        hostImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
