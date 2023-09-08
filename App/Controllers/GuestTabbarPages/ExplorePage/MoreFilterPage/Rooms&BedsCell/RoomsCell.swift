//
//  RoomsCell.swift
//  App
//
//  Created by RADICAL START on 28/03/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class RoomsCell: UITableViewCell {
    
    @IBOutlet var roomsTitleLabel: UILabel!
    
    @IBOutlet var minusBtn: UIButton!
    
    @IBOutlet var plusBtn: UIButton!
    
    @IBOutlet var countshowLabel: UILabel!

    @IBOutlet weak var dashView: UIView!
    
    //This Property
    var countValue = Int()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.dashView.isHidden = true
        // Initialization code
        self.plusBtn.layer.cornerRadius = (plusBtn.frame.size.height) / 2
        self.minusBtn.layer.cornerRadius = (minusBtn.frame.size.height) / 2
        self.minusBtn.setImage(#imageLiteral(resourceName: "substract").withRenderingMode(.alwaysTemplate), for: .normal)
        self.minusBtn.tintColor = Theme.PRIMARY_COLOR
        self.plusBtn.setImage(#imageLiteral(resourceName: "add").withRenderingMode(.alwaysTemplate), for: .normal)
        self.plusBtn.tintColor = Theme.PRIMARY_COLOR
        roomsTitleLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 14)
//        roomsTitleLabel.textColor = UIColor(named: "Title_Header")
        countshowLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
        countshowLabel.textColor = UIColor(named: "Title_Header")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func plusBtnTapped(_ sender: UIButton){
        
        countshowLabel.text = "\(Int(countshowLabel.text!)! + countValue)"

    }
    @objc func minusBtnTapped(_ sender: UIButton){
       
        countshowLabel.text = "\(Int(countshowLabel.text!)! - countValue)"
       
    }
}
