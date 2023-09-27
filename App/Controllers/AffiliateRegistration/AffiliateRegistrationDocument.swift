//
//  AffiliateRegistrationDocument.swift
//  App
//
//  Created by Phycom Mac Pro on 13/09/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit

class AffiliateRegistrationDocument: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var lblDocument: UILabel!
    @IBOutlet weak var lblUploadYour: UILabel!
    
    @IBOutlet weak var uploadOuterView: UIView!
    @IBOutlet weak var lblUploadPhotos: UILabel!
    @IBOutlet weak var imgPlus: UIImageView!
    @IBOutlet weak var btnUploadPhotos: UIButton!
    @IBOutlet weak var viewUploadPhotos: UIView!
    
    @IBOutlet weak var documentCV: UICollectionView!
    
    @IBOutlet weak var btnReadConditions: UIButton!
    @IBOutlet weak var imgDownArrow: UIImageView!
    @IBOutlet weak var lblReadBelowCondition: UILabel!
    @IBOutlet weak var stackviewTerms: UIStackView!
    
    @IBOutlet weak var viewTerms1: UIView!
    @IBOutlet weak var viewTerms2: UIView!
    @IBOutlet weak var viewTerms3: UIView!
    @IBOutlet weak var viewTerms4: UIView!
    @IBOutlet weak var stackviewEmpty1: UIStackView!
    @IBOutlet weak var stackviewEmpty2: UIStackView!

    @IBOutlet weak var lblTerms1: UILabel!
    @IBOutlet weak var lblTerms2: UILabel!
    @IBOutlet weak var lblTerms3: UILabel!
    @IBOutlet weak var lblTerms4: UILabel!
    
    @IBOutlet weak var imgTerms1: UIImageView!
    @IBOutlet weak var imgTerms2: UIImageView!
    @IBOutlet weak var imgTerms3: UIImageView!
    @IBOutlet weak var imgTerms4: UIImageView!
    
    @IBOutlet weak var btnAgreeTermsAndConditions: UIButton!
    @IBOutlet weak var btnFinish: UIButton!
    @IBOutlet weak var btnPrevious: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnUploadPhotos.setTitle("", for: .normal)
        btnReadConditions.setTitle( "", for: .normal)
        viewUploadPhotos.addLineDashedStroke(pattern: [2,5], radius: 15, color: UIColor.lightGray.cgColor)
        
        if #available(iOS 15.0, *) {
            btnAgreeTermsAndConditions.configuration?.imagePadding = 10
        } else {
            btnAgreeTermsAndConditions.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        }
        
        stackviewTerms.isHidden = true
        viewTerms1.isHidden = true
        viewTerms2.isHidden = true
        viewTerms3.isHidden = true
        viewTerms4.isHidden = true
        stackviewEmpty1.isHidden = true
        stackviewEmpty2.isHidden = true

    }

    //MARK: - actions
    @IBAction func onClickUploadDocumnet(_ sender: Any) {
    }
    
    @IBAction func onClickReadTermAndConditions(_ sender: Any) {
        stackviewTerms.isHidden = !stackviewTerms.isHidden
        viewTerms1.isHidden = !viewTerms1.isHidden
        viewTerms2.isHidden = !viewTerms2.isHidden
        viewTerms3.isHidden = !viewTerms3.isHidden
        viewTerms4.isHidden = !viewTerms4.isHidden
        stackviewEmpty1.isHidden = !stackviewEmpty1.isHidden
        stackviewEmpty2.isHidden = !stackviewEmpty2.isHidden

    }

    @IBAction func onClickBtnAgreeTermsAndConditions(_ sender: Any) {
        
    }
    
    @IBAction func onClickFinish(_ sender: Any) {
    }
    
    @IBAction func onClickPrevious(_ sender: Any) {
    }
    //MARK: - UICollectionView Delegate

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

class DocCVC: UICollectionViewCell{
    @IBOutlet weak var imgDoc: UILabel!
    @IBOutlet weak var btnCross: UIButton!
}
