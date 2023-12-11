//
//  BookingItenaryVC.swift
//  App
//
//  Created by RadicalStart on 31/05/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import Apollo
import Lottie

@available(iOS 11.0, *)
@available(iOS 11.0, *)
class BookingItenaryVC: UIViewController,UITableViewDelegate,UITableViewDataSource, WhishlistPageVCProtocol {
    func APIMethodCall(listId:Int, status:Bool) {
        
    }
    
    func didupdateWhishlistStatus(status: Bool) {
       
//        getReservationArray?.listData?.wishListStatus = status
       
        iterationTable.reloadSections([1], with:.none)
    }
    
    
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iterationTable: UITableView!
    var wishlistIndex:Int = -1
    var lottieView: LottieAnimationView!
    var getReservationArray : PTProAPI.GetReservationQuery.Data.GetReservation.Results?
    var getReservation_currencyArray : PTProAPI.GetReservationQuery.Data.GetReservation?
    var getbillingArray : PTProAPI.GetBillingCalculationQuery.Data.GetBillingCalculation.Result?
    var currencyvalue_from_API_base = String()
    var isFromReviewPage = false
    var reservID = 0
    @IBOutlet weak var ErrorView: UIView!
    @IBOutlet weak var uhohLabel: UILabel!
    @IBOutlet weak var ErrorDescLabel: UILabel!
    @IBOutlet weak var ErrorCodeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialsetup()

        self.view.backgroundColor = UIColor(named: "colorController")
        if isFromReviewPage{
            self.getReservationAPICall(reservationid: reservID)
        }
        
