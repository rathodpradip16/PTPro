//
//  ManageCouponVC.swift
//  App
//
//  Created by Phycom Mac Pro on 29/12/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit
import QuartzCore
import Lottie

class ManageCouponVC: UIViewController {
    
    @IBOutlet weak var offlineView: UIView!
    var lottieWholeView = UIView()
    var lottieView: LottieAnimationView!
    @IBOutlet weak var retryBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!

    @IBOutlet weak var viewMainTitle: UIView!
    @IBOutlet weak var viewSubTitle: UIView!
    @IBOutlet weak var viewTab: UIView!
    @IBOutlet weak var viewDelete: UIView!
    @IBOutlet weak var viewDeleteCoupon: UIView!

    @IBOutlet weak var viewSlider: UIView!
    @IBOutlet weak var viewSliderWidth: NSLayoutConstraint!
    @IBOutlet weak var viewSliderLeading: NSLayoutConstraint!

    @IBOutlet weak var btnBackMain: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var btnBackSub: UIButton!
    @IBOutlet weak var btnDeleteCoupon: UIButton!
    
    @IBOutlet weak var lblAddCoupon: UILabel!
    @IBOutlet weak var lblManageCoupon: UILabel!
    @IBOutlet weak var lblCouponName: UILabel!
    
    @IBOutlet weak var lblCodeDesc: UILabel!
    @IBOutlet weak var lblPromoCodeName: UILabel!
    @IBOutlet weak var lblPromoCodeDiscount: UILabel!
    @IBOutlet weak var lblCodeStartDate: UILabel!
    @IBOutlet weak var lblCodeEndDate: UILabel!
    
    @IBOutlet weak var txtPromoCodeName: CustomUITextField!
    @IBOutlet weak var txtPromoCodeDiscount: CustomUITextField!
    @IBOutlet weak var txtCodeStartDate: CustomUITextField!
    @IBOutlet weak var txtCodeEndDate: CustomUITextField!
    @IBOutlet weak var txtPromoCodeDesc: UITextView!
    
    @IBOutlet weak var viewCoupon: UIView!
    @IBOutlet weak var scrollCoupon: UIScrollView!
    
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var viewTopHeader: UIView!

    var isFromMangeCoupon = false

    var listID = String()
    var isAddCoupon = false
    
