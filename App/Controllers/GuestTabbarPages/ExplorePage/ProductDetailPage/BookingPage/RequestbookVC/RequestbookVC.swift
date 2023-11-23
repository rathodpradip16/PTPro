//
//  RequestbookVC.swift
//  App
//
//  Created by RadicalStart on 27/05/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import Apollo
import MKToolTip
import Lottie

protocol RequestbookVCDelegate {
    func passSelectedStartDate(selectedstartDate:Date)
    func passSelectedEndDate(selectedenddate:Date)
    func billingListAPICall(startDate:String, endDate:String)
    
}


class RequestbookVC: UIViewController,UITableViewDelegate,UITableViewDataSource,AirbnbDatePickerDelegate,AirbnbOccupantFilterControllerDelegate,checkTextviewCellDelegate{
    
   
    
    
    //MARK******************************* IBOUTLET CONNECTIONS ***********************************************************>
    
    @IBOutlet weak var offlineView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet var lblHeader: UILabel!
    
    @IBOutlet var backBtn: UIButton!
    @IBOutlet weak var retryBtn: UIButton!
    @IBOutlet weak var errorLAbel: UILabel!
    @IBOutlet weak var bookBtn: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var requestTable: UITableView!
    var viewListingArray : PTProAPI.ViewListingDetailsQuery.Data.ViewListing.Results?
     var currencyvalue_from_API_base = String()
    var currency_Dict = NSDictionary()
     var lottieView: LottieAnimationView!
    public var selectedStartDate: Date?
    public var selectedEndDate: Date?
    var delegate:RequestbookVCDelegate?
    var ProfileAPIArray : PTProAPI.GetProfileQuery.Data.UserAccount.Result?
    var addDateinLabel = String()
    var addDateoutLabel = String()
    var totalPriceLabel = String()
    var guestLabel_text = String()
    
    var adultCount: Int = 1
    var childrenCount: Int = 0
    var infantCount: Int = 0
    var hasPet: Bool = false
    var isFromMessage = false
    var isFromCalendar = false
     var guest_filter = Int()
   
    
    
    var getbillingArray : PTProAPI.GetBillingCalculationQuery.Data.GetBillingCalculation.Result?
    override func viewDidLoad() {
        super.viewDidLoad()
        offlineView.backgroundColor =  UIColor(named: "Button_Grey_Color")
         self.initialsetUp()
        bookBtn.layer.cornerRadius = (bookBtn.frame.size.height / 2)
        lottieView = LottieAnimationView.init(name: "animation_white")
        //self.profileAPICall()
        // Do any additional setup after loading the view.
    }

    @IBAction func closeBtnTapped(_ sender: Any) {
        if(selectedStartDate != nil && selectedEndDate != nil)
        {
        let cell = view.viewWithTag((2) + 2000) as? checkTextviewCell
        Utility.shared.booking_message = (cell?.checkTxtview.text!)!
        self.delegate?.passSelectedStartDate(selectedstartDate: selectedStartDate!)
        self.delegate?.passSelectedEndDate(selectedenddate: selectedEndDate!)
        let fmt = DateFormatter()
          //  fmt.timeZone = TimeZone(abbreviation: "UTC")
        fmt.dateFormat = "yyyy-MM-dd"
        self.delegate?.billingListAPICall(startDate: fmt.string(from: selectedStartDate!), endDate: fmt.string(from: selectedEndDate!))
        self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func retryBtnTapped(_ sender: Any) {
        if Utility.shared.isConnectedToNetwork(){
            offlineView.isHidden = true
            self.bottomView.isHidden = false
            let fmt = DateFormatter()
         //   fmt.timeZone = TimeZone(abbreviation: "UTC")
            fmt.dateFormat = "yyyy-MM-dd"
            if(selectedStartDate != nil && selectedEndDate != nil)
            {
                billingListAPICall(startDate: fmt.string(from: selectedStartDate!), endDate: fmt.string(from: selectedEndDate!)) }
        }
    }
    @IBAction func requestBookBtnTapped(_ sender: Any) {
         if Utility.shared.isConnectedToNetwork(){
             self.lottieanimation()
             let cell = view.viewWithTag((2) + 2000) as? checkTextviewCell
              Utility.shared.booking_message = (cell?.checkTxtview.text!)!
            // self.profileAPICall()
             
             if(Utility.shared.booking_message == "")
            {
             self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"messagealert"))!)")
                 lottieView.isHidden = true
             } else{
                 
                self.profileAPICall()
                             
                 
             }
             

       
        }
         else
         {
           
            self.offlineView.isHidden = false
            self.bottomView.isHidden = true
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
            if IS_IPHONE_X || IS_IPHONE_XR {
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-85, width: FULLWIDTH, height: 55)
            }else{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-55, width: FULLWIDTH, height: 55)
            }
        }
    }
    
    func initialsetUp()
    {
        if IS_IPHONE_XR
        {
            self.topView.frame = CGRect(x: 0, y: 0, width: FULLWIDTH-40, height: 80)
            requestTable.frame = CGRect(x: 0, y: 85, width: FULLWIDTH-40, height: FULLHEIGHT-300)
            
        }
        
        self.view.backgroundColor = UIColor(named: "colorController")
        bottomView.backgroundColor = UIColor(named: "colorController")
        lblHeader.font = UIFont(name:APP_FONT_SEMIBOLD, size: 18)
        lblHeader.text = "\((Utility.shared.getLanguage()?.value(forKey:"reviewpay_small"))!)"
        lblHeader.textColor = UIColor(named: "Title_Header")
        bookBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 15)
        errorLAbel.font = UIFont(name: APP_FONT, size: 15)
        retryBtn.titleLabel?.font = UIFont(name: APP_FONT, size: 15)
        requestTable.register(UINib(nibName: "ContactheaderCell", bundle: nil), forCellReuseIdentifier: "ContactheaderCell")
        requestTable.register(UINib(nibName: "contactcheckCell", bundle: nil), forCellReuseIdentifier: "contactcheckCell")
        requestTable.register(UINib(nibName: "RequestBookcellTableViewCell", bundle: nil), forCellReuseIdentifier: "RequestBookcellTableViewCell")
        requestTable.register(UINib(nibName: "ReservationCell", bundle: nil), forCellReuseIdentifier: "ReservationCell")
        requestTable.register(UINib(nibName: "BookingTotalCell", bundle: nil), forCellReuseIdentifier: "BookingTotalCell")
        requestTable.register(UINib(nibName: "TripsLocationCell", bundle: nil), forCellReuseIdentifier: "TripsLocationCell")
        requestTable.register(UINib(nibName: "bookcancellationCell", bundle: nil), forCellReuseIdentifier: "bookcancellationCell")
        requestTable.register(UINib(nibName: "AgreetermsCell", bundle: nil), forCellReuseIdentifier: "AgreetermsCell")
        requestTable.register(UINib(nibName: "checkTextviewCell", bundle: nil), forCellReuseIdentifier: "checkTextviewCell")
        let shadowSize : CGFloat = 3.0
        let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
                                                   y: -shadowSize / 2,
                                                   width: self.bottomView.frame.size.width+40 + shadowSize,
                                                   height: self.bottomView.frame.size.height + shadowSize))

        self.bottomView.layer.masksToBounds = false
        self.bottomView.layer.shadowColor = Theme.TextLightColor.cgColor
        self.bottomView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.bottomView.layer.shadowOpacity = 0.3
        self.bottomView.layer.shadowPath = shadowPath.cgPath
        bookBtn.backgroundColor = Theme.SECONDARY_COLOR
        
       
            if(Utility.shared.isRTLLanguage()) {
                backBtn.imageView?.performRTLTransform()
                lblHeader.textAlignment = .right
            }
           else{
          
          }
