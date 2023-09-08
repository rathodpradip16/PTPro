//
//  MapCell.swift
//  App
//
//  Created by RadicalStart on 04/04/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class MapCell: UITableViewCell {

    @IBOutlet weak var mapLabel: UILabel!
    @IBOutlet weak var mapMarkerView: UIView!
    @IBOutlet weak var centerCircleView: UIImageView!
    @IBOutlet weak var mapView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()

              mapLabel.font = UIFont(name: APP_FONT, size: 17)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


        // Configure the view for the selected state
    }
    
}