    var datePickerStartDate : UIDatePicker?
    var datePickerEndDate: UIDatePicker?
    var selectedStartDate = ""
    var selectedEndDate = ""
    var couponDetail:PTProAPI.GetCouponEditQuery.Data.GetCouponEdit.Datum?
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        lottieView = LottieAnimationView.init(name: "loading_qwe")
        self.initializeView()
        self.initialiseDatePicker()
    }
    
    func initialSetup()
    {
        offlineView.backgroundColor =  UIColor(named: "Button_Grey_Color")
        self.offlineView.isHidden = true
        errorLabel.textColor =  UIColor(named: "Title_Header")
        retryBtn.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        errorLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"error_field"))!)"
        retryBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"retry"))!)", for:.normal)
        errorLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 15)
        retryBtn.titleLabel?.font = UIFont(name: APP_FONT, size: 15)
    }

    func initializeView(){
        if isAddCoupon{
            viewMainTitle.isHidden = true
            btnBackSub.isHidden = false
            viewDelete.isHidden = true
            viewTopHeader.isHidden = false
            self.lblAddCoupon.text = "Add Coupon"
        }else{
            self.viewSliderWidth.constant = 110
            self.viewSliderLeading.constant =  20
            self.viewCoupon.isHidden = false
            self.viewSubTitle.isHidden = false
            self.viewDelete.isHidden = true

            viewMainTitle.isHidden = false
            btnBackSub.isHidden = true
            viewTopHeader.isHidden = true
            self.lblAddCoupon.text = "Update Coupon"
            self.getCouponEditAPI()
        }
        
        let yourViewBorder = CAShapeLayer()
        yourViewBorder.strokeColor = UIColor.black.cgColor
        yourViewBorder.lineDashPattern = [2, 2]
        yourViewBorder.frame = viewDeleteCoupon.bounds
        yourViewBorder.fillColor = nil
        yourViewBorder.path = UIBezierPath(rect: viewDeleteCoupon.bounds).cgPath
        viewDeleteCoupon.layer.addSublayer(yourViewBorder)
    }
    
    func initialiseDatePicker(){
        txtCodeStartDate.tintColor = .clear
        txtCodeEndDate.tintColor = .clear
        
        let screenWidth = UIScreen.main.bounds.width
        datePickerStartDate = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        datePickerEndDate = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        
        //Start Date date Picker
        if #available(iOS 13.4, *) {
            datePickerStartDate!.preferredDatePickerStyle  = .wheels
            datePickerStartDate!.sizeToFit()
        }
        datePickerStartDate!.datePickerMode = .date
        datePickerStartDate!.sizeToFit()
        txtCodeStartDate.inputView = datePickerStartDate
        //ToolBar
        let toolbarStartDate = UIToolbar();
        toolbarStartDate.sizeToFit()
        let doneButtonStartDate = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneStartDatePicker));
        let spaceButtonStartDate = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButtonStartDate = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        toolbarStartDate.setItems([cancelButtonStartDate,spaceButtonStartDate,doneButtonStartDate], animated: false)
        txtCodeStartDate.inputAccessoryView = toolbarStartDate
        
        //End Date
        datePickerEndDate!.datePickerMode = .date
        
        if #available(iOS 13.4, *) {
            datePickerEndDate!.preferredDatePickerStyle  = .wheels
            datePickerEndDate!.sizeToFit()
        }
        txtCodeEndDate.inputView = datePickerEndDate
        
        //ToolBar
        let toolbarEndDate = UIToolbar();
        toolbarEndDate.sizeToFit()
        let doneButtonEndDate = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneEndDatePicker));
        let spaceButtonEndDate  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButtonEndDate  = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbarEndDate.setItems([cancelButtonEndDate,spaceButtonEndDate,doneButtonEndDate], animated: false)
        
        txtCodeEndDate.inputAccessoryView = toolbarEndDate
        
        datePickerStartDate!.date = Date()   // Calendar.current.date(byAdding: .month, value: -1, to: Date())!
        datePickerEndDate!.date = Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        selectedStartDate = formatter.string(from: datePickerStartDate!.date)
        selectedEndDate = formatter.string(from: datePickerEndDate!.date)
        
        self.updateDateMaxMin()
    }
    
    func updateDateMaxMin(){
        datePickerStartDate!.minimumDate =  Date()
        datePickerEndDate!.minimumDate = datePickerStartDate!.date
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if ((formatter.date(from: selectedStartDate) ?? Date()).compare((formatter.date(from: selectedEndDate) ?? Date())) == .orderedDescending){
            txtCodeEndDate.text = ""
            selectedEndDate = ""
        }
    }
    
    @objc func doneStartDatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        txtCodeStartDate.text = formatter.string(from: datePickerStartDate!.date)
        selectedStartDate = formatter.string(from: datePickerStartDate!.date)
        self.updateDateMaxMin()
        self.view.endEditing(true)
    }
    
    @objc func doneEndDatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        txtCodeEndDate.text = formatter.string(from: datePickerEndDate!.date)
        selectedEndDate = formatter.string(from: datePickerEndDate!.date)
        self.updateDateMaxMin()
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    @IBAction func retryBtnTapped(_ sender: Any){
        if Utility.shared.isConnectedToNetwork(){
            self.offlineView.isHidden = true
        }
    }
    
    @IBAction func onClickDeleteTab(_ sender: Any) {
        UIView.animate(withDuration: 1.0) {
            
        } completion: { sucess in
            self.viewSliderWidth.constant = 60
            self.viewSliderLeading.constant = 138
            self.viewCoupon.isHidden = true
            self.viewSubTitle.isHidden = true
            self.viewDelete.isHidden = false
        }
    }
    
    @IBAction func onClickAddCoupon(_ sender: Any) {
        self.viewSubTitle.isHidden = false
        UIView.animate(withDuration: 1.0) {
            
        } completion: { sucess in
            self.viewSliderWidth.constant = 110
            self.viewSliderLeading.constant =  20
            self.viewCoupon.isHidden = false
            self.viewDelete.isHidden = true
        }
    }
    
    @IBAction func onClickDeleteCoupon(_ sender: Any) {
        let alert = UIAlertController(title: "Delete Confirmation", message: String(format: "\n Are you sure want to delete this item? \n") , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
        }))
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { action in
            self.deleteCouponCode()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func onClickBtnSave(_ sender: Any) {
        if(txtPromoCodeName.isEmpty()){
            self.view.makeToast("Please Enter Promo-Code")
        }else if(txtPromoCodeDiscount.isEmpty()){
            self.view.makeToast("Please Enter Discount")
        }else if(txtCodeStartDate.isEmpty()){
            self.view.makeToast("Please Enter Start Date")
        }else if(txtCodeEndDate.isEmpty()){
            self.view.makeToast("Please Enter End Date")
        }else if(!validate(textView: txtPromoCodeDesc)){
            self.view.makeToast("Please Enter Description")
        }else{
            self.createCouponCode()
        }
    }
    
    func createCouponCode(){
        if Utility.shared.isConnectedToNetwork(){
            self.lottieAnimation()
            let createcouponcodeMutation = PTProAPI.CreatecouponcodeMutation(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""), listId: .some(Int(listID) ?? 0), couponCode: .some(txtPromoCodeName.text ?? ""), couponType: .some("booking"), discount: .some(Double(txtPromoCodeDiscount.text ?? "0") ?? 0), startDate: .some(selectedStartDate), endDate: .some(selectedEndDate), description: .some(txtPromoCodeDesc.text), userType: .some("admin"))
            Network.shared.apollo_headerClient.perform(mutation: createcouponcodeMutation){  response in
                self.lottieView.isHidden = true
                self.lottieWholeView.isHidden = true
                switch response {
                case .success(let result):
                    if let data = result.data?.createcouponcode?.status,data == 200 {
                        self.dismiss(animated: true) {
                            AppDelegate().window?.rootViewController?.view.makeToast("Coupon Added")
                        }
                    }else if let data = result.data?.createcouponcode?.status,data == 201 {
                        self.dismiss(animated: true) {
                            AppDelegate().window?.rootViewController?.view.makeToast("Coupon Updated")
                        }
                    }
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                }
            }
        }else{
            self.offlineView.isHidden = false
            let shadowSize2 : CGFloat = 3.0
            let shadowPath2 = UIBezierPath(rect: CGRect(x: -shadowSize2 / 2,
                                                        y: -shadowSize2 / 2,
                                                        width: self.offlineView.frame.size.width + shadowSize2,
                                                        height: self.offlineView.frame.size.height + shadowSize2))
            
            self.offlineView.layer.masksToBounds = false
            self.offlineView.layer.shadowColor = Theme.TextLightColor.cgColor
            self.offlineView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            self.offlineView.layer.shadowOpacity = 0.3
            self.offlineView.layer.shadowPath = shadowPath2.cgPath
            if IS_IPHONE_X || IS_IPHONE_XR{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-130, width: FULLWIDTH, height: 55)
            }else{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-100, width: FULLWIDTH, height: 55)
            }
        }
    }
    
    func deleteCouponCode(){
        if Utility.shared.isConnectedToNetwork(){
            self.lottieAnimation()
            if let couponData = couponDetail{
                let deleteCouponMutation = PTProAPI.DeleteCouponMutation(id:  couponData.id ?? 0 , couponCode: .some(couponData.couponCode ?? ""))
                Network.shared.apollo_headerClient.perform(mutation: deleteCouponMutation){  response in
                    self.lottieView.isHidden = true
                    self.lottieWholeView.isHidden = true
                    switch response {
                    case .success(let result):
                        if let data = result.data?.deleteCoupon?.status,data == 200 {
                            self.dismiss(animated: true) {
                                AppDelegate().window?.rootViewController?.view.makeToast("Deleted Successfully")
                            }
                        }
                    case .failure(let error):
                        self.view.makeToast(error.localizedDescription)
                    }
                }
            }
        }else{
            self.offlineView.isHidden = false
            let shadowSize2 : CGFloat = 3.0
            let shadowPath2 = UIBezierPath(rect: CGRect(x: -shadowSize2 / 2,
                                                        y: -shadowSize2 / 2,
                                                        width: self.offlineView.frame.size.width + shadowSize2,
                                                        height: self.offlineView.frame.size.height + shadowSize2))
            
            self.offlineView.layer.masksToBounds = false
            self.offlineView.layer.shadowColor = Theme.TextLightColor.cgColor
            self.offlineView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            self.offlineView.layer.shadowOpacity = 0.3
            self.offlineView.layer.shadowPath = shadowPath2.cgPath
            if IS_IPHONE_X || IS_IPHONE_XR{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-130, width: FULLWIDTH, height: 55)
            }else{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-100, width: FULLWIDTH, height: 55)
            }
        }
    }
    
    func getCouponEditAPI(){
        if Utility.shared.isConnectedToNetwork(){
            self.lottieAnimation()
            let getcouponcodeQuery = PTProAPI.GetCouponEditQuery(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""), couponType: .some("booking"), listId: .some(Int(listID) ?? 0), subscriptionType: .some(""))
            Network.shared.apollo_headerClient.fetch(query: getcouponcodeQuery, cachePolicy: .fetchIgnoringCacheData) { response in
                self.lottieView.isHidden = true
                self.lottieWholeView.isHidden = true
                switch response{
                case .success(let result):
                    if let status = result.data?.getCouponEdit?.status,status == 200 {
                        if let data = result.data,let getcouponcodeData = data.getCouponEdit,let arrCouponData = getcouponcodeData.data,arrCouponData.count != 0,let cData = arrCouponData.first{
                            if let couponData = cData{
                                self.couponDetail = couponData
                                DispatchQueue.main.async{
                                    self.txtPromoCodeName.text = couponData.couponCode ?? ""
                                    self.txtPromoCodeDiscount.text = "\(couponData.discount ?? 0.0)"
                                    self.lblCouponName.text = couponData.couponCode ?? ""
                                    
                                    let formatter = DateFormatter()
                                    formatter.dateFormat = "yyyy-MM-dd"
                                    self.selectedStartDate = couponData.startDate ?? ""
                                    self.txtCodeStartDate.text = couponData.startDate
                                    self.datePickerStartDate?.date = formatter.date(from:  self.selectedStartDate) ?? Date()
                                    
                                    self.selectedEndDate = couponData.endDate ?? ""
                                    self.txtCodeEndDate.text = couponData.endDate
                                    self.datePickerEndDate?.date = formatter.date(from:  self.selectedEndDate)  ?? Date()
                                    
                                    self.txtPromoCodeDesc.text = couponData.description
                                }
                            }
                        }
                    } else {
                        self.view.makeToast(result.data?.getCouponEdit?.errorMessage)
                    }
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                    break
                }
            }
        }else{
            self.lottieView.isHidden = true
            self.offlineView.isHidden = false
            let shadowSize2 : CGFloat = 3.0
            let shadowPath2 = UIBezierPath(rect: CGRect(x: -shadowSize2 / 2,
                                                        y: -shadowSize2 / 2,
                                                        width: self.offlineView.frame.size.width + shadowSize2,
                                                        height: self.offlineView.frame.size.height + shadowSize2))
            
            self.offlineView.layer.masksToBounds = false
            self.offlineView.layer.shadowColor = Theme.TextLightColor.cgColor
            self.offlineView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            self.offlineView.layer.shadowOpacity = 0.3
            self.offlineView.layer.shadowPath = shadowPath2.cgPath
            if IS_IPHONE_X || IS_IPHONE_XR{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-130, width: FULLWIDTH, height: 55)
            }else{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-100, width: FULLWIDTH, height: 55)
            }
        }
    }
    
    
    func validate(textView: UITextView) -> Bool {
        guard let text = textView.text,
            !text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty else {
            // this will be reached if the text is nil (unlikely)
            // or if the text only contains white spaces
            // or no text at all
            return false
        }
        return true
    }

    @IBAction func onClickBtnEndDate(_ sender: Any) {
        self.view.endEditing(true)
        txtCodeEndDate.becomeFirstResponder()
    }
    
    @IBAction func onClickBtnStartDate(_ sender: Any) {
        self.view.endEditing(true)
        txtCodeStartDate.becomeFirstResponder()
    }
    
    @IBAction func onClickBtnPercent(_ sender: Any) {
        txtPromoCodeDiscount.becomeFirstResponder()
    }
    
    //MARK: - Animation
    func lottieAnimation()
    {
        self.lottieView.isHidden = false
        self.lottieWholeView.isHidden = false
        self.lottieWholeView.frame = CGRect(x: 0, y: 0, width: FULLWIDTH, height: FULLHEIGHT)
        self.lottieWholeView.backgroundColor =  UIColor.black.withAlphaComponent(0.5)
        self.view.addSubview(lottieWholeView)
        self.lottieView.frame = CGRect(x:FULLWIDTH/2-50, y: FULLHEIGHT/2-180, width: 100, height: 100)
        self.lottieWholeView.addSubview(self.lottieView)
        self.lottieView.backgroundColor = UIColor(named: "lottie-bg")
      
        self.lottieView.layer.cornerRadius = 6.0
        self.lottieView.clipsToBounds = true
        self.lottieView.play()
        Timer.scheduledTimer(timeInterval:0.3, target: self, selector: #selector(autoscroll), userInfo: nil, repeats: true)
    }
    
    @objc func autoscroll()
    {
        self.lottieView.play()
    }
}
