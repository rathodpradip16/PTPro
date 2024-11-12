//
//  SubcriptionPropertiesTVC.swift
//  App
//
//  Created by Phycom on 06/08/24.
//  Copyright © 2024 RADICAL START. All rights reserved.
//

import UIKit

class SubcriptionPropertiesTVC: UITableViewCell {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainView.layer.cornerRadius = 10
        mainView.layer.masksToBounds = false
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOpacity = 0.2
        mainView.layer.shadowOffset = CGSize(width: 0, height: 2)
        mainView.layer.shadowRadius = 3

        // Create a shadow path for better performance
        mainView.layer.shadowPath = UIBezierPath(roundedRect: mainView.bounds, cornerRadius: mainView.layer.cornerRadius).cgPath
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupShadow()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupShadow()
    }
    
    private func setupShadow() {
        if mainView != nil{
            mainView.layer.cornerRadius = 10
            mainView.layer.masksToBounds = false
            mainView.layer.shadowColor = UIColor.black.cgColor
            mainView.layer.shadowOpacity = 0.2
            mainView.layer.shadowOffset = CGSize(width: 0, height: 2)
            mainView.layer.shadowRadius = 4
            
            // Create a shadow path for better performance
            mainView.layer.shadowPath = UIBezierPath(roundedRect: mainView.bounds, cornerRadius: mainView.layer.cornerRadius).cgPath
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Ensure the shadow path is updated when the layout changes
        mainView.layer.shadowPath = UIBezierPath(roundedRect: mainView.bounds, cornerRadius: mainView.layer.cornerRadius).cgPath
    }
}
