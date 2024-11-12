//
//  ViewSubscriptionsVC.swift
//  App
//
//  Created by Phycom Mac Pro on 02/11/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit
import NKVPhonePicker
import IQKeyboardManagerSwift
import YRCoverFlowLayout

class ViewSubscriptionsVC: UIViewController, UITextFieldDelegate ,CountriesViewControllerDelegate{
    // MARK: Vars
    private var animationsCount = 0
    
//    var centerFlowLayout: YZCenterFlowLayout {
//        return cvSubscriptionPlans.collectionViewLayout as! YZCenterFlowLayout
//    }
    
    var scrollToEdgeEnabled: Bool = true
    
    @IBOutlet weak var tblProperties: UITableView!

    @IBOutlet weak var coverFlowLayout: YRCoverFlowLayout!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var cvSubscriptionPlans: UICollectionView!
    
    
    @IBOutlet weak var viewBenefits: UIView!
    @IBOutlet weak var imgBenefits: UIImageView!
    @IBOutlet weak var lblBenefits: UILabel!
    

    
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

    var arrPlans = [PTProAPI.GetPlanDetailQuery.Data.GetPlanDetails.Result]()
    var currencysymbol = ""
    var isYearlySelected = false
    var arrBenifits = [SubBenifits]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.coverFlowLayout.coverDensity = 0.07
        self.coverFlowLayout.minCoverOpacity = 0.5
        self.coverFlowLayout.minCoverScale = 0.7

