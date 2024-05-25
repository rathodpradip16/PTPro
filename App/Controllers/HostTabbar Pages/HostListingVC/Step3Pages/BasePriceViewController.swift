//
//  BasePriceViewController.swift
//  App
//
//  Created by RadicalStart on 08/08/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import Lottie
import SwiftMessages

class BasePriceViewController: BaseHostTableviewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var curvedView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var progressBGView: UIView!
    @IBOutlet weak var currentProgressView: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var saveandExit: UIButton!
    @IBOutlet weak var offlineUIView: UIView!
    @IBOutlet weak var errorLabel:UILabel!
      @IBOutlet weak var retryBtn: UIButton!
    
    @IBOutlet var progressViewWidth: NSLayoutConstraint!
    var currencyDataArray = [PTProAPI.GetCurrenciesListQuery.Data.GetCurrencies.Result]()
    
    var basePriceValue = ""
    var cleaningPriceValue = ""
    var affiliateCommission = ""
    var isAffiliate = 0
    var inputPickerView = UIPickerView()
    var inputUIView = UIView()
    var lottieView1: LottieAnimationView!
    var currencyArr = [String]()
    let characterset = NSCharacterSet(charactersIn: "0123456789.")
    let cleaning_character = NSCharacterSet(charactersIn: "0123456789")
    
    var arrPricingResult = [PTProAPI.PricingQuery.Data.Pricing.Result?]()
    var arrPricingFilter = [[String:Any]]()
    var arrCurrentPricingFilter = [[String:Any]]()
    var pricePredectionLabel = ""
    var pricePredection = ""

    var showQuickTip = false
    var currentTotalScore = 0.0

    @IBOutlet weak var stepsTitleView: BecomeStepCollectionView!
    @IBOutlet weak var stepTitleHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var stepTitleTopConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "becomeAHostStep_Color")
        tableView.backgroundColor =  UIColor(named: "colorController")
        bottomView.backgroundColor =  UIColor(named: "colorController")
        curvedView.backgroundColor = UIColor(named: "colorController")
        nextBtn.backgroundColor = Theme.Button_BG
        saveandExit.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
      
        self.backBtn.setImage(UIImage(named: "left_arrow"), for: .normal)
        self.backBtn.setTitle("", for: .normal)
        self.backBtn.backgroundColor = UIColor.white
        self.backBtn.layer.cornerRadius = self.backBtn.frame.size.height/2
        self.backBtn.clipsToBounds = true
        
        if Utility.shared.isRTLLanguage(){
            self.backBtn.rotateImageViewofBtn()
        }
        
        self.titleLabel.text = "\(Utility.shared.getLanguage()?.value(forKey: "baseprice") ?? "Pricing")"
        self.titleLabel.textColor = UIColor(named: "Title_Header")
        self.titleLabel.font = UIFont(name: APP_FONT_SEMIBOLD, size: 24.0)
        self.titleLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        
        progressBGView.backgroundColor = Theme.becomeAHostProgressBG_Color
        currentProgressView.backgroundColor = Theme.PRIMARY_COLOR
        
        self.curvedView.layer.borderColor = Theme.becomeAHostBorder_Color.cgColor
        self.curvedView.layer.borderWidth = 0.5
        self.curvedView.layer.cornerRadius = 20.0
        self.curvedView.clipsToBounds = true
        
        currencyAPICall()
        errorLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"error_field"))!)"
        retryBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"retry"))!)", for:.normal)
        saveandExit.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"saveexit"))!)", for:.normal)
        saveandExit.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        errorLabel.textColor =  UIColor(named: "Title_Header")
        retryBtn.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        saveandExit.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 14)
        nextBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
        errorLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 15)
               retryBtn.titleLabel?.font = UIFont(name: APP_FONT, size: 15)
        
        self.stepsTitleView.whichStep = 3
        self.stepsTitleView.selectedViewIndex = 2
        self.stepsTitleView.delegateSteps = self
        self.pricingApiCall()
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.stepsTitleView.toBeCheck()
        progressViewWidth.constant = ((self.view.frame.width/8) * CGFloat((self.stepsTitleView.selectedViewIndex + 1)))
    }
    

    override func setUpUI() {
        offlineUIView.isHidden = true
        callListingSettingsAPI(oflineView: offlineUIView, nextButton: nextBtn)
        tableView.isHidden = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 10))
       nextBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"next"))!)", for: .normal)
        nextBtn.layer.cornerRadius = nextBtn.frame.size.height/2
        nextBtn.clipsToBounds = true
        if(Utility.shared.step3_Edit)
        {
            self.saveandExit.isHidden = false
            self.stepsTitleView.isHidden = false
            self.stepTitleHeightConstraint.constant = 50
            self.stepTitleTopConstraint.constant = 5
        }
        else{
            self.saveandExit.isHidden = true
            self.stepsTitleView.isHidden = true
            self.stepTitleHeightConstraint.constant = 0
            self.stepTitleTopConstraint.constant = 0
        }
      //  Utility.shared.host_basePrice = Int(((Utility.shared.step3ValuesInfo["basePrice"])!) as! Double)
    }
    
    override func setDropdownList() {
        tableView.reloadData()
    }
    
    func currencyAPICall()
    {

        Utility.shared.currencyvalue = (Utility.shared.currencyDataArray.first?.symbol!)!
            for i in Utility.shared.currencyDataArray
            {
               self.currencyArr.append(i.symbol!)
            }
            if(Utility.shared.step3ValuesInfo["currency"] != nil && "\(Utility.shared.step3ValuesInfo["currency"]!)" != "")
            {
                let index = self.currencyArr.firstIndex(of:"\(Utility.shared.step3ValuesInfo["currency"]!)")
                self.inputPickerView.selectRow(index != nil ? index! : 0, inComponent: 0, animated: true)
            }
            else
            {
             self.inputPickerView.selectRow(0, inComponent: 0, animated: true)
            }
            self.tableView.reloadData()
      
    }
    
    func pricingApiCall(){
        let getPricingQuery = PTProAPI.PricingQuery(listId: .some(Utility.shared.createId))
        Network.shared.apollo_headerClient.fetch(query: getPricingQuery,cachePolicy:.fetchIgnoringCacheData){ response in
            switch response {
            case .success(let result):
                if let pricing = result.data?.pricing, let results = pricing.results,results.count != 0{

                    self.arrPricingResult = results
                    self.arrPricingFilter.removeAll()
                    self.arrCurrentPricingFilter.removeAll()

                    var arrUserAmenites = [PTProAPI.PricingQuery.Data.Pricing.Result.UserAmenity?]()
                    var arrSefetyAmenities = [PTProAPI.PricingQuery.Data.Pricing.Result.SefetyAmenity?]()
                    var arrUserspace = [PTProAPI.PricingQuery.Data.Pricing.Result.Userspace?]()
                    var arrPlace = [PTProAPI.PricingQuery.Data.Pricing.Result.Place?]()
                    var arrOtherdata = [PTProAPI.PricingQuery.Data.Pricing.Result.Otherdatum?]()
                    var arrRating = [PTProAPI.PricingQuery.Data.Pricing.Result.Rating?]()
                    var arrOccupacy = [PTProAPI.PricingQuery.Data.Pricing.Result.Occupacy?]()
                    
                    var arrCurUserAmenites = [PTProAPI.PricingQuery.Data.Pricing.CurrentPropertyResult.UserAmenity?]()
                    var arrCurSefetyAmenities = [PTProAPI.PricingQuery.Data.Pricing.CurrentPropertyResult.SefetyAmenity?]()
                    var arrCurUserspace = [PTProAPI.PricingQuery.Data.Pricing.CurrentPropertyResult.Userspace?]()
                    var arrCurPlace = [PTProAPI.PricingQuery.Data.Pricing.CurrentPropertyResult.Place?]()
                    var arrCurOtherdata = [PTProAPI.PricingQuery.Data.Pricing.CurrentPropertyResult.Otherdatum?]()
                    var arrCurRating = [PTProAPI.PricingQuery.Data.Pricing.CurrentPropertyResult.Rating?]()
                    var arrCurOccupacy = [PTProAPI.PricingQuery.Data.Pricing.CurrentPropertyResult.Occupacy?]()
                    
                    if let arrData = self.arrPricingResult[0]{
                        self.pricePredection = "\(arrData.basePrice ?? 0)"
                        self.pricePredectionLabel = "\(pricing.errorMessage ?? "Best price you can put here")"

                        if let userAmenities = arrData.userAmenities{
                            arrUserAmenites = userAmenities
                        }
                        
                        if let sefetyAmenities = arrData.sefetyAmenities{
                            arrSefetyAmenities = sefetyAmenities
                        }
                        
                        if let userspace = arrData.userspace{
                            arrUserspace = userspace
                        }
                        
                        if let arPlace = arrData.places {
                            arrPlace = arPlace
                        }
                        
                        if let otherdata = arrData.otherdata {
                            arrOtherdata = otherdata
                        }
                        
                        if let rating = arrData.rating {
                            arrRating = rating
                        }
                        
                        if let occupacy = arrData.occupacy {
                            arrOccupacy = occupacy
                        }
                        
                        if let arrCurData = result.data?.pricing?.currentPropertyResult,arrCurData.count != 0,let arrCurrentData = arrCurData[0]{
                           
                            if let userAmenities = arrCurrentData.userAmenities{
                                arrCurUserAmenites = userAmenities
                            }
                            
                            if let sefetyAmenities = arrCurrentData.sefetyAmenities{
                                arrCurSefetyAmenities = sefetyAmenities
                            }
                            
                            if let userspace = arrCurrentData.userspace{
                                arrCurUserspace = userspace
                            }
                            
                            if let arPlace = arrCurrentData.places {
                                arrCurPlace = arPlace
                            }
                            
                            if let otherdata = arrCurrentData.otherdata {
                                arrCurOtherdata = otherdata
                            }
                            
                            if let rating = arrCurrentData.rating {
                                arrCurRating = rating
                            }
                            
                            if let occupacy = arrCurrentData.occupacy {
                                arrCurOccupacy = occupacy
                            }
                            
                            var dicTitle1 = [String:Any]()
                            dicTitle1["itemName"] = "Title"
                            dicTitle1["score"] = "\(arrCurrentData.title ?? "")"
                            self.arrCurrentPricingFilter.append(dicTitle1)

                            var dicBase1 = [String:Any]()
                            dicBase1["itemName"] = "BasePrice"
                            dicBase1["score"] = "\(arrCurrentData.basePrice ?? 0)"
                            self.arrCurrentPricingFilter.append(dicBase1)

                            self.currentTotalScore = arrCurrentData.score ?? 0.0
                        }
                        
                        var dicTitle = [String:Any]()
                        dicTitle["itemName"] = "Title"
                        dicTitle["score"] = "\(arrData.title ?? "")"
                        self.arrPricingFilter.append(dicTitle)

                        var dicBase = [String:Any]()
                        dicBase["itemName"] = "BasePrice"
                        dicBase["score"] = "\(arrData.basePrice ?? 0)"
                        self.arrPricingFilter.append(dicBase)
                        
                                                
                        for data in arrUserAmenites{
                            var dic = [String:Any]()
                            if let itemName = data?.itemName{
                                dic["itemName"] = "\(itemName)"
                                dic["score"] = "\(data?.score ?? 0)"
                                self.arrPricingFilter.append(dic)
                            }
                        }
                        
                        for data in arrSefetyAmenities{
                            var dic = [String:Any]()
                            if let itemName = data?.itemName{
                                dic["itemName"] = "\(itemName)"
                                dic["score"] = "\(data?.score ?? 0)"
                                self.arrPricingFilter.append(dic)
                            }
                        }

                        for data in arrUserspace{
                            var dic = [String:Any]()
                            if let itemName = data?.itemName{
                                dic["itemName"] = "\(itemName)"
                                dic["score"] = "\(data?.score ?? 0)"
                                self.arrPricingFilter.append(dic)
                            }
                        }

                        for data in arrPlace{
                            var dic = [String:Any]()
                            if let itemName = data?.itemName{
                                dic["itemName"] = "\(itemName)"
                                dic["score"] = "\(data?.score ?? 0)"
                                self.arrPricingFilter.append(dic)
                            }
                        }

                        for data in arrOtherdata{
                            var dic = [String:Any]()
                            if let bedrooms = data?.bedrooms{
                                dic["itemName"] = "Bedrooms"
                                dic["score"] = "\(bedrooms)"
                                self.arrPricingFilter.append(dic)
                            }
                            
                            if let personCapacity = data?.personCapacity{
                                dic["itemName"] = "Person Capacity"
                                dic["score"] = "\(personCapacity)"
                                self.arrPricingFilter.append(dic)
                            }

                            if let Cancle = data?.cancle{
                                dic["itemName"] = "Cancle"
                                dic["score"] = "\(Cancle)"
                                self.arrPricingFilter.append(dic)
                            }
                            
                            if let bookingtype = data?.bookingtype{
                                dic["itemName"] = "Booking Type"
                                dic["score"] = "\(bookingtype)"
                                self.arrPricingFilter.append(dic)
                            }
                        }

                        for data in arrRating{
                            var dic = [String:Any]()
                            if let rating = data?.rating{
                                dic["itemName"] = "Rating"
                                dic["score"] = "\(rating)"
                                self.arrPricingFilter.append(dic)
                            }
                        }

                        for data in arrOccupacy{
                            var dic = [String:Any]()
                            if let Occupacy = data?.occupacy{
                                dic["itemName"] = "Occupacy"
                                dic["score"] = "\(Occupacy)"
                                self.arrPricingFilter.append(dic)
                            }
                        }
                        
                        var dicScore = [String:Any]()
                        dicScore["itemName"] = "Score"
                        dicScore["score"] = "\(arrData.score ?? 0.0)"
                        self.arrPricingFilter.append(dicScore)

                        
                        ///////////////////////////////
                                        

                        for data in arrCurUserAmenites{
                            var dic = [String:Any]()
                                dic["itemName"] = "\(data?.itemName ?? "")"
                                dic["score"] = "\(data?.score ?? 0)"
                                self.arrCurrentPricingFilter.append(dic)
                        }
                        
                        for data in arrCurSefetyAmenities{
                            var dic = [String:Any]()
                            dic["itemName"] = "\(data?.itemName ?? "")"
                            dic["score"] = "\(data?.score ?? 0)"
                            self.arrCurrentPricingFilter.append(dic)
                        }

                        for data in arrCurUserspace{
                            var dic = [String:Any]()
                            dic["itemName"] = "\(data?.itemName ?? "")"
                            dic["score"] = "\(data?.score ?? 0)"
                            self.arrCurrentPricingFilter.append(dic)
                        }
                        
                        for data in arrCurPlace{
                            var dic = [String:Any]()
                            dic["itemName"] = "\(data?.itemName ?? "")"
                            dic["score"] = "\(data?.score ?? 0)"
                            self.arrCurrentPricingFilter.append(dic)
                        }

                        for data in arrCurOtherdata{
                            var dic = [String:Any]()
                            if let bedrooms = data?.bedrooms{
                                dic["itemName"] = "Bedrooms"
                                dic["score"] = "\(bedrooms)"
                                self.arrCurrentPricingFilter.append(dic)
                            }
                            
                            if let personCapacity = data?.personCapacity{
                                dic["itemName"] = "Person Capacity"
                                dic["score"] = "\(personCapacity)"
                                self.arrCurrentPricingFilter.append(dic)
                            }

                            if let Cancle = data?.cancle{
                                dic["itemName"] = "Cancle"
                                dic["score"] = "\(Cancle)"
                                self.arrCurrentPricingFilter.append(dic)
                            }
                            
                            if let bookingtype = data?.bookingtype{
                                dic["itemName"] = "Booking Type"
                                dic["score"] = "\(bookingtype)"
                                self.arrCurrentPricingFilter.append(dic)
                            }
                        }

                        for data in arrCurRating{
                            var dic = [String:Any]()
                            if let rating = data?.rating{
                                dic["itemName"] = "Rating"
                                dic["score"] = "\(rating)"
                                self.arrCurrentPricingFilter.append(dic)
                            }
                        }

                        for data in arrCurOccupacy{
                            var dic = [String:Any]()
                            if let Occupacy = data?.occupacy{
                                dic["itemName"] = "Occupacy"
                                dic["score"] = "\(Occupacy)"
                                self.arrCurrentPricingFilter.append(dic)
                            }
                        }
                        
                        var dicScore1 = [String:Any]()
                        dicScore1["itemName"] = "Score"
                        dicScore1["score"] = "\(self.currentTotalScore)"
                        self.arrCurrentPricingFilter.append(dicScore1)
                    }else{
                        self.pricePredection = ""
                        if let msg = pricing.errorMessage{
                            self.pricePredectionLabel = msg
                        }else{
                            self.pricePredectionLabel = "Your Price is Already Best"
                        }
                    }
                }else{
                    self.pricePredection = ""
                    if let msg = result.data?.pricing?.errorMessage{
                        self.pricePredectionLabel = msg
                    }else{
                        self.pricePredectionLabel = "Your Price is Already Best"
                    }
                }
                self.tableView.reloadData()
            case .failure(let error):
                self.pricePredectionLabel = error.localizedDescription
                self.pricePredection = ""
                self.view.makeToast(error.localizedDescription)
            }
        }
    }
    
    override func setdropdown()
    {
        inputUIView.frame = CGRect(x: 0, y: FULLHEIGHT-200, width: FULLWIDTH, height: 200)
        inputPickerView.frame = CGRect(x: 0, y: 0, width: FULLWIDTH, height: 200)
        inputUIView.addSubview(inputPickerView)
        inputPickerView.delegate = self
        inputPickerView.tintColor = Theme.PRIMARY_COLOR
        inputPickerView.backgroundColor = UIColor(named: "colorController")
        inputPickerView.reloadAllComponents()
        
        
    }
    
    override func registerCells() {
        tableView.register(UINib(nibName: "TextFieldCell", bundle: nil), forCellReuseIdentifier: "textfieldcell")
        
        tableView.register(UINib(nibName: "TipCell", bundle: nil), forCellReuseIdentifier: "TipCell")
        tableView.register(UINib(nibName: "BasePriceTipCell", bundle: nil), forCellReuseIdentifier: "BasePriceTipCell")
        tableView.register(UINib(nibName: "AffiliateCell", bundle: nil), forCellReuseIdentifier: "AffiliateCell")
    }
    
    //MARK: - Progress Indicator
    
    override func addLottieViewAsSubview()
    {
        self.view.addSubview(self.lottieView)
    }
    func lottieViewanimation()
    {
        saveandExit.setTitle("", for:.normal)
        lottieView1 = LottieAnimationView.init(name: "animation")
        self.lottieView1.isHidden = false
        self.lottieView1.frame = CGRect(x:((self.saveandExit.frame.size.width/2)-50), y:0, width:100, height:self.saveandExit.frame.size.height)
        self.saveandExit.addSubview(self.lottieView1)
        self.view.bringSubviewToFront(self.lottieView1)
        self.lottieView1.backgroundColor = UIColor.clear
        self.lottieView1.play()
        Timer.scheduledTimer(timeInterval:0.3, target: self, selector: #selector(autoscrolling), userInfo: nil, repeats: true)
    }
    @objc func autoscrolling()
    {
        self.lottieView1.play()
    }
    func offlineviewShow()
    {
        offlineUIView.backgroundColor =  UIColor(named: "Button_Grey_Color")
        self.offlineUIView.isHidden = false
        let shadowSize2 : CGFloat = 3.0
        let shadowPath2 = UIBezierPath(rect: CGRect(x: -shadowSize2 / 2,
                                                    y: -shadowSize2 / 2,
                                                    width: self.offlineUIView.frame.size.width + shadowSize2,
                                                    height: self.offlineUIView.frame.size.height + shadowSize2))
        
        self.offlineUIView.layer.masksToBounds = false
        self.offlineUIView.layer.shadowColor = Theme.TextLightColor.cgColor
        self.offlineUIView.layer.shadowOffset = CGSize(width: 0.0, height: 00.0)
        self.offlineUIView.layer.shadowOpacity = 0.3
        self.offlineUIView.layer.shadowPath = shadowPath2.cgPath
        if IS_IPHONE_X || IS_IPHONE_XR{
            offlineUIView.frame = CGRect.init(x: 0, y: FULLHEIGHT-130, width: FULLWIDTH, height: 55)
        }else{
            offlineUIView.frame = CGRect.init(x: 0, y: FULLHEIGHT-100, width: FULLWIDTH, height: 55)
        }
    }
    
    //IBActions
    
    @IBAction func RedirectNextPage(_ sender: Any) {

//        if basePriceValue.isEmpty  || basePriceValue == "." ||  basePriceValue == "0" || Utility.shared.host_basePrice  < 1.0 || (basePriceValue.rangeOfCharacter(from: characterset.inverted) != nil) {
//            if((basePriceValue == "."  || basePriceValue == "0" || Utility.shared.host_basePrice < 1.0) && (basePriceValue != "") && (basePriceValue.rangeOfCharacter(from: characterset.inverted) == nil) )
//            {
//             self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"invalidbaseprice"))!)")
//            }
//            else
//            {
//
//            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"baseprice_require"))!)")
//            }
//            return
//        }
        if Utility.shared.isConnectedToNetwork(){
        self.view.endEditing(true)
        if basePriceValue.isEmpty  || basePriceValue == "."  || basePriceValue == "0" || Utility.shared.host_basePrice < 1.0 || (basePriceValue.rangeOfCharacter(from: characterset.inverted) != nil) {
            if((basePriceValue == "."  || basePriceValue == "0" || Utility.shared.host_basePrice < 1.0) && (basePriceValue != "") && (basePriceValue.rangeOfCharacter(from: characterset.inverted) == nil) )
            {
                self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"invalidbaseprice"))!)")
            
            }
            else
            {
                self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"baseprice_require"))!)")
            }
            return
        }
        
        if(cleaningPriceValue == "0")
        {
           self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"invalidcleaning"))!)")
            return
        }
            
            if((isAffiliate != 0) && affiliateCommission == "0")
            {
               self.view.makeToast("Invalid Affiliate Commission, only numbers(eg:25) are allowed")
                return
            }
        
            Utility.shared.step3ValuesInfo.updateValue(Utility.shared.currencyvalue, forKey: "currency")
            let amenities = DiscountViewController()
            self.view.window?.backgroundColor = UIColor.white
            amenities.modalPresentationStyle = .fullScreen
            self.present(amenities, animated: false, completion: nil)
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        if Utility.shared.isConnectedToNetwork(){
            view.endEditing(true)
            //self.view.layer.add(dismissrightAnimation()!, forKey: kCATransition)
            if(Utility.shared.step3_Edit)
            {
                let StepTwoObj = HouseRulesViewController()
                self.view.window?.backgroundColor = UIColor.white
                StepTwoObj.modalPresentationStyle = .fullScreen
                self.present(StepTwoObj, animated:false, completion: nil)
            }
            else{
                self.dismiss(animated: true, completion: nil)
            }
        }
        else
        {
            self.offlineviewShow()
        }
    }
    
    func goToBecomeHostVC(){
        let becomeHost = BecomeHostVC()
        becomeHost.listID = "\(Utility.shared.createId)"
        becomeHost.showListingStepsAPICall(listID:"\(Utility.shared.createId)")
      //  self.view.window!.layer.add(presentrightAnimation()!, forKey: kCATransition)
        becomeHost.modalPresentationStyle = .fullScreen
        self.present(becomeHost, animated:false, completion: nil)
    }
    
    
    @IBAction func retryBtnTapped(_ sender: Any) {
         if Utility.shared.isConnectedToNetwork(){
           self.offlineUIView.isHidden = true
        }
    }
    @IBAction func saveandexitAction(_ sender: Any) {
        if Utility.shared.isConnectedToNetwork(){
           self.view.endEditing(true)
             self.lottieViewanimation()
            
            Utility.shared.step3ValuesInfo.updateValue(Utility.shared.selectedRules, forKey: "houseRules")
                       Utility.shared.step3ValuesInfo.updateValue(Utility.shared.createId, forKey: "id")
                       super.updateStep3ListingAPICall{ (success) -> Void in
                       if success {
                       saveandExit.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"saveexit"))!)", for:.normal)
                           
                           self.lottieView1.isHidden = true
                        }
                           }
