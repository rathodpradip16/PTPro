//
//  PropertyCompareTVC.swift
//  App
//
//  Created by Phycom Mac Pro on 21/05/24.
//  Copyright © 2024 RADICAL START. All rights reserved.
//

import UIKit

class PropertyCompareTVC: UITableViewCell {

    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var currentPropertyScore: UILabel!
    @IBOutlet weak var resultPropertyScore: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
