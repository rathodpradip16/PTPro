//
//  ManageCouponVC.swift
//  App
//
//  Created by Phycom Mac Pro on 29/12/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit

class ManageCouponVC: UIViewController {
    
    @IBOutlet weak var viewMainTitle: UIView!
    @IBOutlet weak var viewSubTitle: UIView!
    @IBOutlet weak var viewTab: UIView!
    @IBOutlet weak var viewDelete: UIView!

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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeView()
        self.initialiseDatePicker()
    }

    func initializeView(){
        if isAddCoupon{
            viewMainTitle.isHidden = true
            btnBackSub.isHidden = false
            viewDelete.isHidden = true
            viewTopHeader.isHidden = false
            self.lblAddCoupon.text = "Add Coupon"
        }else{
            viewMainTitle.isHidden = false
            btnBackSub.isHidden = true
            viewTopHeader.isHidden = true
            self.lblAddCoupon.text = "Manage Coupon"
        }
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
    
    @IBAction func onClickDeleteTab(_ sender: Any) {
        
    }
    
    @IBAction func onClickAddCoupon(_ sender: Any) {
        viewSliderWidth.constant = 20
        viewSliderLeading.constant = 110
    }
    
    @IBAction func onClickDeleteCoupon(_ sender: Any) {
        viewSliderWidth.constant = 60
        viewSliderLeading.constant = 138
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
        }else if(validate(textView: txtPromoCodeDesc)){
            self.view.makeToast("Please Enter Description")
        }else{
            self.createCouponCode()
        }
    }
    
    func createCouponCode(){
        let createcouponcodeMutation = PTProAPI.CreatecouponcodeMutation(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""), listId: .some(Int(listID) ?? 0), couponCode: .some(txtPromoCodeName.text ?? ""), couponType: .some("subscription"), discount: .some(Double(txtPromoCodeDiscount.text ?? "0") ?? 0), startDate: .some(selectedStartDate), endDate: .some(selectedEndDate), description: .some(txtPromoCodeDesc.text), userType: .some("admin"))
            Network.shared.apollo_headerClient.perform(mutation: createcouponcodeMutation){  response in
                switch response {
                case .success(let result):
                    if let data = result.data?.createcouponcode?.status,data == 200 {
                        self.dismiss(animated: true)
                    }
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                }
            }
    }
    
    func getCouponCodeAPI(){
        let getcouponcodeQuery = PTProAPI.GetcouponcodeQuery(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""), couponType: .some("subscription"), listId: .some(Int(listID) ?? 0), subscriptionType: .some(""))
            Network.shared.apollo_headerClient.fetch(query: getcouponcodeQuery, cachePolicy: .fetchIgnoringCacheData) { response in
                switch response{
                case .success(let result):
                    if let status = result.data?.getcouponcode?.status,status == 200 {
                        if let data = result.data,let getcouponcodeData = data.getcouponcode,let arrCouponData = getcouponcodeData.data,arrCouponData.count != 0,let cData = arrCouponData.first{
                            if let couponData = cData{
                                self.txtPromoCodeName.text = couponData.couponCode ?? ""
                                self.txtPromoCodeDiscount.text = "\(couponData.discount ?? 0.0)"
                                
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
                    } else {
                        self.view.makeToast(result.data?.getcouponcode?.errorMessage)
                    }
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                    break
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
    
    
}