        self.ErrorView.isHidden = true
        self.uhohLabel.text = "\(Utility.shared.getLanguage()?.value(forKey: "uhoh") ?? "Uh-Oh!")"
        self.ErrorDescLabel.text = "\(Utility.shared.getLanguage()?.value(forKey: "404alert") ?? "We can't seem to find anything that you're looking for!")"
        self.ErrorCodeLabel.text = "\(Utility.shared.getLanguage()?.value(forKey: "errorCode") ?? "Error Code : 404")"
        // Do any additional setup after loading the view.
    }

    func lottieAnimation(){
        lottieView = LottieAnimationView.init(name:"animation")
        lottieView.isHidden = false
        self.lottieView.frame = CGRect(x:FULLWIDTH/2-40, y:FULLHEIGHT/2-50, width:100, height:100)
        self.view.addSubview(self.lottieView)
        self.lottieView.backgroundColor = UIColor.clear
        self.lottieView.layer.cornerRadius = 6.0
        self.lottieView.clipsToBounds = true
        self.lottieView.play()
    }
    
    func getReservationAPICall(reservationid:Int)
    {
        if Utility.shared.isConnectedToNetwork(){
            self.lottieAnimation()
            let createReservationquery = PTProAPI.GetReservationQuery(reservationId: reservationid, convertCurrency: .none)
            Network.shared.apollo_headerClient.fetch(query: createReservationquery){ response in
                self.lottieView.isHidden = true
                self.lottieView.frame = CGRect(x:FULLWIDTH/2-40, y:FULLHEIGHT/2-50, width:0, height:0)
                
                switch response {
                case .success(let result):
                    guard (result.data?.getReservation?.results) != nil else{
                        print("Missing Data")
                        
                        self.view.makeToast(result.data?.getReservation?.errorMessage)
                        return
                    }
                    if let results = result.data?.getReservation?.results{
                        self.getReservationArray = results
                    }
                    
                    if let getReservation = result.data?.getReservation{
                        self.getReservation_currencyArray = getReservation
                    }
                    
                    if self.getReservationArray?.listData != nil{
                        self.iterationTable.isHidden = false
                        self.ErrorView.isHidden = true
                        
                        self.iterationTable.reloadData()
                    }else{
                        self.iterationTable.isHidden = true
                        self.ErrorView.isHidden = false
                    }
                    //            if #available(iOS 11.0, *) {
                    //                let receiptPageObj = BookingItenaryVC()
                    //                receiptPageObj.getReservation_currencyArray = self.getReservation_currencyArray
                    //                receiptPageObj.getReservationArray = self.getReservationArray
                    //                  receiptPageObj.modalPresentationStyle = .fullScreen
                    //                self.present(receiptPageObj, animated: true, completion: nil)
                    //            } else {
                    //                // Fallback on earlier versions
                    //            }
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                }
            }
        }
        else{
            
        }
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        if(Utility.shared.isfromTripsPage || self.isFromReviewPage)
        {
          self.dismiss(animated: true, completion: nil)
        }
        else{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        Utility.shared.setTab(index: 0)
            Utility.shared.host_message_isfromHost = false
            Utility.shared.host_message_isfrommessage = false
            Utility.shared.isfromfloatmap_Page = false
            Utility.shared.locationfromSearch  = ""
            Utility.shared.TotalFilterCount = 0
            if(Utility.shared.searchLocationDict.count > 0)
            {
                Utility.shared.searchLocationDict.setValue(nil, forKey: "lat")
                Utility.shared.searchLocationDict.setValue(nil, forKey: "lon")
            }
            Utility.shared.instantBook = ""
            Utility.shared.roomtypeArray.removeAllObjects()
            Utility.shared.amenitiesArray.removeAllObjects()
            Utility.shared.priceRangeArray.removeAllObjects()
            Utility.shared.facilitiesArray.removeAllObjects()
            Utility.shared.houseRulesArray.removeAllObjects()
            Utility.shared.beds_count = 0
            Utility.shared.bedrooms_count = 0
            Utility.shared.bathroom_count = 0
            if(Utility.shared.isSwitchEnable)
            {
                Utility.shared.isSwitchEnable = false
            }
            Utility.shared.isfromGuestProfile = false
            Utility.shared.setopenTabbar(iswhichtabbar: false)

            self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
            appDelegate.GuestTabbarInitialize(initialView: CustomTabbar())
            
        }
    }
    func initialsetup()
    {
        self.backBtn.setImage(UIImage(named: "left_arrow"), for: .normal)
        self.backBtn.setTitle("", for: .normal)
        self.backBtn.backgroundColor = Theme.ButtonBack_BG
        self.backBtn.layer.cornerRadius = self.backBtn.frame.size.height/2
        self.backBtn.clipsToBounds = true
        
        if Utility.shared.isRTLLanguage(){
            self.backBtn.rotateImageViewofBtn()
        }
        
        titleLabel.text = "\(Utility.shared.getLanguage()?.value(forKey: "itinerary") ?? "Itinerary")"
        titleLabel.textColor = UIColor(named: "Title_Header")
        titleLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        titleLabel.font = UIFont(name: APP_FONT_SEMIBOLD, size: 18.0)
        
        
        iterationTable.register(UINib(nibName: "ItenaryListCell", bundle: nil), forCellReuseIdentifier: "ItenaryListCell")
         iterationTable.register(UINib(nibName: "ItenaryImageCell", bundle: nil), forCellReuseIdentifier: "ItenaryImageCell")
         iterationTable.register(UINib(nibName: "ItenarycheckCell", bundle: nil), forCellReuseIdentifier: "ItenarycheckCell")
         iterationTable.register(UINib(nibName: "ItenaryaddressCell", bundle: nil), forCellReuseIdentifier: "ItenaryaddressCell")
         iterationTable.register(UINib(nibName: "ItenaryHostCell", bundle: nil), forCellReuseIdentifier: "ItenaryHostCell")
         iterationTable.register(UINib(nibName: "ItenaryBillingCell", bundle: nil), forCellReuseIdentifier: "ItenaryBillingCell")
        
    }
    
    
    func createReservationAPICall(reservationid:Int)
    {
        var currency = String()
        if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
        {
            currency = Utility.shared.getPreferredCurrency()!
        }
        else
        {
            currency = Utility.shared.currencyvalue_from_API_base
        }
        self.lottieAnimation()
        let createReservationquery = PTProAPI.GetReservationQuery(reservationId: reservationid,convertCurrency:.some(currency))
        Network.shared.apollo_headerClient.fetch(query: createReservationquery,cachePolicy:.fetchIgnoringCacheData){ response in
            self.lottieView.isHidden = true
            self.lottieView.frame = CGRect(x:FULLWIDTH/2-40, y:FULLHEIGHT/2-50, width:0, height:0)
            switch response {
            case .success(let result):
                guard (result.data?.getReservation?.results) != nil else{
                    self.view.makeToast(result.data?.getReservation?.errorMessage)
                    return
                }
                self.getReservationArray = (result.data?.getReservation?.results)!
                self.getReservation_currencyArray = (result.data?.getReservation!)!
                
                self.iterationTable.reloadData()
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if(getReservationArray?.listData?.city != nil)
        {
        return 6
        }
        return 0
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0)
        {
            return UITableView.automaticDimension
        }
        else if(indexPath.section == 1)
        {
            return 320
        }
        else if(indexPath.section == 2)
        {
            return UITableView.automaticDimension
        }
        else if(indexPath.section == 3)
        {
            return UITableView.automaticDimension
        }
        else if(indexPath.section == 4)
        {
            return UITableView.automaticDimension
        }
        else
        {
           return UITableView.automaticDimension
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(getReservationArray?.listData?.city != nil)
        {
        return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItenaryListCell", for: indexPath)as! ItenaryListCell
            cell.locationLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"yougoing"))!) \(getReservationArray?.listData?.city != nil ? ((getReservationArray?.listData?.city!)!) : "")!"
            if let confirmationCode = getReservationArray?.confirmationCode {
                cell.reservationCodeLAbel.text = " \((Utility.shared.getLanguage()?.value(forKey:"reservationcode"))!)  #\(confirmationCode)"
            }else{
                cell.reservationCodeLAbel.text = ""
            }
            
            cell.selectionStyle = .none
            return cell
        }
        if(indexPath.section == 1)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItenaryImageCell", for: indexPath)as! ItenaryImageCell
            cell.selectionStyle = .none
            
            if let listimage = (getReservationArray?.listData?.listPhotoName) {
            cell.listImage.sd_setImage(with: URL(string: "\(IMAGE_LISTING_MEDIUM)\(String(describing: listimage))"), placeholderImage: #imageLiteral(resourceName: "placeholderimg"))
            } else {
                cell.listImage.image = #imageLiteral(resourceName: "placeholderimg")
            }
            cell.heightConstant.constant = 22
            cell.topConstant.constant = 18
            cell.listTitleLabel.text = getReservationArray?.listData?.title ?? ""
            
            cell.listLocationLabel.text = "\(getReservationArray?.listData?.city ?? ""), \(getReservationArray?.listData?.state ?? ""), \(getReservationArray?.listData?.country ?? "")"
            
            if(((getReservationArray?.listData?.reviewsCount!)! > 0) && ((getReservationArray?.listData?.reviewsStarRating!)! > 0) ) {
            
            if((getReservationArray?.listData?.reviewsCount!)! > 0)
            {
                if((getReservationArray?.listData?.reviewsCount!)! == 1) {
                    cell.ratingLabel.text = " \(getReservationArray?.listData?.reviewsCount ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"review"))!)"
                }
                else {
                cell.ratingLabel.text = "\(getReservationArray?.listData?.reviewsCount ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"reviews"))!)"
                }
            }
            else
            {
                cell.ratingLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"delete_no"))!) \((Utility.shared.getLanguage()?.value(forKey:"reviews"))!)"
                
            }
            
