//
//  StepOneCell.swift
//  App
//
//  Created by RadicalStart on 26/07/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class StepOneCell: UITableViewCell {

    @IBOutlet weak var bedsbathroomsLabel: UILabel!
    @IBOutlet weak var step1Label: UILabel!
    @IBOutlet weak var becomeahostLabel: UILabel!
    @IBOutlet weak var verifiedImage: UIImageView!
    @IBOutlet weak var changeBtn: UIButton!
    
    @IBOutlet var editLbl: UILabel!
    @IBOutlet var lblSpace: UILabel!
    
    @IBOutlet var arrow_img: UIImageView!
    
    @IBOutlet var containerView: UIView!
    
    @IBOutlet var lineview: UILabel!
    
    @IBOutlet var hostStepImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        step1Label.text = "\((Utility.shared.getLanguage()?.value(forKey:"step1"))!)"
        becomeahostLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"becomehost"))!)"
        bedsbathroomsLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"beds_desc"))!)"
        changeBtn.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        lineview.backgroundColor = UIColor(named: "Review_Page_Line_Color")
        
        becomeahostLabel.textColor = UIColor(named: "Title_Header")!
        
        bedsbathroomsLabel.textColor = UIColor(named: "Title_Header")!
//        verifiedImage.image = #imageLiteral(resourceName: "tick").withRenderingMode(.alwaysTemplate)
//        verifiedImage.tintColor = Theme.PRIMARY_COLOR
       
        changeBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 18)
        lblSpace.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
        lblSpace.text = "\((Utility.shared.getLanguage()?.value(forKey:"sayspace"))!)"
        
        containerView.layer.borderColor = UIColor(named: "Review_Page_Line_Color")?.cgColor
        //UIColor(red: 224/255.0, green: 224/255.0, blue: 224/255.0, alpha: 1.0).cgColor
        containerView.borderWidth = 1.0
        containerView.backgroundColor = UIColor(named: "becomeAHostStep_Color")
        //UIColor(red: 247/255.0, green: 247/255.0, blue: 247/255.0, alpha: 1.0);
                                                 
        becomeahostLabel.font  = UIFont(name: APP_FONT_MEDIUM, size: 27)
        step1Label.font = UIFont(name: APP_FONT, size: 16)
        
        bedsbathroomsLabel.font = UIFont(name: APP_FONT, size: 14)
        
        if(Utility.shared.isRTLLanguage()){
            editLbl.textAlignment = .left
            arrow_img.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
