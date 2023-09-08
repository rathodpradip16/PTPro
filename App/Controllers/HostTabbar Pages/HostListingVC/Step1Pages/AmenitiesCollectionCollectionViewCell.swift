//
//  AmenitiesCollectionCollectionViewCell.swift
//  App
//
//  Created by radicalstart on 02/08/22.
//  Copyright © 2022 RADICAL START. All rights reserved.
//

import UIKit

class AmenitiesCollectionCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet var borderView: UIView!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var typeImg: UIImageView!
    override func awakeFromNib() {
        typeLabel.font = UIFont(name:APP_FONT, size: 12)
        super.awakeFromNib()
        // Initialization code
    }

}