//            if((getReservationArray?.listData?.reviewsStarRating!)! > 0) {
//                cell.ratingCountLabel.text = "\(getReservationArray?.listData?.reviewsStarRating ?? 0) \u{2022}"
//            }
//            else {
//                cell.ratingCountLabel.text = "\(getReservationArray?.listData?.reviewsStarRating ?? 0) \u{2022}"
//            }
                
                
                let reviewsCount = getReservationArray?.listData?.reviewsCount ?? 0
                let ratings = getReservationArray?.listData?.reviewsStarRating ?? 0
                
                let value1 = Float("\(reviewsCount)") ?? 0.0
                let value2 = Float("\(ratings)") ?? 0.0
                if(value2 != 0.0){
                    let divideValue = value2/value1
                  //  cell.lblRating.titleLabel?.text = "  \(Int(divideValue.rounded()))  "
                    cell.ratingCountLabel.text = "\(Int(divideValue.rounded())) \u{2022} "
                    cell.ratingLabel.isHidden = false
                    cell.ratingCountLabel.isHidden = false
                    
                }else{
                    cell.ratingCountLabel.text = " 0.0 "
                    cell.ratingLabel.isHidden = true
                    cell.ratingCountLabel.isHidden = true
                   
                    
                }
            }
            else {
                cell.heightConstant.constant = 0
                cell.topConstant.constant = 0
                cell.ratingView.isHidden = true
            }
            
           
            if let listowner = getReservationArray?.listData?.isListOwner {
//                if(listowner == false){
                    if(getReservationArray?.listData?.wishListStatus == false){
                        cell.likeBtn.setImage(#imageLiteral(resourceName: "Heart"), for: .normal)
                    }else{
                        cell.likeBtn.setImage(#imageLiteral(resourceName: "like"), for: .normal)
                    }
                    cell.likeBtn.isHidden = true

                    cell.likeBtn.addTarget(self, action: #selector(likeBtnTapped), for: .touchUpInside)
//                }else{
//                    cell.likeBtn.isHidden = true
//                }
//            }else{
//                cell.likeBtn.isHidden = true
           }
           
            let attributes = [
                NSAttributedString.Key.font: UIFont(name: APP_FONT, size: 12),
                NSAttributedString.Key.foregroundColor: UIColor(named: "viewList_Title")
            ]
                
            var listTypeString = ""
            listTypeString = "\(getReservationArray?.listData?.roomType ?? "")"
            if ((getReservationArray?.listData?.beds ?? 0) > 1){
                listTypeString = listTypeString + " / " + "\(getReservationArray?.listData?.beds ?? 0)" + " Beds"
            }else if ((getReservationArray?.listData?.beds ?? 0) == 1){
                listTypeString = listTypeString + " / " + "\(getReservationArray?.listData?.beds ?? 0)" + " Bed"
            }
            cell.listLocationLabel.textColor = UIColor(named: "searchPlaces_TextColor")
            
            cell.listLocationLabel.text = listTypeString
            return cell
        }
        if(indexPath.section == 2)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItenarycheckCell", for: indexPath)as! ItenarycheckCell
            cell.selectionStyle = .none
            if(getReservationArray?.checkIn != nil)
            {
                let day = getdayValue(timestamp:(getReservationArray?.checkIn!)!)
                let date = getdateValue(timestamp:(getReservationArray?.checkIn!)!)
                let endDay = getdayValue(timestamp:(getReservationArray?.checkOut!)!)
                let endDate = getdateValue(timestamp:(getReservationArray?.checkOut!)!)
               
            cell.checkinLabel.text = "\(day), \(date) "
            cell.checkoutLabel.text = "\(endDay), \(endDate)"
            }
            else
            {
                cell.checkinLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"flexible"))!)"
                cell.checkoutLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"flexible"))!)"
            }
