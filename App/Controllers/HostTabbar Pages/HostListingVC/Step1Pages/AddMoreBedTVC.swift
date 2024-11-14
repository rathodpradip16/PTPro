//
//  AddMoreBedTVC.swift
//  App
//
//  Created by Phycom on 22/10/24.
//  Copyright © 2024 RADICAL START. All rights reserved.
//

import UIKit

class AddMoreBedTVC: UITableViewCell {

    @IBOutlet weak var lblBedCount: UILabel!
    @IBOutlet weak var btnBedPlus: UIButton!
    @IBOutlet weak var btnBedMinus: UIButton!
    @IBOutlet weak var dropDownSelectBedType: DropDown!
    @IBOutlet weak var btnDelete: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
