//
//  bookcancellationCell.swift
//  App
//
//  Created by RadicalStart on 30/05/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class bookcancellationCell: UITableViewCell {

    @IBOutlet var lineView: UILabel!
    @IBOutlet weak var cancelpolicycontentLabel: UILabel!
    @IBOutlet weak var cancelpolicyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lineView.backgroundColor = UIColor(named: "Review_Page_Line_Color")
        cancelpolicyLabel.font = UIFont(name: APP_FONT, size: 16)
        cancelpolicyLabel.textColor = UIColor(named: "Title_Header")
        cancelpolicycontentLabel.font = UIFont(name: APP_FONT, size: 16)
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