//            if(getReservationArray?.listData?.listingData?.checkInStart != "Flexible")
//            {
//               // let day = getdayValue(timestamp:(getReservationArray?.listData?.listingData?.checkInStart!)!)
//                let date = conversionRailwaytime(time:(getReservationArray?.listData?.listingData?.checkInStart!)!)
//                cell.checkinTimeLabel.text = "\(date)"
//
//            }
//            else
//            {
//                cell.checkinTimeLabel.text = getReservationArray?.listData?.listingData?.checkInStart!
//            }
            if(getReservationArray?.checkInStart != "" && getReservationArray?.checkInStart != ""){
            if (getReservationArray?.checkInStart == "Flexible" && getReservationArray?.checkInEnd == "Flexible") {
                       
                                          cell.checkinTimeLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "checkintimesmal"))!)"
                           
                       } else if (getReservationArray?.checkInStart != "Flexible" && getReservationArray?.checkInEnd == "Flexible") {
                           let date = conversionRailwaytime(time:(getReservationArray?.checkInStart!)!)
                
                           cell.checkinTimeLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "from"))!) \(date)"
                           
                       } else if (getReservationArray?.checkInStart == "Flexible" && getReservationArray?.checkInEnd != "Flexible") {
                           let date = conversionRailwaytime(time:(getReservationArray?.checkInEnd!)!)
                                          cell.checkinTimeLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "upto"))!) \(date)"
                           
                       } else if (getReservationArray?.checkInStart != "Flexible" && getReservationArray?.checkInEnd != "Flexible") {
                           let date = conversionRailwaytime(time:(getReservationArray?.checkInStart!)!)
                           let date1 = conversionRailwaytime(time:(getReservationArray?.checkInEnd!)!)
                           cell.checkinTimeLabel.text = "\(date) - \(date1)"
                }}else{
                cell.checkinTimeLabel.text = ""
            }