//        let shadowPath1 = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
//                                                    y: -shadowSize / 2,
//                                                    width: self.topView.frame.size.width+40 + shadowSize,
//                                                    height: self.topView.frame.size.height + shadowSize))
//        self.topView.layer.masksToBounds = false
//        self.topView.layer.shadowColor = Theme.TextLightColor.cgColor
//        self.topView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//        self.topView.layer.shadowOpacity = 0.3
//        self.topView.layer.shadowPath = shadowPath1.cgPath
        if(viewListingArray?.bookingType! == "instant")
        {
            self.bookBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"addpayment"))!)", for: .normal)
        }
        else
        {
           self.bookBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"addpayment"))!)", for: .normal)
        }
        self.offlineView.isHidden = true
        errorLAbel.textColor =  UIColor(named: "Title_Header")
        retryBtn.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        errorLAbel.text = "\((Utility.shared.getLanguage()?.value(forKey:"error_field"))!)"
        retryBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"retry"))!)", for:.normal)
    }
     func numberOfSections(in tableView: UITableView) -> Int {
       return 8
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       if(section == 4)
       {
        if(getbillingArray?.cleaningPrice == 0)
        {
            if(getbillingArray?.discountLabel != nil && getbillingArray?.discount != 0)
            {
                return 3
            }
            return 2
            
        }
        else
        {
            if(getbillingArray?.discountLabel != nil && getbillingArray?.discount != 0 )
            {
                return 4
            }
             return 3
        }
        
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0)
        {
            return 125
        }
        else if(indexPath.section == 1)
        {
            return  167
        }
        else if(indexPath.section == 2)
        {
            return  180
        }
            else if(indexPath.section == 3)
        {
            return 45
        }
            else if(indexPath.section == 4)
        {
            return 40
        }
        else if(indexPath.section == 6)
    {
            return UITableView.automaticDimension
    }
        
        else if(indexPath.section == 7)
    {
             return UITableView.automaticDimension
    }
        else{
            return 100
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TripsLocationCell", for: indexPath)as! TripsLocationCell
            cell.selectionStyle = .none
            
            var listTypeString = ""
            listTypeString = "\(viewListingArray?.roomType ?? "")"
            if ((viewListingArray?.beds ?? 0) > 1){
                listTypeString = listTypeString + " / " + "\(viewListingArray?.beds ?? 0)" + " beds"
            }else if ((viewListingArray?.beds ?? 0) == 1){
                listTypeString = listTypeString + " / " + "\(viewListingArray?.beds ?? 0)" + " bed"
            }
           
            cell.lblRoomType.text = listTypeString
            
            
           
            cell.lblDescription.text = viewListingArray?.title
            
            
            
          
            
          
            
            let value1 = Float(viewListingArray?.reviewsCount ?? 0)
            let value2 = Float(viewListingArray?.reviewsStarRating ?? 0)
            if(value2 != 0.0){
                let reviewcount = (value2/value1)
                
                let divideValue = value2/value1
                cell.lblRating.setTitle(" \(Int(divideValue.rounded()))", for: .normal)
                
               
                cell.lblRating.isHidden = false
                cell.lblReview.isHidden = false
                cell.lblRatingTop.constant = 12
                cell.lblReviewTop.constant = 12
                cell.lblDescriptionTop.constant = 5.5
            }
            else{
                cell.lblRating.titleLabel?.text = " 0.0 "
                cell.lblRating.isHidden = true
                cell.lblReview.isHidden = true
                cell.lblRatingTop.constant = 0
                cell.lblReviewTop.constant = 0
                cell.lblDescriptionTop.constant = 0
            }
            
            
            
            
            if((viewListingArray?.reviewsCount! ?? 0) > 0)
            {
                if((viewListingArray?.reviewsCount!) == 1) {
                    cell.lblReview.text = "\u{2022} \(viewListingArray?.reviewsCount ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"review"))!)"
                }
                else {
                cell.lblReview.text = "\u{2022} \(viewListingArray?.reviewsCount ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"reviews"))!)"
                }
            }
            else
            {
                cell.lblReview.text = "\u{2022} \((Utility.shared.getLanguage()?.value(forKey:"delete_no"))!) \((Utility.shared.getLanguage()?.value(forKey:"reviews"))!)"
                
            }
            
          
            if let imgURL = viewListingArray?.listPhotos?[0]?.name {
            cell.imgView.sd_setImage(with: URL(string: "\(IMAGE_LISTING_MEDIUM)\(imgURL)"), placeholderImage: #imageLiteral(resourceName: "placeholderimg"))
                cell.imgView.halfroundedCorners(corners:[.topLeft, .bottomRight] , radius: 10)
           print(imgURL)
            }
            return cell
        }
        else if(indexPath.section == 1)
        {
          let cell = tableView.dequeueReusableCell(withIdentifier: "contactcheckCell", for: indexPath)as! contactcheckCell
            cell.selectionStyle = .none
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = "yyyy-MM-dd"
           // inputFormatter.timeZone = TimeZone(abbreviation: "UTC")
            if(getbillingArray?.checkIn != nil) {
                let showDate = inputFormatter.date(from:getbillingArray?.checkIn! ?? "")
            
                let showDate2 = inputFormatter.date(from:getbillingArray?.checkOut! ?? "")
            inputFormatter.dateFormat = "MMM dd"
//                if(Utility.shared.isRTLLanguage()) {
//                    inputFormatter.locale = NSLocale(localeIdentifier:"en") as Locale
//                }
//                else {
//                    inputFormatter.locale = NSLocale(localeIdentifier:Utility.shared.getAppLanguageCode()!) as Locale
//                }
            addDateinLabel = inputFormatter.string(from: showDate!)
            addDateoutLabel = inputFormatter.string(from: showDate2!)
            
            cell.checkinoutLabel.text = "\(addDateinLabel) - \(addDateoutLabel)"
            }
//            cell.addDateinLabel.setTitle(addDateinLabel, for: .normal)
//            cell.addOutDateLabel.setTitle(addDateoutLabel, for: .normal)
            if(guestLabel_text == "")
            {
                if Utility.shared.guestc == "" {
                    cell.guestCountsLabel.text = "\(Utility.shared.guestCountToBeSend) \((Utility.shared.getLanguage()?.value(forKey:"guest"))!)"
                cell.checkguestLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"guest"))!)"
                }
                else {
                    if Utility.shared.guestc == "1" {
                        cell.guestCountsLabel.text = "\(Utility.shared.guestCountToBeSend) \((Utility.shared.getLanguage()?.value(forKey:"guest"))!)"
                        cell.checkguestLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"guest"))!)"
                    }
                    else {
                        cell.guestCountsLabel.text = "\(Utility.shared.guestCountToBeSend)"
                        cell.checkguestLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"guests"))!)"
                    }
                }
