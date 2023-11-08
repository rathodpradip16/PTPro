//
//  ViewSubscriptionsVC.swift
//  App
//
//  Created by Phycom Mac Pro on 02/11/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit

class ViewSubscriptionsVC: UIViewController{

    // MARK: Vars
    private var animationsCount = 0
    
    var centerFlowLayout: YZCenterFlowLayout {
        return cvSubscriptionPlans.collectionViewLayout as! YZCenterFlowLayout
    }
    var scrollToEdgeEnabled: Bool = true

    
    @IBOutlet weak var mainView: UIView!
  
   @IBOutlet weak var cvSubscriptionPlans: UICollectionView!
    
    
    @IBOutlet weak var viewBenefits: UIView!
    @IBOutlet weak var imgBenefits: UIImageView!
    @IBOutlet weak var lblBenefits: UILabel!
    
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!

    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!

    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var lbl5: UILabel!
    @IBOutlet weak var lbl6: UILabel!

//    @IBOutlet weak var pagerView: FSPagerView!{
//        didSet {
//            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "FSPagerViewCell")
//            self.pagerView.itemSize = FSPagerView.automaticSize
//        }
//    }
//    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCollectionView()
        
      
    }
    
    private func configureCollectionView() {
      //  self.collectionViewLayout = FSPagerViewLayout()
        
        // Configure the required item size (REQURED)
        centerFlowLayout.itemSize = CGSize(
            width: view.bounds.width * 0.9,
            height:  view.bounds.height * 0.3
        )
        
        centerFlowLayout.animationMode = YZCenterFlowLayoutAnimation.scale(sideItemScale: 0.6, sideItemAlpha: 0.6, sideItemShift: 0.0)
    }

    @IBAction func onClickBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    //MARK: - API CALL
//    func getPlanDetailsAPICall(address:String, filter:String){
//
//        let getPlanDetailsQuery = PTProAPI.AffiliateSearchListingQuery(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""), address: .some(address), orderBy: .some(filter))
//        Network.shared.apollo_headerClient.fetch(query: affiliateSearchListingQuery, cachePolicy: .fetchIgnoringCacheData) { response in
//            switch response{
//            case .success(let result):
//                if let data = result.data?.affiliateSearchListing?.status,data == 200 {
//                    if let list =  result.data?.affiliateSearchListing, let results = list.results{
//                        self.arrLinkSearchList = results as! [PTProAPI.AffiliateSearchListingQuery.Data.AffiliateSearchListing.Result]
//                        self.NoresultView.isHidden = true
//                    }else{
//                        self.arrLinkSearchList.removeAll()
//                        self.NoresultView.isHidden = false
//                    }
//                    self.cvLinkSearch.setContentOffset(.zero, animated: true)
//                    self.cvLinkSearch.reloadData()
//                } else {
//                    self.view.makeToast(result.data?.affiliateSearchListing?.errorMessage)
//                }
//            case .failure(let error):
//                self.view.makeToast(error.localizedDescription)
//                break
//            }
//            self.cvLinkSearch?.isSkeletonable = false
//            self.cvLinkSearch?.hideSkeleton()
//        }
//    }
}

extension ViewSubscriptionsVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    

//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubscriptionPlansCVC", for: indexPath) as! SubscriptionPlansCVC

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.isDragging || collectionView.isDecelerating || collectionView.isTracking {
            return
        }
    }
}

