//
//  AffiliateRegistrationWebsite.swift
//  App
//
//  Created by Phycom Mac Pro on 13/09/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit
import GrowingTextView

class AffiliateRegistrationWebsite: UIViewController,UITextFieldDelegate{
    //MARK: - variable initialization
    @IBOutlet weak var lblNameOfYourWebsite: UILabel!
    @IBOutlet weak var lblURLYouWillSendTheTraffic: UILabel!
    @IBOutlet weak var lblWhatIsYourWebsiteAccount: UILabel!
    @IBOutlet weak var lblwhatTypeOfItemsDoYouWantToList: UILabel!
    @IBOutlet weak var lblHowDoYouDriveTrafficToYourWebsite: UILabel!
    @IBOutlet weak var lblWhatTypeOfSiteIsYourWebsite: UILabel!
    @IBOutlet weak var lblPrimaryReasonForJoining: UILabel!
    @IBOutlet weak var lblHowManyVisitorsShouldYourWebsiteGet: UILabel!
    @IBOutlet weak var lblHowDoYouUsuallyBuildLinks: UILabel!
    @IBOutlet weak var lblHowElseDoYouMonetize: UILabel!
    
    
    @IBOutlet weak var txtNameOfYourWebsite: CustomUITextField!
    @IBOutlet weak var txtURLYouWillSendTheTraffic: CustomUITextField!
    @IBOutlet weak var txtWhatIsYourWebsiteAccount: GrowingTextView!
    @IBOutlet weak var txtPrimaryReasonForJoining: GrowingTextView!
    @IBOutlet weak var txtHowManyVisitorsShouldYourWebsiteGet: CustomUITextField!
    @IBOutlet weak var txtHowDoYouUsuallyBuildLinks: GrowingTextView!
    @IBOutlet weak var txtHowElseDoYouMonetize: GrowingTextView!
    
    
    @IBOutlet weak var btnAmenities: UIButton!
    @IBOutlet weak var btnTravelEvents: UIButton!
    @IBOutlet weak var btnLorem: UIButton!
    
    @IBOutlet weak var btnECommerceWebsite: UIButton!
    @IBOutlet weak var btnBusinessWebsite: UIButton!
    @IBOutlet weak var btnBlogWebsite: UIButton!
    @IBOutlet weak var btnPortfolioWebsite: UIButton!
    @IBOutlet weak var btnEventWebsite: UIButton!
    @IBOutlet weak var btnPersonalWebsite: UIButton!
    @IBOutlet weak var btnMembershipWebsite: UIButton!
    @IBOutlet weak var btnNonprofitWebsite: UIButton!
    @IBOutlet weak var btnInformationalWebsite: UIButton!
    @IBOutlet weak var btnOnlineWebsite: UIButton!
    
    @IBOutlet weak var dropDownWhatTypeOfSiteIsYourWebsite: DropDown!
    
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnPrevious: UIButton!
    
    var dicSelectedTypeList : [String:Bool] = [appKeys.TravelProducts:false,
                                               appKeys.Other:false,
                                               appKeys.TravelEvents:false]
    var dicSelectedDriveWebSitelist : [String:Bool] = [appKeys.ECommerceWebsite:false,
                                                       appKeys.BusinessWebsite:false,
                                                       appKeys.BlogWebsite:false,
                                                       appKeys.PortfolioWebsite:false,
                                                       appKeys.EventWebsite:false,
                                                       appKeys.PersonalWebsite:false,
                                                       appKeys.MembershipWebsite:false,
                                                       appKeys.NonprofitWebsite:false,
                                                       appKeys.InformationalWebsite:false,
                                                       appKeys.OnlineForum:false]
    
    //MARK: - VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUserData()
        self.initializeBtnTitle()
        self.initializeLocalization()
        self.initializeBtnListData()
 