//            if basePriceValue.isEmpty  || basePriceValue == "."  || basePriceValue == "0" || Utility.shared.host_basePrice < 1.0 || (basePriceValue.rangeOfCharacter(from: characterset.inverted) != nil) {
//                if((basePriceValue == "."  || basePriceValue == "0" || Utility.shared.host_basePrice < 1.0) && (basePriceValue != "") && (basePriceValue.rangeOfCharacter(from: characterset.inverted) == nil) )
//                {
//                    self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"invalidbaseprice"))!)")
//
//                }
//                else
//                {
//                    self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"baseprice_require"))!)")
//                }
//                return
//            }
//            if(cleaningPriceValue == ".")
//            {
//                self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"invalidcleaning"))!)")
//                return
//            }
//             self.lottieViewanimation()
//            Utility.shared.step3ValuesInfo.updateValue(Utility.shared.currencyvalue, forKey: "currency")
//            super.updateStep3ListingAPICall()
        }
        else
        {
            self.offlineviewShow()
        }
    }
    
    //MARK: - UITAbleViewDatasource and UITableViewDelegates
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerLabel = UILabel(frame: CGRect(x:15, y: 8, width:FULLWIDTH-40, height: 100))
        
        headerLabel.font =  UIFont(name: APP_FONT_MEDIUM, size:25)
        headerLabel.addCharacterSpacing()
        headerLabel.textColor =  UIColor(named: "Title_Header")
        headerLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
        headerLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        headerLabel.numberOfLines = 0
        //headerLabel.sizeToFit()
        
        let headerView = UIView(frame: CGRect(x:15, y: 8, width: tableView.bounds.size.width - 20, height: 100))
        headerView.backgroundColor = UIColor.white
        headerView.addSubview(headerLabel)
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 2
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BasePriceTipCell", for: indexPath) as? BasePriceTipCell
            cell?.tipText.text = "\(Utility.shared.getLanguage()?.value(forKey: "basepricedsec")as! String)"
            
            cell?.btnQuickTip.tag = indexPath.row
            cell?.btnQuickTip.addTarget(self, action: #selector(quickTipBtnTapped(_:)), for: .touchUpInside)
            
            cell?.btnViewDetails.tag = indexPath.row
            cell?.btnViewDetails.addTarget(self, action: #selector(quickTipBtnTapped(_:)), for: .touchUpInside)
            
            if pricePredection == ""{
                cell?.lblBestPriceTitle.isHidden = true
                cell?.lblPrice.text = "\(pricePredectionLabel)"
            }else{
                cell?.lblBestPriceTitle.isHidden = false
                cell?.lblBestPriceTitle.text = "\(pricePredectionLabel)"
                cell?.lblPrice.text = "\(Utility.shared.getCurrency()?.value(forKey: Utility.shared.currencyvalue) ?? "$")\(pricePredection)"
            }
            cell?.selectionStyle = .none
            
            if self.showQuickTip{
                cell?.viewMainQuickTip.isHidden = false
            }else{
                cell?.viewMainQuickTip.isHidden = true
            }
            return cell!
        }else if indexPath.row == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AffiliateCell", for: indexPath) as? AffiliateCell
            cell?.affiliateListTile.text = "Get more Bookings by Affiliates"
            cell?.tag = ((indexPath.row)+500)
                        
            if let isAffiliate = Utility.shared.step3ValuesInfo["is_affiliate"] as? Int,isAffiliate == 1{
                self.isAffiliate = isAffiliate
                cell?.checkBtn.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
                cell?.checkBtn.tintColor = Theme.PRIMARY_COLOR
                cell?.affiliateStackview.isHidden = false
            }else{
                self.isAffiliate = 0
                cell?.checkBtn.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
                cell?.affiliateStackview.isHidden = true
            }
                        
            cell?.checkBtn.tag = indexPath.row
            cell?.checkBtn.addTarget(self, action: #selector(affiliateCheckBtnTapped(_:)), for: .touchUpInside)
            cell?.selectionStyle = .none
            
            
            cell?.revenueTitleLbl.text = "What % of revenue you want to share if you get Confirmed booking"
            cell?.txtField.attributedPlaceholder = NSAttributedString(string: "0",
                                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            cell?.txtField.tag = 5
            cell?.txtField.addTarget(self, action: #selector(affiliateCommissionText(field:)), for: .editingChanged)
            if(Utility.shared.step3ValuesInfo["affiliate_commission"] != nil && ((Utility.shared.step3ValuesInfo["affiliate_commission"]as? Double) != 0.0))
            {
                affiliateCommission =  "\(Utility.shared.step3ValuesInfo["affiliate_commission"]!)"
                cell?.txtField.text = "\(affiliateCommission)"
            }else {
                cell?.txtField.text = ""
            }

            cell?.revenueTitleLbl.font = UIFont(name: APP_FONT_MEDIUM, size:16)
            cell?.revenueTitleLbl.textColor =  UIColor(named: "Title_Header")
            cell?.txtField.font = UIFont(name: APP_FONT_MEDIUM, size:14)
            cell?.txtField.keyboardType = .decimalPad
            let toolBar = UIToolbar().ToolbarPikerSelect(mySelect: #selector(dismisskeyborad))
            cell?.txtField.inputAccessoryView = toolBar
            toolBar.barTintColor = UIColor(named: "Button_Grey_Color")
            cell?.txtField.inputView = nil
            cell?.txtField.tintColor =  UIColor(named: "Title_Header")
            
            if Utility.shared.isRTLLanguage(){
                cell?.txtField.leftView = nil
                cell?.txtField.leftViewMode = .always
                cell?.txtField.clearButtonMode = .whileEditing
                cell?.txtField.textAlignment = .right
            }else{
                cell?.txtField.rightView = nil
                cell?.txtField.rightViewMode = .always
                cell?.txtField.clearButtonMode = .whileEditing
                cell?.txtField.textAlignment = .left
            }
            
            cell?.txtField.textColor = UIColor(named: "Title_Header")
            let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
            cell?.txtField.leftView = paddingView
            cell?.txtField.leftViewMode = .always
            cell?.selectionStyle = .none
            cell?.txtField.delegate = self

            return cell!
        }else{
            let cell = tableView
                .dequeueReusableCell(withIdentifier: "textfieldcell", for: indexPath) as? TextFieldCell
            if indexPath.row == 1
            {
                cell?.queryTitleLbl.text = "\((Utility.shared.getLanguage()?.value(forKey:"baseprices"))!)"
                
                cell?.selectionStyle = .none
                
                cell?.txtField.attributedPlaceholder = NSAttributedString(string: "\((Utility.shared.getLanguage()?.value(forKey:"pricepernight"))!)",
                                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
                cell?.txtField.tag = 1
                cell?.imgDownArrow.isHidden = true
                
                cell?.txtField.addTarget(self, action: #selector(didChangeText(field:)), for: .editingChanged)
                if(Utility.shared.step3ValuesInfo["basePrice"] != nil)
                {
                    
                    basePriceValue = "\(Utility.shared.step3ValuesInfo["basePrice"]!)"
                    let base_value = Double(basePriceValue)?.clean
                    cell?.txtField.text = "\(base_value!)"
                }
                cell?.queryTitleLbl.font = UIFont(name: APP_FONT_MEDIUM, size:16)
                cell?.queryTitleLbl.textColor =  UIColor(named: "Title_Header")
                cell?.txtField.font = UIFont(name: APP_FONT_MEDIUM, size:14)
                cell?.txtField.keyboardType = .decimalPad
                let toolBar = UIToolbar().ToolbarPikerSelect(mySelect: #selector(dismisskeyborad))
                cell?.txtField.inputAccessoryView = toolBar
                toolBar.barTintColor = UIColor(named: "Button_Grey_Color")
                cell?.txtField.tintColor =  UIColor(named: "Title_Header")
                cell?.txtField.inputView = nil
                if Utility.shared.isRTLLanguage(){
                    cell?.txtField.leftView = nil
                    cell?.txtField.leftViewMode = .always
                    cell?.txtField.clearButtonMode = .whileEditing
                    cell?.txtField.textAlignment = .right
                }else{
                    cell?.txtField.rightView = nil
                    cell?.txtField.rightViewMode = .always
                    cell?.txtField.clearButtonMode = .whileEditing
                    cell?.txtField.textAlignment = .left
                }
                cell?.linetopconstant.constant = 0
                cell?.linebottomconstant.constant = 0
            }
            else if indexPath.row == 0
            {
                cell?.queryTitleLbl.text = "\((Utility.shared.getLanguage()?.value(forKey:"currency"))!)"
                cell?.txtField.attributedPlaceholder = NSAttributedString(string: "",
                                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
                if(Utility.shared.step3ValuesInfo["currency"] != nil)
                {
                    let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:Utility.shared.step3ValuesInfo["currency"]! as! String)
                    if(currencysymbol == (Utility.shared.step3ValuesInfo["currency"] as! String)) {
                        cell?.txtField.text = "\(currencysymbol ?? "USD")"
                    }
                    else {
                    cell?.txtField.text = "\(currencysymbol!) \(Utility.shared.step3ValuesInfo["currency"]!)"
                    }
                    
              //  cell?.txtField.text = "\(Utility.shared.step3ValuesInfo["currency"]!)"
                Utility.shared.currencyvalue = "\(Utility.shared.step3ValuesInfo["currency"]!)"
                    
                }
                else
                {
                    let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:Utility.shared.currencyvalue)
                    if(currencysymbol == Utility.shared.currencyvalue) {
                        cell?.txtField.text = "\(currencysymbol ?? "USD")"
                    }
                    else {
                    cell?.txtField.text = "\(currencysymbol!) \(Utility.shared.currencyvalue)"
                    }
                    
               // cell?.txtField.text = Utility.shared.currencyvalue
                }
                cell?.txtField.tag = 3
               // cell?.imgDownArrow.isHidden = false
                cell?.txtField.tintColor = UIColor.clear
                cell?.queryTitleLbl.font = UIFont(name: APP_FONT_MEDIUM, size:16)
                cell?.queryTitleLbl.textColor =  UIColor(named: "Title_Header")
                cell?.txtField.font = UIFont(name: APP_FONT_MEDIUM, size:14)
                let toolBar = UIToolbar().ToolbarPikerSelect(mySelect: #selector(dismissgenderPicker))
                toolBar.barTintColor = UIColor(named: "Button_Grey_Color")
                cell?.txtField.inputAccessoryView = toolBar
                cell?.txtField.inputView = inputPickerView
                cell?.txtField.delegate = self
                
                cell?.imgDownArrow.isHidden = false
                
//                let downArrowIconView = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 50))
//                let downArrowIcon = UIImageView()
//                if Utility.shared.isRTLLanguage(){
//                    downArrowIcon.frame = CGRect(x: 20, y:((cell?.txtField.frame.size.height)! / 2)-3 , width: 10, height: 10)
//                }else{
//                    downArrowIcon.frame = CGRect(x: 0, y: ((cell?.txtField.frame.size.height)! / 2)-3, width: 10, height: 10)
//                }
//
//                downArrowIcon.image = UIImage(named: "downArrow")
//                downArrowIcon.contentMode = .scaleAspectFit
//                downArrowIconView.tag = indexPath.row
//                downArrowIconView.addTarget(self, action: #selector(onClickedDownArrow), for: .touchUpInside)
//                downArrowIconView.addSubview(downArrowIcon)
//
//                if Utility.shared.isRTLLanguage(){
//                    cell?.txtField.rightView = downArrowIconView
//                    cell?.txtField.rightViewMode = .always
//                    cell?.txtField.clearButtonMode = .whileEditing
//                    cell?.txtField.textAlignment = .right
//                }else{
//                    cell?.txtField.rightView = downArrowIconView
//                    cell?.txtField.rightViewMode = .always
//                    cell?.txtField.clearButtonMode = .whileEditing
//                    cell?.txtField.textAlignment = .left
//                }
                
                cell?.linetopconstant.constant = 0
                cell?.linebottomconstant.constant = 10
            }
            else if indexPath.row == 3
            {
                cell?.queryTitleLbl.text = "\((Utility.shared.getLanguage()?.value(forKey:"cleaningprice"))!)"
                cell?.txtField.attributedPlaceholder = NSAttributedString(string: "\((Utility.shared.getLanguage()?.value(forKey:"cleaningprice"))!)",
                                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
                cell?.txtField.tag = 2
                cell?.txtField.addTarget(self, action: #selector(CleaningText(field:)), for: .editingChanged)
                if(Utility.shared.step3ValuesInfo["cleaningPrice"] != nil && ((Utility.shared.step3ValuesInfo["cleaningPrice"]as? Double) != 0.0))
                {
                 
                    cleaningPriceValue =  "\(Utility.shared.step3ValuesInfo["cleaningPrice"]!)"
                    let cleaning_value = Double(cleaningPriceValue)?.clean
                     cell?.txtField.text = "\(cleaning_value!)"
                }
                else {
                    cell?.txtField.text = ""
                }
                cell?.imgDownArrow.isHidden = true
                cell?.queryTitleLbl.font = UIFont(name: APP_FONT_MEDIUM, size:16)
                cell?.queryTitleLbl.textColor =  UIColor(named: "Title_Header")
                cell?.txtField.font = UIFont(name: APP_FONT_MEDIUM, size:14)
                cell?.txtField.keyboardType = .decimalPad
                let toolBar = UIToolbar().ToolbarPikerSelect(mySelect: #selector(dismisskeyborad))
                cell?.txtField.inputAccessoryView = toolBar
                toolBar.barTintColor = UIColor(named: "Button_Grey_Color")
                cell?.txtField.inputView = nil
                cell?.txtField.tintColor =  UIColor(named: "Title_Header")
                
                if Utility.shared.isRTLLanguage(){
                    cell?.txtField.leftView = nil
                    cell?.txtField.leftViewMode = .always
                    cell?.txtField.clearButtonMode = .whileEditing
                    cell?.txtField.textAlignment = .right
                }else{
                    cell?.txtField.rightView = nil
                    cell?.txtField.rightViewMode = .always
                    cell?.txtField.clearButtonMode = .whileEditing
                    cell?.txtField.textAlignment = .left
                }
                
            }
            
            cell?.txtField.textColor = UIColor(named: "Title_Header")
            cell?.stepnumberLbl.isHidden = true
            cell?.stepnumberLbl.text = ""
            let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
            cell?.txtField.leftView = paddingView
            cell?.txtField.leftViewMode = .always
            cell?.stepOneBottom.constant = 0
            cell?.stepOneHeight.constant = 0
            cell?.stepNumberLblTopConstraint.constant = 0
            cell?.selectionStyle = .none
            cell?.txtField.delegate = self
            return cell!

        }
    }
    
    @objc func onClickedDownArrow(sender: UIButton){
        let cell = tableView.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as! TextFieldCell
        cell.txtField.becomeFirstResponder()
    }
    
    @objc func dismisskeyborad() {
        
        view.endEditing(true)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0
        {
            selectedTextfield = 3
        }
        inputPickerView.reloadAllComponents()
    }
    
    @objc func affiliateCheckBtnTapped(_ sender: UIButton)
    {
        let cell = view.viewWithTag((sender.tag) + 500) as? AffiliateCell
        if let isAffiliate = Utility.shared.step3ValuesInfo["is_affiliate"] as? Int,isAffiliate == 1{
            self.isAffiliate = 0
            Utility.shared.step3ValuesInfo.updateValue(0, forKey: "is_affiliate")
            cell?.checkBtn.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            cell?.affiliateStackview.isHidden = true
        }else{
            self.isAffiliate = 1
            Utility.shared.step3ValuesInfo.updateValue(1, forKey: "is_affiliate")
            cell?.checkBtn.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            cell?.checkBtn.tintColor = Theme.PRIMARY_COLOR
            cell?.affiliateStackview.isHidden = false
        }
    }

    @objc func quickTipBtnTapped(_ sender: UIButton)
    {
        if pricePredection != ""{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PropertyCompareVC") as! PropertyCompareVC
            vc.modalPresentationStyle = .fullScreen
            vc.arrPricingFilter = self.arrPricingFilter
            vc.arrCurrentPricingFilter = self.arrCurrentPricingFilter
            self.present(vc, animated:false, completion: nil)
        }
    }
    
    //MARK: - UIPickerViewDelegate and Datasource
    
    override func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    override func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return  Utility.shared.currencyDataArray.count
    }
    
    override func pickerView( _ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        var titleData = ""
        
        if(selectedTextfield == 3)
        {
            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.currencyDataArray[row].symbol!)
            if(currencysymbol == Utility.shared.currencyDataArray[row].symbol!) {
                titleData = "\(Utility.shared.currencyDataArray[row].symbol!)"
            }
            else {
                titleData = "\(currencysymbol!) \(Utility.shared.currencyDataArray[row].symbol!)"
            }
           // titleData =  Utility.shared.currencyDataArray[row].symbol!
        }
        
        let myTitle = NSAttributedString(string: titleData , attributes: [NSAttributedString.Key.font:UIFont(name: APP_FONT, size: 15.0)!,NSAttributedString.Key.foregroundColor:Theme.PRIMARY_COLOR])
        return myTitle
    }
    
    override func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent  component: Int) {
        
        if(selectedTextfield == 3)
        {
            Utility.shared.currencyvalue =  Utility.shared.currencyDataArray[row].symbol!
            Utility.shared.step3ValuesInfo.updateValue(Utility.shared.currencyvalue, forKey: "currency")
            pickerView.selectRow(row, inComponent: component, animated: true)
            //tableView.reloadData()
        }
    }
    
    @objc func CleaningText(field: UITextField){
        
        if ((field.text?.containsNonEnglishNumbersChecking) != nil) {
            field.text = field.text?.english
            cleaningPriceValue = field.text!
            print(field.text as Any)
        }
    }
    
    @objc func affiliateCommissionText(field: UITextField){
        
        if ((field.text?.containsNonEnglishNumbersChecking) != nil) {
            field.text = field.text?.english
            affiliateCommission = field.text!
            print(field.text as Any)
        }
    }

    
    
    //MARK: - UITextFieldDelegates
    
    override func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTextfield = textField.tag
        inputPickerView.reloadAllComponents()
        
        if selectedTextfield == 1{
                showQuickTip = true
                tableView.reloadRows(at: [IndexPath(row: 2, section: 0)], with: .fade)
        }
    }
    

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentCharacterCount = textField.text?.count ?? 0
        if range.length + range.location > currentCharacterCount || (((textField.text?.contains("."))!) && (string == ".")) {
            return false
        }else{
            let newlength = currentCharacterCount + string.count - range.length
            return newlength <= 5
        }

        return true
    }
    
//    textField.addTarget(self, action: #selector(didChangeText(field:)), for: .editingChanged)
    @objc func didChangeText(field: UITextField) {
        if ((field.text?.containsNonEnglishNumbersChecking) != nil) {
            field.text = field.text?.english
            basePriceValue = field.text!
            print(field.text as Any)
        }
    }

    override func textFieldDidEndEditing(_ textField: UITextField) {
        

     if(textField.text == "." || textField.text?.rangeOfCharacter(from: characterset.inverted) != nil)
     {
        self.view.endEditing(true)
        
       
        if textField.tag == 1
        {
        basePriceValue = textField.text!
        self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"invalidbaseprice"))!)")
        }
        else if textField.tag == 2
        {
          cleaningPriceValue = textField.text!
        self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"invalidcleaning"))!)")
        }
         else if textField.tag == 5
         {
           affiliateCommission = textField.text!
             self.view.makeToast("Invalid Affiliate Commission, only numbers(eg:25) are allowed")
         }
     }
        else
     {
        if textField.tag == 1
        {
            
            basePriceValue = textField.text!
        
            if(basePriceValue != "")
            {
            Utility.shared.host_basePrice = (Double(basePriceValue))!
            Utility.shared.step3ValuesInfo.updateValue((Double(basePriceValue)?.clean)!, forKey: "basePrice")
            } else {
                Utility.shared.host_basePrice = 0.0
                Utility.shared.step3ValuesInfo.updateValue(0.0, forKey: "basePrice")
            }
            
            if selectedTextfield == 1{
                showQuickTip = false
                tableView.reloadRows(at: [IndexPath(row: 2, section: 0)], with: .fade)
            }
        }
        if textField.tag == 2
        {
            cleaningPriceValue = textField.text!
            if(cleaningPriceValue == "")
            {
                Utility.shared.host_cleanPrice = 0.0
                Utility.shared.step3ValuesInfo.updateValue(0.0, forKey: "cleaningPrice")
            }
            else
            {
               Utility.shared.host_cleanPrice = (Double(cleaningPriceValue))!
               Utility.shared.step3ValuesInfo.updateValue((Double(cleaningPriceValue)?.clean)!, forKey: "cleaningPrice")
            }
        }

            if textField.tag == 5
            {
                affiliateCommission = textField.text!
                if(affiliateCommission == "")
                {
                    Utility.shared.affiliate_commission = 0.0
                    Utility.shared.step3ValuesInfo.updateValue(0.0, forKey: "affiliate_commission")
                }
                else
                {
                   Utility.shared.affiliate_commission = (Double(affiliateCommission))!
                   Utility.shared.step3ValuesInfo.updateValue(Double(affiliateCommission)!, forKey: "affiliate_commission")
                }
            }
       // tableView.reloadData()
        }
        
        if textField.tag == 3{
            let indexPaths = IndexPath(item: 0, section: 0)
            tableView.reloadRows(at: [indexPaths], with: .none)
//            tableView.reloadData()
        }
        
        view.endEditing(true)
    }
    
    override func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
