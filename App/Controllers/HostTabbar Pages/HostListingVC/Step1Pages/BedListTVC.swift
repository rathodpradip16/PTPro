//
//  BedListTVC.swift
//  App
//
//  Created by Phycom on 21/10/24.
//  Copyright © 2024 RADICAL START. All rights reserved.
//

import UIKit

class BedListTVC: UITableViewCell {

    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var addDetails: UIButton!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgIcon: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.btnDelete.setTitle("", for: .normal)
        self.imgIcon.setTitle("", for: .normal)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
