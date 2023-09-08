//
//  sendCell.swift
//  App
//
//  Created by RadicalStart on 11/06/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class sendCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var messageLAbel: UILabel!
    @IBOutlet weak var messageDateLabel: UILabel!
    @IBOutlet weak var senderView: UIView!
    
    @IBOutlet var curveView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        messageLAbel.font = UIFont(name: APP_FONT, size: 16)
        messageLAbel.textColor = UIColor(named: "Title_Header")
        messageLAbel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        
        messageDateLabel.font = UIFont(name: APP_FONT, size: 12)
        messageDateLabel.textColor = UIColor(named: "searchPlaces_TextColor")
        messageDateLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        
        senderView.backgroundColor = UIColor(named: "sendMessageBGColor")
        
        profileImage.layer.cornerRadius = profileImage.frame.size.height / 2
        profileImage.layer.masksToBounds = true
        
//        senderView.layer.cornerRadius = 8
//        senderView.layer.masksToBounds = true
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
                        curveView.image = #imageLiteral(resourceName: "blue-center").withRenderingMode(.alwaysTemplate)
                        curveView.tintColor = UIColor(named: "sendMessageBGColor")
        if Utility.shared.isRTLLanguage(){
            curveView.performRTLTransform()
//            senderView.halfroundedCorners(corners: [.topRight, .bottomLeft, .bottomRight], radius: 8.0)
        }else{
//
//            senderView.halfroundedCorners(corners: [.topLeft, .bottomLeft, .bottomRight], radius: 8.0)
       }
//        
       
    }
    
}
