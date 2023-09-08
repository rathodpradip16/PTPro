//
//  homelistingCell.swift
//  App
//
//  Created by RadicalStart on 16/12/20.
//  Copyright © 2020 RADICAL START. All rights reserved.
//

import UIKit

class homelistingCell: UITableViewCell {
    @IBOutlet weak var heightConstraint:NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var widthConstraint:NSLayoutConstraint!
    @IBOutlet weak var exploreCollection:UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
