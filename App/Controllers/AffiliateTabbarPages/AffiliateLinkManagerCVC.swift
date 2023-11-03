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
    @IBOutlet var bottomStack: UIStackView!

    override func awakeFromNib() {
        super.awakeFromNib()
        if #available(iOS 11.0, *){
            bottomStack.clipsToBounds = true
            bottomStack.layer.cornerRadius = 10
            bottomStack.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
           }else{
              let rectShape = CAShapeLayer()
              rectShape.bounds = bottomStack.frame
              rectShape.position = bottomStack.center
              rectShape.path = UIBezierPath(roundedRect: bottomStack.bounds,    byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 20, height: 20)).cgPath
               bottomStack.layer.backgroundColor = UIColor.green.cgColor
               bottomStack.layer.mask = rectShape
         }
    }
}