//            cell.guestLabel.setTitle("1 \((Utility.shared.getLanguage()?.value(forKey:"guest"))!)", for: .normal)
            }
            else{
//              cell.guestLabel.setTitle(guestLabel_text, for: .normal)
                if Utility.shared.guestc == "" {
                    guestLabel_text = Utility.shared.guestc
                    cell.guestCountsLabel.text = "\(Utility.shared.guestCountToBeSend)"
                    cell.checkguestLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"guests"))!)"
                }
                else {
                cell.guestCountsLabel.text = "\(Utility.shared.guestCountToBeSend)"
                cell.checkguestLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"guests"))!)"
                }
            }
            if(isFromMessage){
                cell.addOutDateLabel.isHidden = true
                cell.guestLabel.isHidden = true
                cell.checkinimg.isHidden = true
                cell.guestImg.isHidden = true
            }
            else {
                cell.addOutDateLabel.isHidden = false
                cell.guestLabel.isHidden = false
                cell.checkinimg.isHidden = false
                cell.guestImg.isHidden = false
            }
            cell.addOutDateLabel.addTarget(self, action: #selector(addinBtnTapped), for: .touchUpInside)
            cell.guestLabel.addTarget(self, action: #selector(guestBtnTapped), for: .touchUpInside)
            return cell
        }
        else if(indexPath.section == 2)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "checkTextviewCell", for: indexPath)as! checkTextviewCell
            cell.selectionStyle = .none
            cell.tag = indexPath.section+2000
            if(Utility.shared.booking_message != "")
            {
                cell.checkTxtview.text = Utility.shared.booking_message
                cell.placeholderLabel.isHidden = true
            } else{
                cell.checkTxtview.text = ""
            }
            let toolBar = UIToolbar().ToolbarPikerSelect(mySelect: #selector(dismissgenderPicker))
            toolBar.barTintColor = UIColor(named: "Button_Grey_Color")
            cell.checkTxtview.inputAccessoryView = toolBar
            cell.checkTxtview.autocorrectionType = UITextAutocorrectionType.no
//            cell.checkTxtview.becomeFirstResponder()
            return cell
        }
        else if(indexPath.section == 3)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReservationCell", for: indexPath)as! ReservationCell
            cell.selectionStyle = .none
            return cell
        }
        else if(indexPath.section == 4)
        {
           
             
          
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestBookcellTableViewCell", for: indexPath)as! RequestBookcellTableViewCell
        cell.selectionStyle = .none
        var currencysymbol = String()
        cell.specialImage.isHidden = true
        cell.specialImage.addTarget(self, action: #selector(tooltipBtnTapped),for:.touchUpInside)
            
            if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
            {
            currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)!
        }
        else
        {
            currencysymbol = Utility.shared.getSymbol(forCurrencyCode:self.currencyvalue_from_API_base)!
        }
            
            if(getbillingArray?.cleaningPrice == 0)
            {
                if(getbillingArray?.discountLabel != nil && getbillingArray?.discount != 0)
                {
                    if(indexPath.row == 0)
                    {
//                        cell.priceLabel.text =  "\(currencysymbol)\(getbillingArray?.averagePrice!.clean) x \(Utility.shared.numberofnights_Selected) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)\(Utility.shared.numberofnights_Selected > 1 ? "s" : "")"
                        
                        if Utility.shared.numberofnights_Selected > 1 {
                            cell.priceLabel.text = "\(currencysymbol)\(getbillingArray?.averagePrice!.clean ?? "") x \(Utility.shared.numberofnights_Selected) \((Utility.shared.getLanguage()?.value(forKey:"nights")) ?? "nights")"
                        }else{
                            cell.priceLabel.text = "\(currencysymbol)\(getbillingArray?.averagePrice!.clean ?? "") x \(Utility.shared.numberofnights_Selected) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)"
                        }
                        
                        cell.priceLabel.sizeToFit()
                        if(getbillingArray?.isSpecialPriceAssigned == true)
                        {
                            
                            cell.specialImage.isHidden = false
                            cell.specialImage.frame = CGRect(x: cell.priceLabel.frame.size.width+cell.priceLabel.frame.origin.x+5, y:17, width: 20, height: 20)
                        }
            
                       // let calculated_Price = Double(String(format: "%.2f",(getbillingArray?.basePrice! * Double(Utility.shared.numberofnights_Selected))))as! Double
                        cell.priceLeftLabel.text = "\(currencysymbol)\(getbillingArray?.priceForDays != nil ? (getbillingArray?.priceForDays!.clean ?? "") : "" )"
                    }
                    else if(indexPath.row == 1)
                    {
                        cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                      
                        cell.priceLeftLabel.text = "\(currencysymbol)\(getbillingArray?.guestServiceFee != nil ? (getbillingArray?.guestServiceFee!.clean ?? "") : "" )"
                    }
                    else{
                        cell.priceLabel.text =  getbillingArray?.discountLabel != nil ? getbillingArray?.discountLabel!.capitalized : ""
                        
                        cell.priceLeftLabel.text = "-\(currencysymbol)\(getbillingArray?.discount != nil ? (getbillingArray?.discount!.clean ?? "") : "")"
                    }
                    cell.priceLabelLeadingConstraint.constant = cell.specialImage.isHidden ? -20 : 5
                    return cell
                }
                else
                {
                    if(indexPath.row == 0)
                    {
//                        cell.priceLabel.text =  "\(currencysymbol)\(getbillingArray?.averagePrice!.clean) x \(Utility.shared.numberofnights_Selected) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)\(Utility.shared.numberofnights_Selected > 1 ? "s" : "")"
                        
                        if Utility.shared.numberofnights_Selected > 1 {
                            cell.priceLabel.text =  "\(currencysymbol)\(getbillingArray?.averagePrice!.clean ?? "") x \(Utility.shared.numberofnights_Selected) \((Utility.shared.getLanguage()?.value(forKey:"nights")) ?? "nights")"
                        }else{
                            cell.priceLabel.text =  "\(currencysymbol)\(getbillingArray?.averagePrice!.clean ?? "") x \(Utility.shared.numberofnights_Selected) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)"
                        }
                        cell.priceLabel.sizeToFit()
                        if(getbillingArray?.isSpecialPriceAssigned == true)
                        {
                          
                            cell.specialImage.isHidden = false
                             cell.specialImage.frame = CGRect(x: cell.priceLabel.frame.size.width+cell.priceLabel.frame.origin.x+5, y:17, width: 20, height: 20)
                        }
                        
                       // let calculated_Price = Double(String(format: "%.2f",(getbillingArray?.basePrice! * Double(Utility.shared.numberofnights_Selected))))as! Double
                        cell.priceLeftLabel.text = "\(currencysymbol)\(getbillingArray?.priceForDays != nil ? (getbillingArray?.priceForDays!.clean ?? "") : "")"
                    }
                    else if(indexPath.row == 1)
                    {
                        cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                        
                        cell.priceLeftLabel.text = "\(currencysymbol)\(getbillingArray?.guestServiceFee != nil ? (getbillingArray?.guestServiceFee!.clean ?? "") : "")"
                    }
                    cell.priceLabelLeadingConstraint.constant = cell.specialImage.isHidden ? -20 : 5
                    return cell
                    
                }
                
            }
            else{
                
                if(getbillingArray?.discountLabel != nil &&  getbillingArray?.discount != 0)
                {
                    if(indexPath.row == 0)
                    {
//                        cell.priceLabel.text =  "\(currencysymbol)\(getbillingArray?.averagePrice!.clean) x \(Utility.shared.numberofnights_Selected) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)\(Utility.shared.numberofnights_Selected > 1 ? "s" : "")"
                        
                        if Utility.shared.numberofnights_Selected > 1 {
                            cell.priceLabel.text =  "\(currencysymbol)\(getbillingArray?.averagePrice!.clean ?? "") x \(Utility.shared.numberofnights_Selected) \((Utility.shared.getLanguage()?.value(forKey:"nights")) ?? "nights")"
                        }else{
                            cell.priceLabel.text =  "\(currencysymbol)\(getbillingArray?.averagePrice!.clean ?? "") x \(Utility.shared.numberofnights_Selected) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)"
                        }
                        
                        let calculated_Price = Double(String(format: "%.2f",((getbillingArray?.basePrice! ?? 0.0) * Double(Utility.shared.numberofnights_Selected))))!
                        cell.priceLabel.sizeToFit()
                        if(getbillingArray?.isSpecialPriceAssigned == true)
                        {
                           
                            cell.specialImage.isHidden = false
                             cell.specialImage.frame = CGRect(x: cell.priceLabel.frame.size.width+cell.priceLabel.frame.origin.x+5, y:17, width: 20, height: 20)
                        }
                        
                        cell.priceLeftLabel.text = "\(currencysymbol)\(getbillingArray?.priceForDays != nil ? (getbillingArray?.priceForDays!.clean ?? "") : "")"
                    }
                    else if(indexPath.row == 1)
                    {
                        cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"cleaningfee"))!)"
                    
                        cell.priceLeftLabel.text = "\(currencysymbol)\(getbillingArray?.cleaningPrice != nil ? (getbillingArray?.cleaningPrice!.clean ?? "") : "")"
                    }
                    else if(indexPath.row == 2)
                    {
                        cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                        
                        cell.priceLeftLabel.text = "\(currencysymbol)\(getbillingArray?.guestServiceFee != nil ? (getbillingArray?.guestServiceFee!.clean ?? "") : "")"
                    }
                    else{
                        cell.priceLabel.text =  getbillingArray?.discountLabel != nil ? getbillingArray?.discountLabel!.capitalized : ""
                        
                        cell.priceLeftLabel.text = "-\(currencysymbol)\(getbillingArray?.discount != nil ? (getbillingArray?.discount!.clean ?? "") : "")"
                    }
                    cell.priceLabelLeadingConstraint.constant = cell.specialImage.isHidden ? -20 : 5
                    return cell
                }
                
                else{
                    if(indexPath.row == 0)
                    {
//                        cell.priceLabel.text =  "\(currencysymbol)\(getbillingArray?.averagePrice!.clean) x \(Utility.shared.numberofnights_Selected) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)\(Utility.shared.numberofnights_Selected > 1 ? "s" : "")"
                        
                        
                        if Utility.shared.numberofnights_Selected > 1 {
                            cell.priceLabel.text =  "\(currencysymbol)\(getbillingArray?.averagePrice!.clean ?? "") x \(Utility.shared.numberofnights_Selected) \((Utility.shared.getLanguage()?.value(forKey:"nights")) ?? "nights")"
                        }else{
                            cell.priceLabel.text =  "\(currencysymbol)\(getbillingArray?.averagePrice!.clean ?? "") x \(Utility.shared.numberofnights_Selected) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)"
                        }
                        
                        let calculated_Price = Double(String(format: "%.2f",((getbillingArray?.basePrice! ?? 0.0) * Double(Utility.shared.numberofnights_Selected))))!
                        cell.priceLabel.sizeToFit()
                        if(getbillingArray?.isSpecialPriceAssigned == true)
                        {
                           
                            cell.specialImage.isHidden = false
                             cell.specialImage.frame = CGRect(x: cell.priceLabel.frame.size.width+cell.priceLabel.frame.origin.x+5, y:17, width: 20, height: 20)
                        }
        
                        cell.priceLeftLabel.text = "\(currencysymbol)\(getbillingArray?.priceForDays != nil ? (getbillingArray?.priceForDays!.clean ?? "") : "")"
                    }
                    else if(indexPath.row == 1)
                    {
                        cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"cleaningfee"))!)"
                        
                        cell.priceLeftLabel.text = "\(currencysymbol)\(getbillingArray?.cleaningPrice != nil ? (getbillingArray?.cleaningPrice!.clean ?? "") : "")"
                    }
                    else if(indexPath.row == 2)
                    {
                        cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                        
                        cell.priceLeftLabel.text = "\(currencysymbol)\(getbillingArray?.guestServiceFee != nil ? (getbillingArray?.guestServiceFee!.clean ?? "") : "")"
                    }
                    cell.priceLabelLeadingConstraint.constant = cell.specialImage.isHidden ? -20 : 5
                    return cell
                }
                
                
            }
            
        
        }
        
        else if(indexPath.section == 5)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookingTotalCell", for: indexPath)as! BookingTotalCell
            cell.selectionStyle = .none
            var currencysymbol = String()
            if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
            {
                currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)!
            }
            else
            {
                currencysymbol = Utility.shared.getSymbol(forCurrencyCode:self.currencyvalue_from_API_base)!
            }
            cell.totalPriceLabel.text = "\(currencysymbol)\(getbillingArray?.total != nil ? (getbillingArray?.total!.clean ?? "") : "")"
            totalPriceLabel = "\(currencysymbol)\(getbillingArray?.total != nil ? (getbillingArray?.total!.clean ?? "") : "")"
            if Utility.shared.isRTLLanguage(){
                
                cell.totalPriceLabel.textAlignment = .left
            }else{
                cell.totalPriceLabel.textAlignment = .right
            }
            
            return cell
        }
        else if(indexPath.section == 6)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "bookcancellationCell", for: indexPath)as! bookcancellationCell
            cell.cancelpolicyLabel.font = UIFont(name: APP_FONT_SEMIBOLD, size: 14)
            cell.cancelpolicycontentLabel.font = UIFont(name: APP_FONT, size: 14)
            cell.cancelpolicyLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"cancellations"))!)"
            cell.cancelpolicycontentLabel.textColor = UIColor(named: "searchPlaces_TextColor")
            let fullString =  "Cancellation Policy is '\(viewListingArray?.listingData?.cancellation?.policyName ?? "")' and you can \(viewListingArray?.listingData?.cancellation?.policyContent ?? "")"

            // Choose wwhat you want to be colored.
            let coloredString = "'\(viewListingArray?.listingData?.cancellation?.policyName! ?? "")'"

            // Get the range of the colored string.
       let rangeOfColoredString = (fullString as! NSString).range(of: coloredString)

            // Create the attributedString.
            let attributedString = NSMutableAttributedString(string:fullString)
            attributedString.setAttributes([NSAttributedString.Key.foregroundColor: Theme.PRIMARY_COLOR],
                                    range: rangeOfColoredString)
       cell.cancelpolicycontentLabel.attributedText = attributedString
            
           
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
            cell.cancelpolicycontentLabel.addGestureRecognizer(tapGesture)
            cell.cancelpolicycontentLabel.isUserInteractionEnabled = true

            cell.selectionStyle = .none
            return cell
        }
        
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AgreetermsCell", for: indexPath)as! AgreetermsCell
            cell.selectionStyle = .none
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
            cell.agreeLabel.addGestureRecognizer(tapGesture)
            cell.agreeLabel.isUserInteractionEnabled = true
            return cell
        }
    }
    
    //  fun getRate(base: String, to: String, from: String, rateStr: String, amount: Double) : Double {
    @objc func dismissgenderPicker() {
       view.endEditing(true)
   }
    
     @objc func addinBtnTapped(_ sender: UIButton!) {
        Utility.shared.blocked_date_month.removeAllObjects()
         if let blockedDates = viewListingArray?.blockedDates{
             for i in blockedDates
             {
                 let timestamp = i?.blockedDates
                 let timestamValue = Int(timestamp!) != nil ? Int(timestamp!)!/1000 : 0
                 let newTime = Date(timeIntervalSince1970: TimeInterval(timestamValue))
                 let dateFormatter = DateFormatter()
                 dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
                 dateFormatter.dateFormat = "dd-LL-YYYY" //Specify your format that you want
                 let dateFormatter1 = DateFormatter()
                 dateFormatter1.dateFormat = "LL"
                 dateFormatter1.timeZone = TimeZone(abbreviation: "UTC")
                 let date = "\(dateFormatter.string(from: newTime))"
                 if(i?.calendarStatus != "available")
                 {
                     Utility.shared.blocked_date_month.add("\(date)")
                 }
                 Utility.shared.blockedDates.add(dateFormatter.string(from: newTime))
             }
         }
         
         Utility.shared.fullcheckBlockedDateMonth.removeAllObjects()
         if let blockedDates = viewListingArray?.blockedDates{
             for i in blockedDates
             {
                 let timestamp = i?.blockedDates
                 let timestamValue = Int(timestamp!) != nil ? Int(timestamp!)!/1000 : 0
                 let newTime = Date(timeIntervalSince1970: TimeInterval(timestamValue))
                 let dateFormatter = DateFormatter()
                 dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
                 dateFormatter.dateFormat = "dd-LL-YYYY" //Specify your format that you want
                 let dateFormatter1 = DateFormatter()
                 dateFormatter1.timeZone = TimeZone(abbreviation: "UTC")
                 dateFormatter1.dateFormat = "LL"
                 let date = "\(dateFormatter.string(from: newTime))"
                 if(i?.calendarStatus != "available")
                 {
                     Utility.shared.fullcheckBlockedDateMonth.add("\(date)")
                 }
             }
         }
         
         if let checkInDates = viewListingArray?.checkInBlockedDates{
             Utility.shared.checkedInDates.removeAllObjects()
             for i in checkInDates{
                 let timestamp = i?.blockedDates
                 let timestamValue = Int(timestamp!) != nil ? Int(timestamp!)!/1000 : 0
                 let newTime = Date(timeIntervalSince1970: TimeInterval(timestamValue))
                 let dateFormatter = DateFormatter()
                dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
                 dateFormatter.dateFormat = "dd-LL-yyyy"
                 
                 Utility.shared.checkedInDates.add(dateFormatter.string(from: newTime))
             }
         }
        Utility.shared.minimumstay = (viewListingArray?.listingData?.minNight != nil ? ((viewListingArray?.listingData?.minNight!)!) : 0)
        Utility.shared.isfromcheckingPage = true
        Utility.shared.maximum_days_notice = Utility.shared.maximum_notice_period(maximumnoticeperiod: (viewListingArray?.listingData?.maxDaysNotice != nil ? ((viewListingArray?.listingData?.maxDaysNotice!)!) : ""))!
        let datePickerViewController = AirbnbDatePickerViewController(dateFrom: selectedStartDate, dateTo: selectedEndDate)
        datePickerViewController.delegate = self
         datePickerViewController.isFromEdit = true
         datePickerViewController.isFromFilter = false
        datePickerViewController.viewListingArray = viewListingArray
        let navigationController = UINavigationController(rootViewController: datePickerViewController)
        
        self.present(navigationController, animated: true, completion: nil)
    }
    @objc func tooltipBtnTapped(_ sender: UIButton!)
    {
        let preference = ToolTipPreferences()
        preference.drawing.bubble.color = UIColor.darkGray
        preference.drawing.bubble.spacing = 10
        preference.drawing.bubble.cornerRadius = 5
        preference.drawing.bubble.inset = 15
        preference.drawing.bubble.border.color = UIColor(red: 0.768, green: 0.843, blue: 0.937, alpha: 1.000)
        preference.drawing.bubble.border.width = 1
        preference.drawing.arrow.tipCornerRadius = 5
        preference.drawing.message.color = UIColor.white
        preference.drawing.message.font = UIFont(name: APP_FONT, size:15)!
        preference.drawing.button.color = UIColor(red: 0.074, green: 0.231, blue: 0.431, alpha: 1.000)
        preference.drawing.button.font = UIFont(name: APP_FONT, size:15)!
        sender.showToolTip(identifier: "", message:"\((Utility.shared.getLanguage()?.value(forKey:"specialtooltip"))!)", button:nil, arrowPosition: .bottom, preferences: preference, delegate: nil)
    }
  
    func didChangeText(text: String?, cell: checkTextviewCell) {
        requestTable.beginUpdates()
        Utility.shared.booking_message = text!
        requestTable.endUpdates()
    }
    @objc func guestBtnTapped(_ sender: UIButton!) {
        Utility.shared.isfromcheckingPage = true
        Utility.shared.maximum_Count_for_booking = viewListingArray?.personCapacity != nil ? (viewListingArray?.personCapacity!)! : 0
        let occupantController = AirbnbOccupantFilterController(adultCount: adultCount, childrenCount: childrenCount, infantCount: infantCount, hasPet: hasPet)
        occupantController.delegate = self
        let navigationController = UINavigationController(rootViewController: occupantController)
        navigationController.modalPresentationStyle = .overFullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
    
    func datePickerController(_ datePickerController: AirbnbDatePickerViewController, didSaveStartDate startDate: Date?, endDate: Date?) {
        
        selectedStartDate = startDate
        selectedEndDate = endDate
        
        let dateFormatterGet = DateFormatter()
       // dateFormatterGet.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        if(startDate != nil && endDate != nil){
            print(dateFormatterGet.string(from: startDate!))
        }
        
        if selectedStartDate == nil && selectedEndDate == nil {
           
        } else {
            let fmt = DateFormatter()
          //  fmt.timeZone = TimeZone(abbreviation: "UTC")
            fmt.dateFormat = "yyyy-MM-dd"
            print(fmt.string(from: startDate!))
            isFromCalendar = true
            billingListAPICall(startDate: fmt.string(from: startDate!), endDate: fmt.string(from: endDate!))
        }
    }
    
    @objc func handleTapGesture(sender: UITapGestureRecognizer) {
    let houserulesObj = HouseRulesVC()
        houserulesObj.houserulesArray = viewListingArray?.houseRules! as! [PTProAPI.ViewListingDetailsQuery.Data.ViewListing.Results.HouseRule]
    houserulesObj.titleString = "\((Utility.shared.getLanguage()?.value(forKey:"houserules"))!)"
    houserulesObj.modalPresentationStyle = .fullScreen
    self.present(houserulesObj, animated: true, completion: nil)
    }
    
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
   
        let cancellationObj = CancellationVC()
       
      
        cancellationObj.cancelpolicy = viewListingArray?.listingData?.cancellation?.policyName ?? ""
      
       
        cancellationObj.cancelpolicy_content = viewListingArray?.listingData?.cancellation?.policyContent ?? ""
     

        cancellationObj.modalPresentationStyle = .fullScreen
        self.present(cancellationObj, animated: true, completion: nil)
    }
    
    
    func occupantFilterController(_ occupantFilterController: AirbnbOccupantFilterController, didSaveAdult adult: Int, children: Int, infant: Int, pet: Bool) {
        self.adultCount = adult
        self.childrenCount = children
        self.infantCount = infant
        self.hasPet = pet
        self.guest_filter = adult
        
        let human = adult + children
        Utility.shared.guestCountToBeSend = human
        let infant = "\(infant > 0 ? (infant.description + " infant" + (infant > 1 ? "s" : "")) : "")"
        let pet = "\(pet ? "pets" : "")"
        
        if human > 1{
            guestLabel_text = "\(human) \((Utility.shared.getLanguage()?.value(forKey:"CapGuests")) ?? "Guests")" + (infant != "" ? ", " + infant : "") + (pet != "" ? ", " + pet : "")
            Utility.shared.guestc = guestLabel_text
        }else{
            guestLabel_text = "\(human) \((Utility.shared.getLanguage()?.value(forKey:"guest"))!)" + (infant != "" ? ", " + infant : "") + (pet != "" ? ", " + pet : "")
            Utility.shared.guestc = guestLabel_text
        }
        self.requestTable.reloadSections([1,3,4,5], with: .none)
        
    }
    
    
    func billingListAPICall(startDate:String,endDate:String){
        var currency = String()
        if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
        {
            currency = Utility.shared.getPreferredCurrency()!
        }
        else
        {
            currency = Utility.shared.currencyvalue_from_API_base
        }
        let billingListquery = PTProAPI.GetBillingCalculationQuery(listId: viewListingArray?.__data._data["id"] as! Int as Int, startDate: startDate, endDate: endDate, guests: Utility.shared.guestCountToBeSend, convertCurrency:currency)
        Network.shared.apollo_headerClient.fetch(query: billingListquery){ response in
            switch response {
            case .success(let result):
                guard (result.data?.getBillingCalculation?.result) != nil else{
                    self.view.makeToast(result.data?.getBillingCalculation?.errorMessage)
                    return
                }
                self.getbillingArray = (result.data?.getBillingCalculation?.result)!
                Utility.shared.guestCountToBeSend = self.getbillingArray?.guests ?? Utility.shared.guestCountToBeSend
                if self.isFromCalendar {
                    self.isFromCalendar = false
                    self.requestTable.reloadSections([1,3,4,5], with: .none)
                }
                else {
                    self.requestTable.reloadData()
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }
    
    func lottieanimation()
    {
//        bookBtn.setTitle("", for:.normal)
        lottieView = LottieAnimationView.init(name: "animation_white")
        
        self.lottieView.isHidden = false
        self.lottieView.frame = CGRect(x:bookBtn.frame.size.width/2-60, y:-25, width:100, height:100)
        self.bookBtn.addSubview(self.lottieView)
        self.lottieView.backgroundColor = UIColor.clear
        self.lottieView.play()
        
    }
    func profileAPICall()
    {
        let profileQuery = PTProAPI.GetProfileQuery()
        
        Network.shared.apollo_headerClient.fetch(query:profileQuery,cachePolicy:.fetchIgnoringCacheData){ response in
            switch response {
            case .success(let result):
                guard (result.data?.userAccount?.result) != nil else
                {
                    if result.data?.userAccount?.status == 500{
                        let alert = UIAlertController(title: "\(Utility.shared.getLanguage()?.value(forKey: "oops") ?? "oops" )", message: result.data?.userAccount?.errorMessage, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "\(Utility.shared.getLanguage()?.value(forKey: "okay") ?? "Okay")", style: .default, handler: { (action) in
                            UserDefaults.standard.removeObject(forKey: "user_token")
                            UserDefaults.standard.removeObject(forKey: "user_id")
                            UserDefaults.standard.removeObject(forKey: "password")
                            UserDefaults.standard.removeObject(forKey: "currency_rate")
                            let appDelegate = UIApplication.shared.delegate as! AppDelegate
                            let welcomeObj = WelcomePageVC()
                            appDelegate.setInitialViewController(initialView: welcomeObj)
                        }))
                        self.present(alert, animated: true, completion: nil)
                        return
                    }else{
                        self.lottieView.isHidden = true
                        if(self.viewListingArray?.bookingType! == "instant")
                        {
                            self.bookBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"addpayment"))!)", for: .normal)
                        }
                        else
                        {
                            self.bookBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"addpayment"))!)", for: .normal)
                        }
                        return
                    }
                    
                }
                self.lottieView.isHidden = true
                
                self.ProfileAPIArray = ((result.data?.userAccount?.result)!)
                
                self.lottieView.isHidden = true
                if(self.viewListingArray?.bookingType! == "instant")
                {
                    self.bookBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"addpayment"))!)", for: .normal)
                }
                else
                {
                    self.bookBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"addpayment"))!)", for: .normal)
                }
                
                
                