        // The list of array to display. Can be changed dynamically
        dropDownWhatTypeOfSiteIsYourWebsite.optionArray = [appKeys.ECommerceWebsite,
                                                           appKeys.BusinessWebsite,
                                                           appKeys.BlogWebsite,
                                                           appKeys.PortfolioWebsite,
                                                           appKeys.EventWebsite,
                                                           appKeys.PersonalWebsite,
                                                           appKeys.MembershipWebsite,
                                                           appKeys.NonprofitWebsite,
                                                           appKeys.InformationalWebsite,
                                                           appKeys.OnlineForum]
        dropDownWhatTypeOfSiteIsYourWebsite.rowHeight = 40
        dropDownWhatTypeOfSiteIsYourWebsite.listHeight = 200
        dropDownWhatTypeOfSiteIsYourWebsite.borderC = UIColor.lightGray
        dropDownWhatTypeOfSiteIsYourWebsite.didSelect{(selectedText , index ,id) in
            self.dropDownWhatTypeOfSiteIsYourWebsite.text = selectedText
        }
        dropDownWhatTypeOfSiteIsYourWebsite.delegate = self
    }
    
    //MARK: - custom Methods
    func initializeUserData(){
        if let stepDetails = Utility.shared.GetAffiliateUserStep?.stepDetails?.first{
            self.txtNameOfYourWebsite.text = stepDetails?.websiteName ?? ""
            self.txtURLYouWillSendTheTraffic.text = stepDetails?.websiteUrl ?? ""
            self.txtWhatIsYourWebsiteAccount.text = stepDetails?.websiteName ?? ""
            self.dropDownWhatTypeOfSiteIsYourWebsite.text = stepDetails?.typesOfWebsite ?? ""
            self.txtPrimaryReasonForJoining.text = stepDetails?.primryJoining ?? ""
            self.txtHowManyVisitorsShouldYourWebsiteGet.text = stepDetails?.websiteVisitors ?? ""
            self.txtHowDoYouUsuallyBuildLinks.text = stepDetails?.buildLinks ?? ""
            self.txtHowElseDoYouMonetize.text = stepDetails?.websiteMonitize ?? ""
            if let typeList = stepDetails?.typeList, let dic = convertToDictionary(text: typeList){
                self.dicSelectedTypeList = dic
            }
            if let websiteDrive = stepDetails?.websiteDrive , let dic = convertToDictionary(text: websiteDrive){
                self.dicSelectedDriveWebSitelist = dic
            }
        }
    }
    
    func initializeBtnListData(){
        btnAmenities.setImage(#imageLiteral(resourceName: dicSelectedTypeList[appKeys.TravelProducts] ?? false ? "checked" : "unchecked"), for: .normal)
        btnTravelEvents.setImage(#imageLiteral(resourceName: dicSelectedTypeList[ appKeys.TravelEvents ] ?? false ? "checked" : "unchecked"), for: .normal)
        btnLorem.setImage(#imageLiteral(resourceName: dicSelectedTypeList[appKeys.Other] ?? false ? "checked" : "unchecked"), for: .normal)
        
        btnECommerceWebsite.setImage(#imageLiteral(resourceName: dicSelectedDriveWebSitelist[btnECommerceWebsite.titleLabel!.text ?? ""] ?? false ? "checked" : "unchecked"), for: .normal)
        btnBusinessWebsite.setImage(#imageLiteral(resourceName: dicSelectedDriveWebSitelist[btnBusinessWebsite.titleLabel!.text ?? ""] ?? false ? "checked" : "unchecked"), for: .normal)
        btnBlogWebsite.setImage(#imageLiteral(resourceName: dicSelectedDriveWebSitelist[btnBlogWebsite.titleLabel!.text ?? ""] ?? false ? "checked" : "unchecked"), for: .normal)
        btnPortfolioWebsite.setImage(#imageLiteral(resourceName: dicSelectedDriveWebSitelist[btnPortfolioWebsite.titleLabel!.text ?? ""] ?? false ? "checked" : "unchecked"), for: .normal)
        btnEventWebsite.setImage(#imageLiteral(resourceName: dicSelectedDriveWebSitelist[btnEventWebsite.titleLabel!.text ?? ""] ?? false ? "checked" : "unchecked"), for: .normal)
        btnPersonalWebsite.setImage(#imageLiteral(resourceName: dicSelectedDriveWebSitelist[btnPersonalWebsite.titleLabel!.text ?? ""] ?? false ? "checked" : "unchecked"), for: .normal)
        btnMembershipWebsite.setImage(#imageLiteral(resourceName: dicSelectedDriveWebSitelist[btnMembershipWebsite.titleLabel!.text ?? ""] ?? false ? "checked" : "unchecked"), for: .normal)
        btnNonprofitWebsite.setImage(#imageLiteral(resourceName: dicSelectedDriveWebSitelist[btnNonprofitWebsite.titleLabel!.text ?? ""] ?? false ? "checked" : "unchecked"), for: .normal)
        btnInformationalWebsite.setImage(#imageLiteral(resourceName: dicSelectedDriveWebSitelist[btnInformationalWebsite.titleLabel!.text ?? ""] ?? false ? "checked" : "unchecked"), for: .normal)
        btnOnlineWebsite.setImage(#imageLiteral(resourceName: dicSelectedDriveWebSitelist[btnOnlineWebsite.titleLabel!.text ?? ""] ?? false ? "checked" : "unchecked"), for: .normal)
        
        btnAmenities.tintColor = Theme.affiliatePurpleColor
        btnAmenities.tintColor = Theme.affiliatePurpleColor
        btnTravelEvents.tintColor = Theme.affiliatePurpleColor
        btnLorem.tintColor = Theme.affiliatePurpleColor
        btnECommerceWebsite.tintColor = Theme.affiliatePurpleColor
        btnBusinessWebsite.tintColor = Theme.affiliatePurpleColor
        btnBlogWebsite.tintColor = Theme.affiliatePurpleColor
        btnPortfolioWebsite.tintColor = Theme.affiliatePurpleColor
        btnEventWebsite.tintColor = Theme.affiliatePurpleColor
        btnPersonalWebsite.tintColor = Theme.affiliatePurpleColor
        btnMembershipWebsite.tintColor = Theme.affiliatePurpleColor
        btnNonprofitWebsite.tintColor = Theme.affiliatePurpleColor
        btnInformationalWebsite.tintColor = Theme.affiliatePurpleColor
        btnOnlineWebsite.tintColor = Theme.affiliatePurpleColor
    }
    
    func initializeBtnTitle(){
        if #available(iOS 15.0, *) {
            //            btnAmenities.configuration?.imagePadding = 10
            //            btnCountry.configuration?.imagePadding = 10
            //            btnLorem.configuration?.imagePadding = 10
            btnECommerceWebsite.configuration?.imagePadding = 10
            btnBusinessWebsite.configuration?.imagePadding = 10
            btnBlogWebsite.configuration?.imagePadding = 10
            btnPortfolioWebsite.configuration?.imagePadding = 10
            btnEventWebsite.configuration?.imagePadding = 10
            btnPersonalWebsite.configuration?.imagePadding = 10
            btnMembershipWebsite.configuration?.imagePadding = 10
            btnNonprofitWebsite.configuration?.imagePadding = 10
            btnInformationalWebsite.configuration?.imagePadding = 10
            btnOnlineWebsite.configuration?.imagePadding = 10
        } else {
            //            btnAmenities.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            //            btnCountry.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            //            btnLorem.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            btnECommerceWebsite.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            btnBusinessWebsite.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            btnBlogWebsite.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            btnPortfolioWebsite.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            btnEventWebsite.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            btnPersonalWebsite.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            btnMembershipWebsite.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            btnNonprofitWebsite.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            btnInformationalWebsite.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            btnOnlineWebsite.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        }
        
        btnAmenities.setTitle(appKeys.TravelProducts, for: .normal)
        btnTravelEvents.setTitle(appKeys.TravelEvents, for: .normal)
        btnLorem.setTitle(appKeys.Other, for: .normal)
        
        btnECommerceWebsite.setTitle(appKeys.ECommerceWebsite, for: .normal)
        btnBusinessWebsite.setTitle(appKeys.BusinessWebsite, for: .normal)
        btnBlogWebsite.setTitle(appKeys.BlogWebsite, for: .normal)
        btnPortfolioWebsite.setTitle(appKeys.PortfolioWebsite, for: .normal)
        btnEventWebsite.setTitle(appKeys.EventWebsite, for: .normal)
        btnPersonalWebsite.setTitle(appKeys.PersonalWebsite, for: .normal)
        btnMembershipWebsite.setTitle(appKeys.MembershipWebsite, for: .normal)
        btnNonprofitWebsite.setTitle(appKeys.NonprofitWebsite, for: .normal)
        btnInformationalWebsite.setTitle(appKeys.InformationalWebsite, for: .normal)
        btnOnlineWebsite.setTitle(appKeys.OnlineForum, for: .normal)
    }
    
    func initializeLocalization(){
        lblNameOfYourWebsite.text = "\((Utility.shared.getLanguage()?.value(forKey:"NameOfYourWebsite")) ?? "What is the name of your website")"
        lblURLYouWillSendTheTraffic.text = "\((Utility.shared.getLanguage()?.value(forKey:"URLYouWillSendTheTraffic")) ?? "URL - you will to send the traffic")"
        lblWhatIsYourWebsiteAccount.text = "\((Utility.shared.getLanguage()?.value(forKey:"WhatIsYourWebsiteAbout")) ?? "What is your website about")"
        lblwhatTypeOfItemsDoYouWantToList.text = "\((Utility.shared.getLanguage()?.value(forKey:"whatTypeOfItemsDoYouWantToList")) ?? "What type of items do you want to list")"
        lblHowDoYouDriveTrafficToYourWebsite.text = "\((Utility.shared.getLanguage()?.value(forKey:"HowDoYouDriveTrafficToYourWebsite")) ?? "How do you drive traffic to your website")"
        lblWhatTypeOfSiteIsYourWebsite.text = "\((Utility.shared.getLanguage()?.value(forKey:"WhatTypeOfSiteIsYourWebsite")) ?? "What type of site is your website")"
        lblPrimaryReasonForJoining.text = "\((Utility.shared.getLanguage()?.value(forKey:"PrimaryReasonForJoining")) ?? "What is the Primary reason for joining")"
        lblHowManyVisitorsShouldYourWebsiteGet.text = "\((Utility.shared.getLanguage()?.value(forKey:"HowManyVisitorsShouldYourWebsiteGet")) ?? "How Many Visitors Should Your Website Get")"
        lblHowDoYouUsuallyBuildLinks.text = "\((Utility.shared.getLanguage()?.value(forKey:"HowDoYouUsuallyBuildLinks")) ?? "How do you usually build links")"
        lblHowElseDoYouMonetize.text = "\((Utility.shared.getLanguage()?.value(forKey:"HowElseDoYouMonetize")) ?? "How else do you monetize your Website")"
    }
    
    //MARK: - Action Methods
    @IBAction func onClickAmenities(_ sender: UIButton) {
        if dicSelectedTypeList[appKeys.TravelProducts] == true{
            dicSelectedTypeList.updateValue(false, forKey: appKeys.TravelProducts)
            sender.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }else{
            dicSelectedTypeList.updateValue(true, forKey: appKeys.TravelProducts)
            sender.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        }
        sender.tintColor = Theme.affiliatePurpleColor
        print(dicSelectedTypeList)
    }
    
    @IBAction func onClickTravelEvents(_ sender: UIButton) {
        if dicSelectedTypeList[ appKeys.TravelEvents ] == true{
                                dicSelectedTypeList.updateValue(false, forKey: appKeys.TravelEvents )
                sender.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }else{
            dicSelectedTypeList.updateValue(true, forKey: appKeys.TravelEvents )
            sender.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        }
        sender.tintColor = Theme.affiliatePurpleColor
        print(dicSelectedTypeList)
    }
    
    @IBAction func onClickLorem(_ sender: UIButton) {
        if dicSelectedTypeList[appKeys.Other] == true{
            dicSelectedTypeList.updateValue(false, forKey: appKeys.Other)
            sender.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }else{
            dicSelectedTypeList.updateValue(true, forKey: appKeys.Other)
            sender.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        }
        sender.tintColor = Theme.affiliatePurpleColor
        print(dicSelectedTypeList)
    }
    
    @IBAction func onClickHowYouDriveTrafficToYourWebsite(_ sender: UIButton) {
        if let strTitleLabel = sender.titleLabel,let txt = strTitleLabel.text,dicSelectedDriveWebSitelist[txt] ?? false{
            dicSelectedDriveWebSitelist.updateValue(false, forKey: txt)
            sender.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }else{
            dicSelectedDriveWebSitelist.updateValue(true, forKey: sender.titleLabel!.text!)
            sender.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        }
        sender.tintColor = Theme.affiliatePurpleColor
        print(dicSelectedTypeList)
        print(dicSelectedDriveWebSitelist)

    }
    
    @IBAction func onClickBtnNext(_ sender: Any) {
        if txtNameOfYourWebsite.isEmpty() {
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"AlertNameOfYourWebsite")) ?? "Please Enter WebsiteName")")
        }else if txtURLYouWillSendTheTraffic.isEmpty() {
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"AlertURLYouWillSendTheTraffic")) ?? "Please Enter WebUrl")")
        }else if txtWhatIsYourWebsiteAccount.text.isEmpty {
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"AlertWhatIsYourWebsiteAbout")) ?? "Fill what is website about")")
        }else if txtPrimaryReasonForJoining.text.isEmpty {
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"PrimaryReasonForJoining")) ?? "Enter joining reason")")
        }else if txtHowManyVisitorsShouldYourWebsiteGet.isEmpty() {
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"HowManyVisitorsShouldYourWebsiteGet")) ?? "Enter Visitors knowledge")")
        }else if txtHowDoYouUsuallyBuildLinks.text.isEmpty {
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"HowDoYouUsuallyBuildLinks")) ?? "Enter Build Links")")
        }else if txtHowElseDoYouMonetize.text.isEmpty {
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"HowElseDoYouMonetize")) ?? "Enter monetize your website")")
        }else{
            apiCreateAffiliateUserWebList()
        }
    }
    
    @IBAction func onClickBtnPrevious(_ sender: Any) {
        if let parent = self.parent as? AffiliateRegistration{
            parent.showAccountView()
        }
    }
    
    //MARK: TExtfiled delegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if(textField == dropDownWhatTypeOfSiteIsYourWebsite){
            self.view.endEditing(true)
            DispatchQueue.main.async {
                self.dropDownWhatTypeOfSiteIsYourWebsite.showList()
            }
            return false
        }
        return true
    }
    
    //MARK: - API CALL
    func apiCreateAffiliateUserWebList(){
        let createAffiliateUserWebsite = PTProAPI.CreateAffiliateUserWebListMutation(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""), websiteName: .some(txtNameOfYourWebsite.text!), websiteUrl: .some(txtURLYouWillSendTheTraffic.text!), websiteAbout: .some(txtWhatIsYourWebsiteAccount.text!), typeList: .some(convertTypeListToString()), websiteDrive: .some(convertDriveWebsiteListToString()), typesOfWebsite: .some(dropDownWhatTypeOfSiteIsYourWebsite.text ?? ""), primryJoining: .some(txtPrimaryReasonForJoining.text!), websiteVisitors: .some(txtHowManyVisitorsShouldYourWebsiteGet.text!), buildLinks: .some(txtHowDoYouUsuallyBuildLinks.text!), websiteMonitize: .some(txtHowElseDoYouMonetize.text!))
        print("\(Utility.shared.ProfileAPIArray?.userId ?? "") \n \(txtNameOfYourWebsite.text!) \n \(txtURLYouWillSendTheTraffic.text!) \n \(txtWhatIsYourWebsiteAccount.text!) \n \(convertTypeListToString()) \n \(convertDriveWebsiteListToString()) \n \(dropDownWhatTypeOfSiteIsYourWebsite.text ?? "") \n \(txtPrimaryReasonForJoining.text!) \n \(txtHowManyVisitorsShouldYourWebsiteGet.text!) \n \(txtHowManyVisitorsShouldYourWebsiteGet.text!) \n \(txtHowDoYouUsuallyBuildLinks.text!) \n \(txtHowDoYouUsuallyBuildLinks.text!) \n \(txtHowElseDoYouMonetize.text!)")
        
        print(createAffiliateUserWebsite.__variables?._jsonEncodableValue ?? "")
        Network.shared.apollo_headerClient.perform(mutation: createAffiliateUserWebsite){  response in
            switch response {
            case .success(let result):
                if let data = result.data?.createAffiliateUserWebList?.status,data == 200 {
                    self.view.makeToast("success")
                    if let parent =  self.parent as? AffiliateRegistration{
                        parent.delegate?.userStepInfoUpdate()
                        parent.showDocumentview()
                    }
                } else {
                    self.view.makeToast(result.data?.createAffiliateUserWebList?.errorMessage)
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }
    
    //MARK: - helper
    func convertToDictionary(text: String) -> [String: Bool]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Bool]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    func convertTypeListToString() -> String{
        print(dicSelectedTypeList)
        do{
            let data = try JSONSerialization.data(withJSONObject: dicSelectedTypeList, options: [])
            if let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                return string as String
            }
        }catch{
            return ""
        }
        return ""
    }
    
    func convertDriveWebsiteListToString() -> String{
        print(dicSelectedDriveWebSitelist)
        do{
            let data = try JSONSerialization.data(withJSONObject: dicSelectedDriveWebSitelist, options: [])
            if let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                return string as String
            }
        }catch{
            return ""
        }
        return ""
    }
}