//            if(getReservationArray?.listData?.listingData?.checkInEnd != "Flexible")
//            {
//               // let day = getdayValue(timestamp:(getReservationArray?.listData?.listingData?.checkInEnd!)!)
//                let date = conversionRailwaytime(time:(getReservationArray?.listData?.listingData?.checkInEnd!)!)
//                cell.checkouttimeLabel.text = "\(date)"
//            }
//            else
//            {
//                cell.checkouttimeLabel.text = getReservationArray?.listData?.listingData?.checkInEnd!
//            }
            cell.checkouttimeLabel.text = ""
            return cell
        }
        if indexPath.section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItenaryBillingCell", for: indexPath)as! ItenaryBillingCell
            cell.selectionStyle = .none
            if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
            {
                let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
                
                
                let price_value = Utility.shared.getCurrencyRate(basecurrency:Utility.shared.currencyvalue_from_API_base, fromCurrency:getReservationArray?.currency! ?? "", toCurrency:Utility.shared.getPreferredCurrency()!, CurrencyRate:Utility.shared.currency_Dict, amount:getReservationArray?.totalWithGuestServiceFee != nil ? (getReservationArray?.totalWithGuestServiceFee!)! : 0)
                let restricted_price =  Double(String(format: "%.2f",price_value))
                
                cell.priceLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                
                
                
            }
            else
            {
                let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:Utility.shared.currencyvalue_from_API_base)
                
                let price_value = Utility.shared.getCurrencyRate(basecurrency:Utility.shared.currencyvalue_from_API_base, fromCurrency:getReservationArray?.currency! ?? "", toCurrency:Utility.shared.currencyvalue_from_API_base, CurrencyRate: Utility.shared.currency_Dict, amount:getReservationArray?.totalWithGuestServiceFee != nil ? (getReservationArray?.totalWithGuestServiceFee!)! : 0)
                let restricted_price =  Double(String(format: "%.2f",price_value))
                cell.priceLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
            }
            
            
            if getReservationArray?.nights ?? 0 > 1{
                if let nights = getReservationArray?.nights{
                    cell.stayLabel.text = "\(nights)  \((Utility.shared.getLanguage()?.value(forKey:"nights")) ?? "nights")"
                }else{
                    cell.stayLabel.text = ""
                }
            }else{
                if let nights = getReservationArray?.nights{
                    cell.stayLabel.text = "\(nights)  \((Utility.shared.getLanguage()?.value(forKey:"night")) ?? "night")"
                }else{
                    cell.stayLabel.text = ""
                }
            }
        
            
            
            cell.viewReceiptBtn.addTarget(self, action: #selector(ReceiptBtnTapped), for: .touchUpInside)
            
            cell.viewReceiptBtn.backgroundColor = .clear
            
           
            cell.viewReceiptBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey: "viewreceipt")) ?? "View Receipt")", for: .normal)
            cell.viewReceiptBtn.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
            cell.viewReceiptBtn.titleLabel?.font = UIFont(name: APP_FONT, size: 13)
            if #available(iOS 15.0, *) {
                cell.viewReceiptBtn.configuration?.titleAlignment = Utility.shared.isRTLLanguage() ? .trailing : .leading
            } else {
                cell.viewReceiptBtn.contentHorizontalAlignment = Utility.shared.isRTLLanguage() ? .right : .left
            }
            
            return cell
        }
        if(indexPath.section == 4)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItenaryaddressCell", for: indexPath)as! ItenaryaddressCell
            cell.selectionStyle = .none
            cell.addressLabel.text = "\(getReservationArray?.listData?.street != nil ? ((getReservationArray?.listData?.street!)!) : ""), \(getReservationArray?.listData?.city != nil ? ((getReservationArray?.listData?.city!)!) : ""), \(getReservationArray?.listData?.state != nil ? ((getReservationArray?.listData?.state!)!) : "")-\(getReservationArray?.listData?.zipcode != nil ? ((getReservationArray?.listData?.zipcode!)!) : ""), \(getReservationArray?.listData?.country != nil ? ((getReservationArray?.listData?.country!)!) : "")"
            cell.viewListingBtn.tag = indexPath.row
            cell.viewListingBtn.addTarget(self, action: #selector(viewListingBtnTapped), for: .touchUpInside)
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItenaryHostCell", for: indexPath)as! ItenaryHostCell
            if(getReservationArray?.hostData?.picture != nil)
            {
            let listimage = (getReservationArray?.hostData?.picture!)!
            cell.hostImage.sd_setImage(with: URL(string: "\(IMAGE_AVATAR_MEDIUM)\(String(describing: listimage))"), placeholderImage: #imageLiteral(resourceName: "placeholderimg"))
            }
            cell.hostNameLabel.text = (getReservationArray?.hostData?.firstName != nil ? getReservationArray?.hostData?.firstName! : "")
            cell.selectionStyle = .none
            cell.messageHostBtn.tag = indexPath.row
           
                if Utility.shared.getCurrentUserID()! as String == getReservationArray?.hostData?.userId {
                cell.messageHostBtn.isHidden = true
            }
            else {
                cell.messageHostBtn.isHidden = false
            }
            
            cell.messageHostBtn.addTarget(self, action: #selector(hostBtnTapped), for: .touchUpInside)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 1)
        {
            let viewListing = UpdatedViewListing()
            if(Utility.shared.isfromTripsPage || self.isFromReviewPage)
            {
             
            }
            else{
           
                Utility.shared.host_message_isfromHost = false
                Utility.shared.host_message_isfrommessage = false
                Utility.shared.isfromfloatmap_Page = false
                Utility.shared.locationfromSearch  = ""
                Utility.shared.TotalFilterCount = 0
                if(Utility.shared.searchLocationDict.count > 0)
                {
                    Utility.shared.searchLocationDict.setValue(nil, forKey: "lat")
                    Utility.shared.searchLocationDict.setValue(nil, forKey: "lon")
                }
                Utility.shared.instantBook = ""
                Utility.shared.roomtypeArray.removeAllObjects()
                Utility.shared.amenitiesArray.removeAllObjects()
                Utility.shared.priceRangeArray.removeAllObjects()
                Utility.shared.facilitiesArray.removeAllObjects()
                Utility.shared.houseRulesArray.removeAllObjects()
                Utility.shared.beds_count = 0
                Utility.shared.bedrooms_count = 0
                Utility.shared.bathroom_count = 0
                if(Utility.shared.isSwitchEnable)
                {
                    Utility.shared.isSwitchEnable = false
                }
                Utility.shared.isfromGuestProfile = false
                Utility.shared.setopenTabbar(iswhichtabbar: false)

               
            Utility.shared.selectedstartDate = ""
            Utility.shared.selectedEndDate = ""
         
            Utility.shared.selectedstartDate_filter = ""
            Utility.shared.selectedEndDate_filter = ""
            
            Utility.shared.unpublish_preview_check = false
            }
            viewListing.listID = getReservationArray?.listId ?? 0
            viewListing.modalPresentationStyle = .fullScreen
            self.present(viewListing, animated: true, completion: nil)
        }
    }
    @objc func viewListingBtnTapped(_ sender: UIButton)
    {
        let viewListing = UpdatedViewListing()
        
        if(Utility.shared.isfromTripsPage || self.isFromReviewPage)
        {
         
        }
        else{
      
            Utility.shared.host_message_isfromHost = false
            Utility.shared.host_message_isfrommessage = false
            Utility.shared.isfromfloatmap_Page = false
            Utility.shared.locationfromSearch  = ""
            Utility.shared.TotalFilterCount = 0
            if(Utility.shared.searchLocationDict.count > 0)
            {
                Utility.shared.searchLocationDict.setValue(nil, forKey: "lat")
                Utility.shared.searchLocationDict.setValue(nil, forKey: "lon")
            }
            Utility.shared.instantBook = ""
            Utility.shared.roomtypeArray.removeAllObjects()
            Utility.shared.amenitiesArray.removeAllObjects()
            Utility.shared.priceRangeArray.removeAllObjects()
            Utility.shared.facilitiesArray.removeAllObjects()
            Utility.shared.houseRulesArray.removeAllObjects()
            Utility.shared.beds_count = 0
            Utility.shared.bedrooms_count = 0
            Utility.shared.bathroom_count = 0
            if(Utility.shared.isSwitchEnable)
            {
                Utility.shared.isSwitchEnable = false
            }
            Utility.shared.isfromGuestProfile = false
            Utility.shared.setopenTabbar(iswhichtabbar: false)

            
        Utility.shared.selectedstartDate = ""
        Utility.shared.selectedEndDate = ""
      
        Utility.shared.selectedstartDate_filter = ""
        Utility.shared.selectedEndDate_filter = ""
       
        Utility.shared.unpublish_preview_check = false
        }
        viewListing.listID = getReservationArray?.listId ?? 0
        viewListing.modalPresentationStyle = .fullScreen
        self.present(viewListing, animated: true, completion: nil)
    }
    @objc func ReceiptBtnTapped()
    {
        if #available(iOS 11.0, *) {
            
            let receiptPageObj = ReceiptVC()
             Utility.shared.host_isfrom_hostRecipt = false
            if let reservationArray = getReservationArray{
                receiptPageObj.getReservationArray = reservationArray
            }
            if let reservation_currencyArray = getReservation_currencyArray{
                receiptPageObj.getReservation_currencyArray = reservation_currencyArray
            }
            if let billingArray = getbillingArray{
                receiptPageObj.getbillingArray = billingArray
            }
            receiptPageObj.currencyvalue_from_API_base = currencyvalue_from_API_base
            receiptPageObj.modalPresentationStyle = .overFullScreen
            self.view.window?.rootViewController?.present(receiptPageObj, animated:false, completion: nil)
            //self.present(receiptPageObj, animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
        }
        
        
    }
    
    @objc func likeBtnTapped(_ sender: UIButton!)
    {
        if Utility.shared.isConnectedToNetwork(){
            if((Utility.shared.getCurrentUserToken()) == nil || (Utility.shared.getCurrentUserToken()) == "")
            {
                let welcomeObj = WelcomePageVC()
                welcomeObj.modalPresentationStyle = .fullScreen
                self.present(welcomeObj, animated:false, completion: nil)
            }
            else
            {
               
                    wishlistIndex = sender.tag
                    let headerView = WhishlistPageVC()
                    headerView.listID = getReservationArray?.id ?? 0
                headerView.listimage = getReservationArray?.listData?.listPhotoName ?? "-"
                    headerView.senderID = sender.tag
                    headerView.delegate = self
                    headerView.modalPresentationStyle = .overFullScreen
                    self.present(headerView, animated: false, completion: nil)
                
            }
        }else{
           
        }
    }

    
    @objc func hostBtnTapped(_ sender: UIButton)
    {
            if Utility.shared.isConnectedToNetwork(){
            if(getReservationArray?.messageData?.id != nil)
            {
            let InboxListingObj = InboxListingVC()
            Utility.shared.ListID = "\(getReservationArray?.listId!)"
            InboxListingObj.threadId = (getReservationArray?.messageData?.id!)!
                InboxListingObj.isFromItinerary = true
            InboxListingObj.getMessageListAPICall(threadId:(getReservationArray?.messageData?.id!)!)
              InboxListingObj.modalPresentationStyle = .fullScreen
            self.present(InboxListingObj, animated: true, completion: nil)
            }
            }
            else{
                self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"error_field"))!)")
        }
    }
    

    //  fun getRate(base: String, to: String, from: String, rateStr: String, amount: Double) : Double {
    
    
    func getdateValue(timestamp:String) -> String
    {
         if(Int(timestamp) != nil ) {
        let timestamValue = Int(timestamp)!/1000
        let showDate = Date(timeIntervalSince1970:TimeInterval(timestamValue))
        let dateFormatter = DateFormatter()
             
        dateFormatter.dateFormat = itenararyReceiptDateFormat
             dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
//             if(Utility.shared.isRTLLanguage()) {
//        dateFormatter.locale = NSLocale(localeIdentifier:"en") as Locale
//             }
//             else {
//                 dateFormatter.locale = NSLocale(localeIdentifier:Utility.shared.getAppLanguageCode()!) as Locale
//             }
        let date = dateFormatter.string(from: showDate)
            return date } else {
            return Utility.shared.getdateformatter(date: timestamp) }
    }
    
    func getdayValue(timestamp:String) -> String
    {
         if(Int(timestamp) != nil ) {
        let timestamValue = Int(timestamp)!/1000
        let showDate = Date(timeIntervalSince1970:TimeInterval(timestamValue))
        let dateFormatter1 = DateFormatter()
             dateFormatter1.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter1.dateFormat = itenarayReceiptDayFormat
             if(Utility.shared.isRTLLanguage()) {
        dateFormatter1.locale = NSLocale(localeIdentifier:"en") as Locale
             }
             else {
                 dateFormatter1.locale = NSLocale(localeIdentifier:Utility.shared.getAppLanguageCode()!) as Locale
             }
        let day = dateFormatter1.string(from: showDate)
            return day } else {
           return Utility.shared.getdateformatter1(date: timestamp) }
    }
    func conversionRailwaytime(time:String) -> String
    {
        var dateAsString = time
        var strArr = time.split{$0 == ":"}.map(String.init)
        let hour = Int(strArr[0])!
        if(hour > 12 && hour != 24 && hour != 25 && hour != 26){
            dateAsString = "\(Int(dateAsString)!-12)" + " " +  "PM"
        }
        else if(hour == 25)
        {
            dateAsString = "1 AM"
        }
        else if(hour == 26)
        {
            dateAsString = "2 AM"
        }
        else if(hour == 12)
        {
            dateAsString = "12 PM"
        }
        else if(hour == 24)
        {
            dateAsString = "12 AM"
        }
        else{
            let trimmedString = dateAsString.replacingOccurrences(of: "^0+", with: "", options: .regularExpression)
            dateAsString = trimmedString +  " " +  "AM"
        }
        return dateAsString
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