//                if(self.ProfileAPIArray?.verification?.isEmailConfirmed == true)
//                {
                    
                    if(self.ProfileAPIArray?.picture == nil)
                    {
                        Utility.shared.isprofilepictureVerified = true
                    }
                    else
                    {
                        Utility.shared.isprofilepictureVerified = false
                    }
                    
                    
                    
                    Utility.shared.bookingListimage = self.viewListingArray?.listPhotoName != nil ? (self.viewListingArray?.listPhotoName!)! : ""
                    Utility.shared.bookingListname = self.viewListingArray?.title != nil ? (self.viewListingArray?.title!)! : ""
                    if(self.guestLabel_text == "")
                    {
                        self.guestLabel_text = "1 \((Utility.shared.getLanguage()?.value(forKey:"guest"))!)"
                    }
                    Utility.shared.bookingdateLabel = "\(self.addDateinLabel) - \(self.addDateoutLabel), \(self.guestLabel_text)"
                    
                    if(Utility.shared.isprofilepictureVerified)
                    {
                        let bookingThreeObj = BookingStepThreeVC()
                        
                        bookingThreeObj.viewListingArray = self.viewListingArray
                        bookingThreeObj.currencyvalue_from_API_base = self.currencyvalue_from_API_base
                        bookingThreeObj.getbillingArray = self.getbillingArray
                        bookingThreeObj.viewListingArray = self.viewListingArray
                        bookingThreeObj.modalPresentationStyle = .fullScreen
                        self.present(bookingThreeObj, animated: true, completion: nil)
                    } else {
                        let paymentSelectionPage = PaymentSelectionPage()
                        paymentSelectionPage.currencyvalue_from_API_base = self.currencyvalue_from_API_base
                        paymentSelectionPage.getbillingArray = self.getbillingArray
                        paymentSelectionPage.viewListingArray = self.viewListingArray
                        paymentSelectionPage.modalPresentationStyle = .fullScreen
                        self.present(paymentSelectionPage, animated: true, completion: nil)
                    }
                    
                    
                    
//                }
//                else{
//                    self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"emailverifyalert"))!)")
//                    
//                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

