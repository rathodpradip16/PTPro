//
//  SubscriptionPlansCVC.swift
//  App
//
//  Created by Phycom Mac Pro on 06/11/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit

class SubscriptionPlansCVC: UICollectionViewCell {
    @IBOutlet weak var imgAppIcon: UIImageView!
    @IBOutlet weak var viewAppIcon: UIView!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var viewTitle: UIView!
    @IBOutlet weak var btnSegment: UISegmentedControl!
    @IBOutlet weak var viewSegment: UIView!
    @IBOutlet weak var lblMemberShipCard: UILabel!
    @IBOutlet weak var imgBigIcon: UIImageView!
    @IBOutlet weak var imgSmallIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewListNow: UIView!
    @IBOutlet weak var imgListNow: UIImageView!
    @IBOutlet weak var lblListNow: UILabel!
    @IBOutlet weak var btnListNow: UIButton!

    @IBOutlet weak var lblCustomPlan: UILabel!
    @IBOutlet weak var lblExpDate: UILabel!
    @IBOutlet weak var lblActiveSub: UILabel!

    @IBOutlet weak var btnStartHere: UIButton!
    @IBOutlet weak var viewStartHere: UIView!
    @IBOutlet weak var imgDownArrow: UIImageView!
    
    private var gradientLayer: CAGradientLayer?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupGradientLayer()
    }

    private func setupGradientLayer() {
        guard gradientLayer == nil else { return } // Prevent creating multiple layers

        // Check if gradientView is properly initialized
        guard let gradientView = mainView else {
            print("Gradient view is not initialized.")
            return
        }
        
        // Initialize and configure the gradient layer
        gradientLayer = CAGradientLayer()
        gradientLayer?.colors = [Theme.subRedGradiantStartColor,Theme.subRedGradiantCenterColor ,Theme.subRedGradiantEndColor] // Default colors
        gradientLayer?.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer?.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer?.cornerRadius = 10
        // Add the gradient layer to the gradientView
        if let gradientLayer = gradientLayer {
            gradientView.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
    
    func configureGradient(with colors: [UIColor]) {
        // Update the gradient layer's colors
        gradientLayer?.colors = colors.map { $0.cgColor }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        // Ensure the gradient layer matches the gradientView's bounds
        gradientLayer?.frame = mainView.bounds
    }
}