extension String {
    var containsNonEnglishNumbersChecking: Bool {
        return !isEmpty && range(of: "[^0-9]", options: .regularExpression) == nil
    }
    
    var english: String {
        return self.applyingTransform(StringTransform.toLatin, reverse: false) ?? self
    }
}
extension FloatingPoint {
  var isInteger: Bool { rounded() == self }
}



extension BasePriceViewController: stepsUpdateProtocol{
    func selectedPage(step: Int, selectedPageIndex: Int) {
        if step == 3{
            switch selectedPageIndex{
            case 6:
                let StepTwoObj = ReviewGuestViewController()
                self.view.window?.backgroundColor = UIColor.white
                StepTwoObj.modalPresentationStyle = .fullScreen
                self.present(StepTwoObj, animated:false, completion: nil)
                break
            case 0:
                let becomeHost = HouseRulesViewController()
                self.view.window?.backgroundColor = UIColor.white
                becomeHost.modalPresentationStyle = .fullScreen
                self.present(becomeHost, animated:false, completion: nil)
                break
//            case 2:
//                let becomeHost = BookInstantViewController()
//                self.view.window?.backgroundColor = UIColor.white
//                becomeHost.modalPresentationStyle = .fullScreen
//                self.present(becomeHost, animated:false, completion: nil)
//                break
            case 1:
                let becomeHost = NoticeArrivalViewController()
                self.view.window?.backgroundColor = UIColor.white
                becomeHost.modalPresentationStyle = .fullScreen
                self.present(becomeHost, animated:false, completion: nil)
                break
//            case 4:
//                let guestListing = BookingWindowViewController()
//                self.view.window?.backgroundColor = UIColor.white
//                guestListing.modalPresentationStyle = .fullScreen
//                self.present(guestListing, animated: false, completion: nil)
//                break
            case 4:
                let guestListing = TripLengthViewController()
                guestListing.modalPresentationStyle = .fullScreen
                self.present(guestListing, animated: false, completion: nil)
                break
            case 2:
               
                break
            case 3:
                let amenities = DiscountViewController()
                self.view.window?.backgroundColor = UIColor.white
                amenities.modalPresentationStyle = .fullScreen
                self.present(amenities, animated: false, completion: nil)
                break
            case 5:
                let amenities = IncreaseEarningViewController()
                self.view.window?.backgroundColor = UIColor.white
                amenities.modalPresentationStyle = .fullScreen
                self.present(amenities, animated: false, completion: nil)
                break
            case 7:
                let amenities = LawAndTaxViewController()
                self.view.window?.backgroundColor = UIColor.white
                amenities.modalPresentationStyle = .fullScreen
                self.present(amenities, animated: false, completion: nil)
                break
            default:
                break
            }
        }
    }
}