        self.viewCustomPlan.isHidden = true
        self.viewBenefits.isHidden = false
        self.configureCollectionView()
        currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!) ?? ""
        self.getPlanDetailsAPICall()
        txtPhoneNumber.phonePickerDelegate = self
        txtPhoneNumber.countryPickerDelegate = self
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
    }
    
    private func configureCollectionView() {
        mainViewHeight.constant = 250  //* 0.35
        // Configure the required item size (REQURED)
//        centerFlowLayout.itemSize = CGSize(
//            width: view.bounds.width * 0.9,
//            height: 250)
//        
//        centerFlowLayout.animationMode = YZCenterFlowLayoutAnimation.scale(sideItemScale: 0.6, sideItemAlpha: 0.6, sideItemShift: 0.0)
    }
    
    func updateBenifitData(indexPath:Int){
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
        
        self.arrBenifits.removeAll()
        if let one = self.arrPlans[indexPath].one,let oneTitle = self.arrPlans[indexPath].onetitle{
            self.arrBenifits.append(SubBenifits(title: oneTitle, desc: one , img: self.getSubImageFromTitle(strTitle:oneTitle)))
        }
        
        if let two = self.arrPlans[indexPath].two,let twoTitle = self.arrPlans[indexPath].twotitle{
            self.arrBenifits.append(SubBenifits(title: twoTitle, desc: two , img: self.getSubImageFromTitle(strTitle:twoTitle)))
        }
        
        if let three = self.arrPlans[indexPath].three,let threetitle = self.arrPlans[indexPath].threetitle{
            self.arrBenifits.append(SubBenifits(title: threetitle, desc: three , img: self.getSubImageFromTitle(strTitle:threetitle)))
        }
        
        if let four = self.arrPlans[indexPath].four,let fourtitle = self.arrPlans[indexPath].fourtitle{
            self.arrBenifits.append(SubBenifits(title: fourtitle, desc: four , img: self.getSubImageFromTitle(strTitle:fourtitle)))
        }
        
        if let five = self.arrPlans[indexPath].five,let fivetitle = self.arrPlans[indexPath].fivetitle{
            self.arrBenifits.append(SubBenifits(title: fivetitle, desc: five , img: self.getSubImageFromTitle(strTitle:fivetitle)))
        }
        
        if let six = self.arrPlans[indexPath].six,let sixtitle = self.arrPlans[indexPath].sixtitle{
            self.arrBenifits.append(SubBenifits(title: sixtitle, desc: six , img: self.getSubImageFromTitle(strTitle:sixtitle)))
        }
        
        if let seven = self.arrPlans[indexPath].seven,let seventitle = self.arrPlans[indexPath].seventitle{
            self.arrBenifits.append(SubBenifits(title: seventitle, desc: seven , img: self.getSubImageFromTitle(strTitle:seventitle)))
        }
        
        if let eight = self.arrPlans[indexPath].eight,let eighttitle = self.arrPlans[indexPath].eighttitle{
            self.arrBenifits.append(SubBenifits(title: eighttitle, desc: eight , img: self.getSubImageFromTitle(strTitle:eighttitle)))
        }
        self.tblProperties.reloadData()
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
        let getPlanDetailsQuery = PTProAPI.GetPlanDetailQuery(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""))
        Network.shared.apollo_headerClient.fetch(query: getPlanDetailsQuery, cachePolicy: .fetchIgnoringCacheData) { response in
            switch response{
            case .success(let result):
                if let data = result.data?.getPlanDetails?.status,data == 200 {
                    if let list =  result.data?.getPlanDetails, let results = list.results{
//                        let arrSorted = (results as! [PTProAPI.GetPlanDetailsQuery.Data.GetPlanDetails.Result]).sorted { $0.id ?? 0 < $1.id ?? 0 }
                        self.arrPlans = results as! [PTProAPI.GetPlanDetailQuery.Data.GetPlanDetails.Result]
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
    
    func getCancelPlanAPICall(){
        let getCancelmembershipQuery = PTProAPI.CancelmembershipQuery(userId: Utility.shared.ProfileAPIArray?.userId ?? "")
        Network.shared.apollo_headerClient.fetch(query: getCancelmembershipQuery, cachePolicy: .fetchIgnoringCacheData) { response in
            switch response{
            case .success(let result):
                if let data = result.data?.cancelmembership?.status,data == 200 {
                    self.getPlanDetailsAPICall()
                    self.view.makeToast(result.data?.cancelmembership?.errorMessage)
                } else {
                    self.view.makeToast(result.data?.cancelmembership?.errorMessage)
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
        cell.lblListNow.text = "List Now"
        cell.btnSegment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        cell.btnSegment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
//        cell.btnSegment.backgroundColor = Theme.subSegmentBgColor

        cell.btnSegment.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
    
        cell.btnStartHere.setTitle("", for: .normal)
        cell.btnStartHere.addTarget(self, action: #selector(onClickStartHere(sender:)), for: .touchUpInside)
        cell.viewStartHere.isHidden = true
        cell.imgDownArrow.isHidden = true

                // Example: Apply a different gradient to each cell
        let strTitle = (arrPlans[indexPath.row].title ?? "").trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        let colors: [UIColor] = generateGradientColors(for: strTitle)
        cell.configureGradient(with: colors)

        switch arrPlans[indexPath.row].title ?? ""{
        case "Economy":
            cell.lblMemberShipCard.text = "MEMBERSHIP CARD"
            
         //   cell.mainView.backgroundColor = Theme.subEconomyColor
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
            
       //     cell.mainView.backgroundColor = Theme.subRecommendedColor
            cell.lblTitle.textColor = Theme.subRecommendedColor
            cell.btnSegment.borderColor = Theme.subRecommendedSegmentBorderColor
         //   cell.btnSegment.tintColor = Theme.subSegmentBgColor
            cell.btnSegment.selectedSegmentTintColor = Theme.subRecommendedSegmentColor
            
            cell.imgSmallIcon.image = UIImage(named: "subDiamondSmall")!.withTintColor(Theme.subRecommendedColor)
            cell.imgBigIcon.image = UIImage(named: "subDiamondBig")
            break
        case "Gold":
            cell.lblMemberShipCard.text = "MEMBERSHIP CARD"
            
         //   cell.mainView.backgroundColor = Theme.subGoldColor
            cell.lblTitle.textColor = Theme.subGoldColor
            cell.btnSegment.borderColor = Theme.subGoldSegmentBorderColor
          //  cell.btnSegment.tintColor = Theme.subSegmentBgColor
            cell.btnSegment.selectedSegmentTintColor = Theme.subGoldSegmentColor
            
            cell.imgSmallIcon.image = UIImage(named: "crownSmall")!.withTintColor(Theme.subGoldColor)
            cell.imgBigIcon.image = UIImage(named: "")
            break
        case "Platinum":
            cell.lblMemberShipCard.text = "MEMBERSHIP CARD"
            
        //    cell.mainView.backgroundColor = Theme.subPlatinumColor
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
            
         //   cell.mainView.backgroundColor = Theme.subCustomColor
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
            cell.viewStartHere.isHidden = false
            cell.imgDownArrow.isHidden = false
            cell.imgBigIcon.image = UIImage(named: "")
            cell.viewSegment.isHidden = true
            cell.viewListNow.isHidden = false
            cell.lblListNow.text = "Upgrade"
            cell.lblActiveSub.text = "✓ You're currently our member"
            if let strDate = arrPlans[indexPath.row].expiryDate?.components(separatedBy: ","),strDate.count != 0,strDate[0].trimmingCharacters(in: .whitespaces) != ""{
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
        if let strTitle = arrPlans[indexPath.row].title,strTitle != "CustomPlan",let intStatus = arrPlans[indexPath.row].status,intStatus == 1{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let orderSummaryVC = storyboard.instantiateViewController(withIdentifier: "OrderSummaryVC") as! OrderSummaryVC
            orderSummaryVC.selectedPlan =  arrPlans[indexPath.row].title ?? ""
            orderSummaryVC.selectedPaymentType = 0
            orderSummaryVC.isFromPayment = false
            orderSummaryVC.modalPresentationStyle = .fullScreen
            self.present(orderSummaryVC, animated: true, completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }

    @objc func onClickStartHere(sender:UIButton){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        Utility.shared.setopenTabbar(iswhichtabbar: true)
        appDelegate.addingElementsToObjects()
        self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
        Utility.shared.setHostTab(index: 0)
        appDelegate.HostTabbarInitialize(initialView: CustomHostTabbar())
    }
    
    func generateGradientColors(for strTitle: String) -> [UIColor] {
        switch strTitle{
        case "bronze":
            return [Theme.subBronzeGradiantStartColor,Theme.subBronzeGradiantCenterColor,Theme.subBronzeGradiantEndColor]
        case "gold":
            return [Theme.subGoldGradiantStartColor,Theme.subGoldGradiantCenterColor,Theme.subGoldGradiantEndColor]
        case "platinum":
            return [Theme.subPlatinumGradiantStartColor,Theme.subPlatinumGradiantCenterColor,Theme.subPlatinumGradiantEndColor]
        case "silver":
            return [Theme.subSilverGradiantStartColor,Theme.subSilverGradiantCenterColor,Theme.subSilverGradiantEndColor]
        case "pay per booking":
            return [Theme.subPPBGradiantStartColor,Theme.subPPBGradiantEndColor]
        default:
            return [Theme.subRedGradiantStartColor,Theme.subRedGradiantCenterColor,Theme.subRedGradiantEndColor]
        }
     }
    
    
    @objc func onClickListNow(sender:UIButton){
        if let intStatus = arrPlans[sender.tag].status,intStatus == 1{
            let alert = UIAlertController(title: "Chose an Option", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Upgrade", style: .default, handler: { action in
                let paymentSelectionPage = PaymentSelectionPage()
                paymentSelectionPage.selectedPlanDetail = self.arrPlans[sender.tag]
                paymentSelectionPage.isFromSubscriptionPage = true
                paymentSelectionPage.isYearlySelected = (self.arrPlans[sender.tag].planType == "monthly") ? true : false
                paymentSelectionPage.modalPresentationStyle = .fullScreen
                self.present(paymentSelectionPage, animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "Renew", style: .default, handler: { action in
                let paymentSelectionPage = PaymentSelectionPage()
                paymentSelectionPage.selectedPlanDetail = self.arrPlans[sender.tag]
                paymentSelectionPage.isFromSubscriptionPage = true
                paymentSelectionPage.isYearlySelected = (self.arrPlans[sender.tag].planType == "monthly") ? false : true
                paymentSelectionPage.modalPresentationStyle = .fullScreen
                self.present(paymentSelectionPage, animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "Cancel Membership", style: .default, handler: { action in
                self.confirmCancelPlan()
            }))
            alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: { action in
                
            }))
            self.present(alert, animated: true, completion: nil)
        }else{
            let paymentSelectionPage = PaymentSelectionPage()
            paymentSelectionPage.selectedPlanDetail = self.arrPlans[sender.tag]
            paymentSelectionPage.isFromSubscriptionPage = true
            paymentSelectionPage.isYearlySelected = isYearlySelected
            paymentSelectionPage.modalPresentationStyle = .fullScreen
            self.present(paymentSelectionPage, animated: true, completion: nil)
        }
    }
    
    func confirmCancelPlan(){
            let alert = UIAlertController(title: "Are you sure you want to cancel it?", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                self.getCancelPlanAPICall()
            }))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { action in
                
            }))
            self.present(alert, animated: true, completion: nil)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: cvSubscriptionPlans.contentOffset, size: cvSubscriptionPlans.bounds.size)
        self.view.endEditing(true)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if  let indexPath = cvSubscriptionPlans.indexPathForItem(at: visiblePoint){
            
            UIView.animate(withDuration: 2.0) {
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
                
                self.arrBenifits.removeAll()
                if let one = self.arrPlans[indexPath.row].one,let oneTitle = self.arrPlans[indexPath.row].onetitle{
                    self.arrBenifits.append(SubBenifits(title: oneTitle, desc: one , img: self.getSubImageFromTitle(strTitle:oneTitle)))
                }
                
                if let two = self.arrPlans[indexPath.row].two,let twoTitle = self.arrPlans[indexPath.row].twotitle{
                    self.arrBenifits.append(SubBenifits(title: twoTitle, desc: two , img: self.getSubImageFromTitle(strTitle:twoTitle)))
                }
                
                if let three = self.arrPlans[indexPath.row].three,let threetitle = self.arrPlans[indexPath.row].threetitle{
                    self.arrBenifits.append(SubBenifits(title: threetitle, desc: three , img: self.getSubImageFromTitle(strTitle:threetitle)))
                }
                
                if let four = self.arrPlans[indexPath.row].four,let fourtitle = self.arrPlans[indexPath.row].fourtitle{
                    self.arrBenifits.append(SubBenifits(title: fourtitle, desc: four , img: self.getSubImageFromTitle(strTitle:fourtitle)))
                }
                
                if let five = self.arrPlans[indexPath.row].five,let fivetitle = self.arrPlans[indexPath.row].fivetitle{
                    self.arrBenifits.append(SubBenifits(title: fivetitle, desc: five , img: self.getSubImageFromTitle(strTitle:fivetitle)))
                }
                
                if let six = self.arrPlans[indexPath.row].six,let sixtitle = self.arrPlans[indexPath.row].sixtitle{
                    self.arrBenifits.append(SubBenifits(title: sixtitle, desc: six , img: self.getSubImageFromTitle(strTitle:sixtitle)))
                }
                
                if let seven = self.arrPlans[indexPath.row].seven,let seventitle = self.arrPlans[indexPath.row].seventitle{
                    self.arrBenifits.append(SubBenifits(title: seventitle, desc: seven , img: self.getSubImageFromTitle(strTitle:seventitle)))
                }
                
                if let eight = self.arrPlans[indexPath.row].eight,let eighttitle = self.arrPlans[indexPath.row].eighttitle{
                    self.arrBenifits.append(SubBenifits(title: eighttitle, desc: eight , img: self.getSubImageFromTitle(strTitle:eighttitle)))
                }
                self.tblProperties.reloadData()
            }
        }
    }
    
    func getSubImageFromTitle(strTitle:String) -> String{
        let title = strTitle.lowercased().trimmingCharacters(in: .whitespaces)
        switch title{
        case "chat":
            return PTImages.subChat
        case "unlimited":
            return PTImages.subUnlimited
        case "seo":
            return PTImages.subSeo
        case "price prediction":
            return PTImages.subPricePredicition
        case "search rank":
            return PTImages.subSerachRank
        case "insights":
            return PTImages.subInsights
        case "global visibility":
            return PTImages.subGlobalVisibility
        case "affiliate":
            return PTImages.subAffiliate
        default:
            return PTImages.subChat
        }
    }
}

extension ViewSubscriptionsVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrBenifits.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubcriptionPropertiesTVC", for: indexPath)as! SubcriptionPropertiesTVC
        cell.imgIcon.image = UIImage(named: arrBenifits[indexPath.row].Img)
        cell.lblTitle.text = arrBenifits[indexPath.row].Title
        cell.lblDesc.text = arrBenifits[indexPath.row].Desc
        return cell
    }
    
}

