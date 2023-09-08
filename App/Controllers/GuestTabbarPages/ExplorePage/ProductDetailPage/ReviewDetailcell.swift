//
//  ReviewDetailcell.swift
//  Rent_All
//
//  Created by RadicalStart on 16/03/20.
//  Copyright © 2020 RADICAL START. All rights reserved.
//

import UIKit

class ReviewDetailcell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileimgBtn: UIButton!
    
    @IBOutlet weak var reviewDescLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
