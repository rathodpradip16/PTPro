//
//  SpecialTextFieldCell.swift
//  App
//
//  Created by RadicalStart on 07/08/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
protocol SpecialTextFieldCellDelegate: class {
    func didChangeText(text: String?, cell: SpecialTextFieldCell)
}

class SpecialTextFieldCell: UITableViewCell,UITextFieldDelegate {
    @IBOutlet weak var specialpricingLabel: UILabel!
    @IBOutlet var lineLabel: UILabel!
    @IBOutlet weak var specialTF: CustomUITextField!
    
    @IBOutlet var currencyLabel: UILabel!
    
    
    
    var delegate:SpecialTextFieldCellDelegate!
    override func awakeFromNib() {
        super.awakeFromNib()
        lineLabel.backgroundColor = UIColor(named: "Review_Page_Line_Color")
        
        specialpricingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"Add_special_price") ?? "Add special price")"
        specialpricingLabel.textColor = UIColor(named: "Title_Header")
        specialpricingLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 18.0)
        currencyLabel.font = UIFont(name:APP_FONT, size: 18.0)
        specialTF.tintColor = UIColor(named: "Title_Header")
        specialpricingLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
       
        specialTF.delegate = self
       // specialTF.placeholder = "245"
        
        //\((Utility.shared.getLanguage()?.value(forKey:"pernight"))!)"
        specialTF.font = UIFont(name: APP_FONT, size: 18)
        specialTF.textColor = UIColor(named: "Title_Header")
        specialTF.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func textFieldDidChange(_ textField: UITextField) {
     
        delegate?.didChangeText(text:textField.text, cell: self)
        
    }
}
