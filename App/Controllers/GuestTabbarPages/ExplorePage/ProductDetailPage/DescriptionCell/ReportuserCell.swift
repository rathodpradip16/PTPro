//
//  ReportuserCell.swift
//  App
//
//  Created by RadicalStart on 28/11/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit

class ReportuserCell: UITableViewCell {

    @IBOutlet var reportuserLAbel: UILabel!
    @IBOutlet var btnReport: UIButton!
    @IBOutlet var lineview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        reportuserLAbel.text = "\((Utility.shared.getLanguage()?.value(forKey:"Report"))!)"
        
        
        lineview.backgroundColor = UIColor(named: "Review_Page_Line_Color")
       
        reportuserLAbel.font = UIFont(name: APP_FONT_MEDIUM, size: 18)
        
        btnReport.titleLabel?.font = UIFont(name: APP_FONT, size: 15)
        
//        btnReport.titleLabel?.text = "\((Utility.shared.getLanguage()?.value(forKey:"Report this host"))!)"
        
        btnReport.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"Report this host"))!)", for: .normal)
        if(Utility.shared.isRTLLanguage()){
                btnReport.contentHorizontalAlignment = .right
        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
