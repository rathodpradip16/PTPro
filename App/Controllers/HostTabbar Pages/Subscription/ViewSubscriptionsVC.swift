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
    @IBOutlet weak var txtEmail: CustomUITextField!

    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var txtCountry: CustomUITextField!

    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var txtPhoneNumber: NKVPhonePickerTextField!

    @IBOutlet weak var lblNoOfUnitsList: UILabel!
    @IBOutlet weak var txtNoOfUnitsList: CustomUITextField!
    
    @IBOutlet weak var btnSubmitRequest: UIButton!
    
    @IBOutlet weak var mainViewHeight: NSLayoutConstraint!

    var arrPlans = [PTProAPI.GetPlanDetailsQuery.Data.GetPlanDetails.Result]()
    var currencysymbol = ""
    var isYearlySelected = false
    
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
        mainViewHeight.constant = 250  //* 0.35
        // Configure the required item size (REQURED)
        centerFlowLayout.itemSize = CGSize(
            width: view.bounds.width * 0.9,
            height: 250)
        
        centerFlowLayout.animationMode = YZCenterFlowLayoutAnimation.scale(sideItemScale: 0.6, sideItemAlpha: 0.6, sideItemShift: 0.0)
                
        view1.layer.masksToBounds = false
        view1.layer.shadowColor = CGColor(gray: 0.2, alpha: 1.0)
        view1.layer.shadowOpacity = 0.5
        view1.layer.shadowOffset = CGSize(width: 0, height: 0)
        view1.layer.shadowRadius = 2.0
        
        view2.layer.masksToBounds = false
        view2.layer.shadowColor = CGColor(gray: 0.2, alpha: 1.0)
        view2.layer.shadowOpacity = 0.5
        view2.layer.shadowOffset = CGSize(width: 0, height: 0)
        view2.layer.shadowRadius = 2.0

        view3.layer.masksToBounds = false
        view3.layer.shadowColor = CGColor(gray: 0.2, alpha: 1.0)
        view3.layer.shadowOpacity = 0.5
        view3.layer.shadowOffset = CGSize(width: 0, height: 0)
        view3.layer.shadowRadius = 2.0

        view4.layer.masksToBounds = false
        view4.layer.shadowColor = CGColor(gray: 0.2, alpha: 1.0)
        view4.layer.shadowOpacity = 0.5
        view4.layer.shadowOffset = CGSize(width: 0, height: 0)
        view4.layer.shadowRadius = 2.0

        view5.layer.masksToBounds = false
        view5.layer.shadowColor = CGColor(gray: 0.2, alpha: 1.0)
        view5.layer.shadowOpacity = 0.5
        view5.layer.shadowOffset = CGSize(width: 0, height: 0)
        view5.layer.shadowRadius = 2.0
        
        view6.layer.masksToBounds = false
        view6.layer.shadowColor = CGColor(gray: 0.2, alpha: 1.0)
        view6.layer.shadowOpacity = 0.5
        view6.layer.shadowOffset = CGSize(width: 0, height: 0)
        view6.layer.shadowRadius = 2.0
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
            }else if(txtEmail.isEmpty())
            {
                self.view.makeToast("Please Enter Email Address")
            }else if(!txtEmail.isValidEmail())
            {
                self.view.makeToast("Please Enter Valid Email Address")
            }else if(txtCountry.isEmpty())
            {
                self.view.makeToast("Please Enter country")
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
    
    //MARK: - CountriesViewControllerDelegate
    func countriesViewControllerDidCancel(_ sender: NKVPhonePicker.CountriesViewController) {
        
    }
    
    func countriesViewController(_ sender: NKVPhonePicker.CountriesViewController, didSelectCountry country: NKVPhonePicker.Country) {
        
    }
    
    //MARK: - API CALL
    func getPlanDetailsAPICall(){
        let getPlanDetailsQuery = PTProAPI.GetPlanDetailsQuery(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""))
        Network.shared.apollo_headerClient.fetch(query: getPlanDetailsQuery, cachePolicy: .fetchIgnoringCacheData) { response in
            switch response{
            case .success(let result):
                if let data = result.data?.getPlanDetails?.status,data == 200 {
                    if let list =  result.data?.getPlanDetails, let results = list.results{
//                        let arrSorted = (results as! [PTProAPI.GetPlanDetailsQuery.Data.GetPlanDetails.Result]).sorted { $0.id ?? 0 < $1.id ?? 0 }
                        self.arrPlans = results as! [PTProAPI.GetPlanDetailsQuery.Data.GetPlanDetails.Result]
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
        let createCustomPlanRequest = PTProAPI.CreateCustomPlanRequestMutation(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""), name: .some(txtFullName.text!), email: .some(txtEmail.text!), country: .some(txtCountry.text ?? txtPhoneNumber.country?.countryCode ?? ""), number: .some(txtPhoneNumber.text!) , no_Of_units_list:.some(txtNoOfUnitsList.text!))
        Network.shared.apollo_headerClient.perform(mutation: createCustomPlanRequest){  response in
            switch response {
            case .success(let result):
                if let data = result.data?.createCustomPlanRequest?.status,data == 200 {
                    self.view.makeToast(result.data?.createCustomPlanRequest?.message)
                    self.txtFullName.text = ""
                    self.txtEmail.text = ""
                    self.txtCountry.text = ""
                    self.txtPhoneNumber.text = ""
                    self.txtNoOfUnitsList.text = ""
                } else {
                    self.view.makeToast(result.data?.createCustomPlanRequest?.message)
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
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
        //cell.viewSegment.backgroundColor =
        cell.btnListNow.setTitle("", for: .normal)
        cell.btnListNow.tag = indexPath.row
        cell.btnListNow.addTarget(self, action: #selector(onClickListNow(sender:)), for: .touchUpInside)
        cell.lblCustomPlan.text = ""
        
        cell.btnSegment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        cell.btnSegment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
//        cell.btnSegment.backgroundColor = Theme.subSegmentBgColor

        cell.btnSegment.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        switch arrPlans[indexPath.row].title ?? ""{
        case "Economy":
            cell.lblMemberShipCard.text = "MEMBERSHIP CARD"
            
            cell.mainView.backgroundColor = Theme.subEconomyColor
            cell.lblTitle.textColor = Theme.subEconomyColor
            cell.btnSegment.borderColor = Theme.subEconomySegmentBorderColor
         //   cell.btnSegment.tintColor = Theme.subSegmentBgColor
            cell.btnSegment.selectedSegmentTintColor = Theme.subEconomySegmentColor
            
            cell.imgSmallIcon.image = UIImage(named: "crownSmall")!.withTintColor(Theme.subEconomyColor)
            cell.imgBigIcon.image = UIImage(named: "crownBig")
            cell.imgSmallIcon.tintColor = Theme.subEconomyColor
            break
        case "Recommended":
            cell.lblMemberShipCard.text = "MEMBERSHIP CARD"
            
            cell.mainView.backgroundColor = Theme.subRecommendedColor
            cell.lblTitle.textColor = Theme.subRecommendedColor
            cell.btnSegment.borderColor = Theme.subRecommendedSegmentBorderColor
         //   cell.btnSegment.tintColor = Theme.subSegmentBgColor
            cell.btnSegment.selectedSegmentTintColor = Theme.subRecommendedSegmentColor
            
            cell.imgSmallIcon.image = UIImage(named: "subDiamondSmall")!.withTintColor(Theme.subRecommendedColor)
            cell.imgBigIcon.image = UIImage(named: "subDiamondBig")
            break
        case "Gold":
            cell.lblMemberShipCard.text = "MEMBERSHIP CARD"
            
            cell.mainView.backgroundColor = Theme.subGoldColor
            cell.lblTitle.textColor = Theme.subGoldColor
            cell.btnSegment.borderColor = Theme.subGoldSegmentBorderColor
          //  cell.btnSegment.tintColor = Theme.subSegmentBgColor
            cell.btnSegment.selectedSegmentTintColor = Theme.subGoldSegmentColor
            
            cell.imgSmallIcon.image = UIImage(named: "crownSmall")!.withTintColor(Theme.subGoldColor)
            cell.imgBigIcon.image = UIImage(named: "")
            break
        case "Platinum":
            cell.lblMemberShipCard.text = "MEMBERSHIP CARD"
            
            cell.mainView.backgroundColor = Theme.subPlatinumColor
            cell.lblTitle.textColor = Theme.subPlatinumColor
            cell.btnSegment.borderColor = Theme.subPlatinumSegmentBorderColor
      //      cell.btnSegment.tintColor = Theme.subSegmentBgColor
            cell.btnSegment.selectedSegmentTintColor = Theme.subPlatinumSegmentColor
            
            cell.imgSmallIcon.image = UIImage(named: "crownSmall")!.withTintColor(Theme.subPlatinumColor)
            cell.imgBigIcon.image = UIImage(named: "crownBig")
            break
        case "CustomPlan":
            cell.lblActiveSub.text = ""
            cell.lblExpDate.text = ""
            cell.viewSegment.isHidden = true
            cell.viewListNow.isHidden = true
            cell.lblMemberShipCard.text = ""
            cell.lblCustomPlan.text = "Custom Plan"
            cell.lblTitle.text = "Custom"
            
            cell.mainView.backgroundColor = Theme.subCustomColor
            cell.lblTitle.textColor = Theme.subCustomTitleColor
            cell.imgSmallIcon.tintColor = Theme.subCustomTitleColor
            cell.imgBigIcon.tintColor = Theme.subCustomTitleColor

            cell.imgSmallIcon.image = UIImage(named: "crownSmall")?.withTintColor(Theme.subCustomTitleColor)
            cell.imgBigIcon.image = UIImage(named: "crownBig")
            break
        default:
            break
        }
        print("arrPlans[indexPath.row].title = \(arrPlans[indexPath.row].title ?? "")")
        print("arrPlans[indexPath.row].expiryDate = \(arrPlans[indexPath.row].expiryDate ?? "")")

        if let strTitle = arrPlans[indexPath.row].title,strTitle == "CustomPlan"{
            cell.viewSegment.isHidden = true
            cell.viewListNow.isHidden = true
            cell.lblExpDate.text = ""
            cell.lblActiveSub.text = ""
        }else if let intStatus = arrPlans[indexPath.row].status,intStatus == 1{
            cell.imgBigIcon.image = UIImage(named: "")
            cell.viewSegment.isHidden = true
            cell.viewListNow.isHidden = true
            cell.lblActiveSub.text = "✓ You're currently our member"
            if let strDate = arrPlans[indexPath.row].expiryDate?.components(separatedBy: ","),strDate.count != 0{
                cell.lblExpDate.text = "Exp:\(strDate[0])"
            }else{
                cell.lblExpDate.text = arrPlans[indexPath.row].expiryDate
            }
        }else{
            cell.viewSegment.isHidden = false
            cell.viewListNow.isHidden = false
            cell.lblExpDate.text = ""
            cell.lblActiveSub.text = ""
        }
        
        return cell
    }
    
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            isYearlySelected = false
        }else{
            isYearlySelected = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.isDragging || collectionView.isDecelerating || collectionView.isTracking {
            return
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
    @objc func onClickListNow(sender:UIButton){
        let paymentSelectionPage = PaymentSelectionPage()
        paymentSelectionPage.selectedPlanDetail = self.arrPlans[sender.tag]
        paymentSelectionPage.isFromSubscriptionPage = true
        paymentSelectionPage.isYearlySelected = isYearlySelected
        paymentSelectionPage.modalPresentationStyle = .fullScreen
        self.present(paymentSelectionPage, animated: true, completion: nil)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: cvSubscriptionPlans.contentOffset, size: cvSubscriptionPlans.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if  let indexPath = cvSubscriptionPlans.indexPathForItem(at: visiblePoint){
            
            UIView.animate(withDuration: 2.0) {
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
