//
//  SingleTextFieldCell.swift
//  App
//
//  Created by RadicalStart on 25/07/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class SingleTextFieldCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var textField: CustomUITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         textField.font = UIFont(name: APP_FONT, size: 18)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
