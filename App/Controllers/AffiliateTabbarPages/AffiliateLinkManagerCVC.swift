//
//  AffiliateLinkManagerCVC.swift
//  App
//
//  Created by Phycom Mac Pro on 08/10/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit

class AffiliateLinkManagerCVC: UICollectionViewCell {
        
    //MARK:IBOUTLET CONNECTIONS        
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var lblTitle: UILabel!

    @IBOutlet weak var btnCopyLink: UIButton!
    
    @IBOutlet var lblRevenueSharingTitle: UILabel!
    @IBOutlet var lblRevenueSharingValue: UILabel!
    @IBOutlet var lblClickTitle: UILabel!
    @IBOutlet var lblClickValue: UILabel!
    @IBOutlet var lblEarningsTitle: UILabel!
    @IBOutlet var lblEarningsValue: UILabel!
    @IBOutlet var LblLinkCreationDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    
}
