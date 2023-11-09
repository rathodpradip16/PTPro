//
//  ViewSubscriptionsVC.swift
//  App
//
//  Created by Phycom Mac Pro on 02/11/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit
import NKVPhonePicker

class ViewSubscriptionsVC: UIViewController, UITextFieldDelegate ,CountriesViewControllerDelegate{
    
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
    
    @IBOutlet weak var viewCustomPlan: UIView!
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var txtFullName: CustomUITextField!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var txtEmail: CustomUITextField!
    @IBOutlet weak var txtPhoneNumber: NKVPhonePickerTextField!
    
    @IBOutlet weak var lblNoOfUnitsList: UILabel!
    
    @IBOutlet weak var txtNoOfUnitsList: CustomUITextField!
    @IBOutlet weak var btnSubmitRequest: UIButton!
    
    var arrPlans = [PTProAPI.GetPlanDetailsQuery.Data.GetPlanDetails.Result]()
    var currencysymbol = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewCustomPlan.isHidden = true
        self.viewBenefits.isHidden = false
        self.configureCollectionView()
        currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!) ?? ""
        self.getPlanDetailsAPICall()
        txtPhoneNumber.phonePickerDelegate = self
        txtPhoneNumber.countryPickerDelegate = self
    }
    
    private func configureCollectionView() {
        
        // Configure the required item size (REQURED)
        centerFlowLayout.itemSize = CGSize(
            width: view.bounds.width * 0.9,
            height:  view.bounds.height * 0.3
        )
        
        centerFlowLayout.animationMode = YZCenterFlowLayoutAnimation.scale(sideItemScale: 0.6, sideItemAlpha: 0.6, sideItemShift: 0.0)
        
        view1.dropShadow(color: .lightGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
        view2.dropShadow(color: .lightGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
        view3.dropShadow(color: .lightGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
        view4.dropShadow(color: .lightGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
        view5.dropShadow(color: .lightGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
        view6.dropShadow(color: .lightGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
        
    }
    
    func updateBenifitData(indexPath:Int){
        self.lbl1.text = self.arrPlans[indexPath].one
        self.lbl2.text = self.arrPlans[indexPath].two
        self.lbl3.text = self.arrPlans[indexPath].three
        self.lbl4.text = self.arrPlans[indexPath].four
        self.lbl5.text = self.arrPlans[indexPath].five
        self.lbl6.text = self.arrPlans[indexPath].six
        
        self.viewBenefits.isHidden = false
        self.viewCustomPlan.isHidden = true
        switch self.arrPlans[indexPath].title{
        case "Economy":
            self.imgBenefits.image = UIImage(named: "subEconomic")
            break
        case "Recommended":
            self.imgBenefits.image = UIImage(named: "neighborhood")
            break
        case "Gold":
            self.imgBenefits.image = UIImage(named: "subBuildings")
            break
        case "Platinum":
            self.imgBenefits.image = UIImage(named: "subBuildings")
            break
        case "CustomPlan":
            self.viewBenefits.isHidden = true
            self.viewCustomPlan.isHidden = false
            break
        case .none:
            break
        case .some(_):
            break
        }
    }
    
    //MARK: - Action
    
    @IBAction func onClickBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func onClickSubmitRequest(_ sender: Any) {
        if Utility.shared.isConnectedToNetwork(){
            self.view.endEditing(true)
            if(txtFullName.isEmpty())
            {
                self.view.makeToast("Please Enter Full Name")
            }else if(txtEmail.isEmpty() || !txtEmail.isValidEmail())
            {
                self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"enterAddress")) ?? "Please Enter Address")")
            }else if(txtPhoneNumber.isEmpty())
            {
                self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"enterMobileNo")) ?? "Please Enter Mobile")")
            }else if(txtNoOfUnitsList.isEmpty())
            {
                self.view.makeToast("Please Enter No of Units you want to list")
            }else{
                self.apiCallCreateCustomPlanRequest()
            }
        }
    }
    
    //MARK: - API CALL
    func getPlanDetailsAPICall(){
        let getPlanDetailsQuery = PTProAPI.GetPlanDetailsQuery(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""))
        Network.shared.apollo_headerClient.fetch(query: getPlanDetailsQuery, cachePolicy: .fetchIgnoringCacheData) { response in
            switch response{
            case .success(let result):
                if let data = result.data?.getPlanDetails?.status,data == 200 {
                    if let list =  result.data?.getPlanDetails, let results = list.results{
                        let arrSorted = (results as! [PTProAPI.GetPlanDetailsQuery.Data.GetPlanDetails.Result]).sorted { $0.id ?? 0 < $1.id ?? 0 }
                        self.arrPlans = arrSorted
                        if self.arrPlans.count > 0{
                            self.updateBenifitData(indexPath: 0)
                        }
                    }else{
                        self.arrPlans.removeAll()
                    }
                    self.cvSubscriptionPlans.reloadData()
                } else {
                    self.view.makeToast(result.data?.getPlanDetails?.errorMessage)
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
                break
            }
        }
    }
    
    func apiCallCreateCustomPlanRequest(){
        //    let createCustomPlanRequest = PTProAPI.apiCallCreateCustomPlanRequest() (userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""), payeeName: .some(txtPayeeName.text!), address: .some("\(txtAddressLine1.text!)") ,address2: .some("\(txtAddressLine2.text!)") , city: .some(txtCity.text!), state: .some(txtState.text!), zipcode: .some(Int(txtZipCode.text!) ?? 0), countryCode: .some(91) , country: .some(txtCountry.text!), phoneNumber: .some(txtPhoneNumber.text))
        //    Network.shared.apollo_headerClient.perform(mutation: createAffiliateUserAccountInfo){  response in
        //        switch response {
        //        case .success(let result):
        //            if let data = result.data?.createAffiliateUserAccountInfo?.status,data == 200 {
        //                self.view.makeToast("success")
        //                if let parent =  self.parent as? AffiliateRegistration{
        //                    parent.showWebsiteview()
        //                }
        //            } else {
        //                self.view.makeToast(result.data?.createAffiliateUserAccountInfo?.errorMessage)
        //            }
        //        case .failure(let error):
        //            self.view.makeToast(error.localizedDescription)
        //        }
        //    }
    }
    
}

extension ViewSubscriptionsVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrPlans.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubscriptionPlansCVC", for: indexPath) as! SubscriptionPlansCVC
        cell.lblTitle.text = arrPlans[indexPath.row].title
        
        cell.btnSegment.setTitle("\(currencysymbol)\(arrPlans[indexPath.row].monthly ?? 0)/Monthly", forSegmentAt: 0)
        cell.btnSegment.setTitle("\(currencysymbol)\(arrPlans[indexPath.row].yearly ?? 0)/Yearly", forSegmentAt: 1)
        cell.btnSegment.layer.cornerRadius = 0.0
        cell.btnSegment.cornerRadius = 0.0
        cell.viewSegment.cornerRadius = 0.0
        cell.btnListNow.setTitle("", for: .normal)
        cell.lblCustomPlan.text = ""
        
        cell.btnSegment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        cell.btnSegment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        
        switch arrPlans[indexPath.row].title{
        case "Economy":
            cell.viewSegment.isHidden = false
            cell.viewListNow.isHidden = false
            cell.lblMemberShipCard.text = "MEMBERSHIP CARD"
            
            cell.mainView.backgroundColor = Theme.subEconomyColor
            cell.lblTitle.textColor = Theme.subEconomyColor
            cell.btnSegment.borderColor = Theme.subEconomySegmentBorderColor
            cell.btnSegment.tintColor = Theme.subSegmentBgColor
            cell.btnSegment.selectedSegmentTintColor = Theme.subEconomySegmentColor
            
            cell.imgSmallIcon.image = UIImage(named: "crownSmall")!.withTintColor(Theme.subEconomyColor)
            cell.imgBigIcon.image = UIImage(named: "crownBig")
            cell.imgSmallIcon.tintColor = Theme.subEconomyColor
            break
        case "Recommended":
            cell.viewSegment.isHidden = false
            cell.viewListNow.isHidden = false
            cell.lblMemberShipCard.text = "MEMBERSHIP CARD"
            
            cell.mainView.backgroundColor = Theme.subRecommendedColor
            cell.lblTitle.textColor = Theme.subRecommendedColor
            cell.btnSegment.borderColor = Theme.subRecommendedSegmentBorderColor
            cell.btnSegment.tintColor = Theme.subSegmentBgColor
            cell.btnSegment.selectedSegmentTintColor = Theme.subRecommendedSegmentColor
            
            cell.imgSmallIcon.image = UIImage(named: "subDiamondSmall")!.withTintColor(Theme.subRecommendedColor)
            cell.imgBigIcon.image = UIImage(named: "subDiamondBig")
            break
        case "Gold":
            cell.viewSegment.isHidden = false
            cell.viewListNow.isHidden = false
            cell.lblMemberShipCard.text = "MEMBERSHIP CARD"
            
            cell.mainView.backgroundColor = Theme.subGoldColor
            cell.lblTitle.textColor = Theme.subGoldColor
            cell.btnSegment.borderColor = Theme.subGoldSegmentBorderColor
            cell.btnSegment.tintColor = Theme.subSegmentBgColor
            cell.btnSegment.selectedSegmentTintColor = Theme.subGoldSegmentColor
            
            cell.imgSmallIcon.image = UIImage(named: "crownSmall")!.withTintColor(Theme.subGoldColor)
            cell.imgBigIcon.image = UIImage(named: "")
            break
        case "Platinum":
            cell.viewSegment.isHidden = false
            cell.viewListNow.isHidden = false
            cell.lblMemberShipCard.text = "MEMBERSHIP CARD"
            
            cell.mainView.backgroundColor = Theme.subPlatinumColor
            cell.lblTitle.textColor = Theme.subPlatinumColor
            cell.btnSegment.borderColor = Theme.subPlatinumSegmentBorderColor
            cell.btnSegment.tintColor = Theme.subSegmentBgColor
            cell.btnSegment.selectedSegmentTintColor = Theme.subPlatinumSegmentColor
            
            cell.imgSmallIcon.image = UIImage(named: "crownSmall")!.withTintColor(Theme.subPlatinumColor)
            cell.imgBigIcon.image = UIImage(named: "crownBig")
            break
        case "CustomPlan":
            cell.viewSegment.isHidden = true
            cell.viewListNow.isHidden = true
            cell.lblMemberShipCard.text = ""
            cell.lblCustomPlan.text = "Custom Plan"
            
            cell.mainView.backgroundColor = Theme.subCustomColor
            cell.lblTitle.textColor = Theme.subCustomColor
            cell.imgSmallIcon.tintColor = Theme.subCustomColor
            
            cell.imgSmallIcon.image = UIImage(named: "crownSmall")?.withTintColor(Theme.subCustomColor)
            cell.imgBigIcon.image = UIImage(named: "crownBig")
            break
        case .none:
            break
        case .some(_):
            break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.isDragging || collectionView.isDecelerating || collectionView.isTracking {
            return
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: cvSubscriptionPlans.contentOffset, size: cvSubscriptionPlans.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if  let indexPath = cvSubscriptionPlans.indexPathForItem(at: visiblePoint){
            
            UIView.animate(withDuration: 1.5) {
                self.lbl1.alpha = 0.0
                self.lbl2.alpha = 0.0
                self.lbl3.alpha = 0.0
                self.lbl4.alpha = 0.0
                self.lbl5.alpha = 0.0
                self.lbl6.alpha = 0.0
                
                self.viewBenefits.isHidden = false
                self.viewCustomPlan.isHidden = true
                
                switch self.arrPlans[indexPath.row].title{
                case "Economy":
                    self.imgBenefits.image = UIImage(named: "subEconomic")
                    break
                case "Recommended":
                    self.imgBenefits.image = UIImage(named: "neighborhood")
                    break
                case "Gold":
                    self.imgBenefits.image = UIImage(named: "subBuildings")
                    break
                case "Platinum":
                    self.imgBenefits.image = UIImage(named: "subBuildings")
                    break
                case "CustomPlan":
                    self.viewBenefits.isHidden = true
                    self.viewCustomPlan.isHidden = false
                    break
                case .none:
                    break
                case .some(_):
                    break
                }
                
                self.lbl1.text = self.arrPlans[indexPath.row].one
                self.lbl2.text = self.arrPlans[indexPath.row].two
                self.lbl3.text = self.arrPlans[indexPath.row].three
                self.lbl4.text = self.arrPlans[indexPath.row].four
                self.lbl5.text = self.arrPlans[indexPath.row].five
                self.lbl6.text = self.arrPlans[indexPath.row].six
                
                self.lbl1.alpha = 1.0
                self.lbl2.alpha = 1.0
                self.lbl3.alpha = 1.0
                self.lbl4.alpha = 1.0
                self.lbl5.alpha = 1.0
                self.lbl6.alpha = 1.0
            }
        }
    }
}


extension UIView {
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
