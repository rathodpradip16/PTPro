//
//  ReceiptVC.swift
//  App
//
//  Created by RadicalStart on 03/06/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import WebKit
import PDFKit
import MKToolTip

@available(iOS 11.0, *)
class ReceiptVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UIDocumentInteractionControllerDelegate,UIPrintInteractionControllerDelegate{
    
    

    @IBOutlet weak var receiptTable: UITableView!
    @IBOutlet weak var topView: UIView!
    var documentInteractionController: UIDocumentInteractionController!
    
    var getReservationArray : PTProAPI.GetReservationQuery.Data.GetReservation.Results?
    var getbillingArray : PTProAPI.GetBillingCalculationQuery.Data.GetBillingCalculation.Result?
    var getReservation_currencyArray : PTProAPI.GetReservationQuery.Data.GetReservation?
    var totalPriceLabel = String()
    var currencyvalue_from_API_base = String()
    var ISfromShortcut = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialsetup()
        self.view.backgroundColor = UIColor(named: "colorController")
        receiptTable.backgroundColor =  UIColor(named: "colorController")
        receiptTable.reloadData()
        let pdfFilePath = self.receiptTable.exportAsPdfFromTable()
        let url = URL(fileURLWithPath:pdfFilePath)
        self.documentInteractionController = UIDocumentInteractionController.init(url: url)
        self.documentInteractionController?.delegate = self
        //self.documentInteractionController?.presentPreview(animated: true)
        if UIPrintInteractionController.canPrint(url) {
            let printInfo = UIPrintInfo(dictionary: nil)
            printInfo.jobName = url.lastPathComponent
            printInfo.outputType = .photo
            let printController = UIPrintInteractionController.shared
            printController.printInfo = printInfo
            printController.showsNumberOfCopies = false
            printController.delegate = self
            printController.printingItem = url
            printController.present(animated:true, completionHandler: nil)
        }
        self.receiptTable.isHidden = true
//
//        let state = UIApplication.shared.applicationState
//        if state == .background || state == .inactive {
//            // background
//        } else if state == .active {
//            // foreground
//        }
//
//        switch UIApplication.shared.applicationState {
//            case .background, .inactive:
//                // background
//            print("Inactive")
//            break
//            case .active:
//                // foreground
//            print("Active")
//                       break
//            default:
//                break
//        }
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(AppBackGround), name: UIApplication.willEnterForegroundNotification, object: nil)
        // Do any additional setup after loading the view.
    }
    @objc func AppBackGround(){
        print("App in background")
       // self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func backbtnTapped(_ sender: Any) {
    self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    func printInteractionControllerDidDismissPrinterOptions(_ printInteractionController: UIPrintInteractionController)
    {

        self.presentingViewController?.dismiss(animated: false, completion: {
            Utility.shared.isreceiptAccepted = true
            Utility.shared.isreceiptAcceptedHost = true
        })
    }
        
        func printInteractionControllerWillDismissPrinterOptions(_ printInteractionController: UIPrintInteractionController) {
            self.presentingViewController?.dismiss(animated: false, completion: {
                Utility.shared.isreceiptAccepted = true
                Utility.shared.isreceiptAcceptedHost = true
            })
         
        }
    
    
    func initialsetup()
    {
        if IS_IPHONE_XR || IS_IPHONE_X
        {
            self.topView.frame = CGRect(x: 0, y: 0, width: FULLWIDTH-40, height: 80)
            receiptTable.frame = CGRect(x: 0, y: 85, width: FULLWIDTH-40, height: FULLHEIGHT-300)
            
        }
        
        let shadowSize : CGFloat = 3.0
        
        let shadowPath1 = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
                                                    y: -shadowSize / 2,
                                                    width: self.topView.frame.size.width+40 + shadowSize,
                                                    height: self.topView.frame.size.height + shadowSize))
        
        self.topView.layer.masksToBounds = false
        self.topView.layer.shadowColor = Theme.TextLightColor.cgColor
        self.topView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.topView.layer.shadowOpacity = 0.3
        self.topView.layer.shadowPath = shadowPath1.cgPath
        receiptTable.register(UINib(nibName: "customerReceiptCell", bundle: nil), forCellReuseIdentifier: "customerReceiptCell")
        receiptTable.register(UINib(nibName: "NameReceiptCell", bundle: nil), forCellReuseIdentifier: "NameReceiptCell")
         receiptTable.register(UINib(nibName: "AccommadationCell", bundle: nil), forCellReuseIdentifier: "AccommadationCell")
         receiptTable.register(UINib(nibName: "ItenarycheckCell", bundle: nil), forCellReuseIdentifier: "ItenarycheckCell")
         receiptTable.register(UINib(nibName: "RequestBookcellTableViewCell", bundle: nil), forCellReuseIdentifier: "RequestBookcellTableViewCell")
         receiptTable.register(UINib(nibName: "BookingTotalCell", bundle: nil), forCellReuseIdentifier: "BookingTotalCell")
        receiptTable.register(UINib(nibName: "RentpaymentReceiptCell", bundle: nil), forCellReuseIdentifier: "RentpaymentReceiptCell")
        receiptTable.register(UINib(nibName: "ReservationCell", bundle: nil), forCellReuseIdentifier: "ReservationCell")
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
       
        return 8
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 5)
        {
            if(getReservationArray?.cleaningPrice == 0 || getReservationArray?.cleaningPrice == nil)
            {
                if(getReservationArray?.discountType != nil && getReservationArray?.discount != 0)
                {
                    return 3
                }
                return 2
                
            }
            else
            {
                if(getReservationArray?.discountType != nil && getReservationArray?.discount != 0)
                {
                    return 4
                }
                return 3
            }
        }
            
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customerReceiptCell", for: indexPath)as! customerReceiptCell
            if let receiptId = getReservationArray?.id{
                cell.receiptNumberLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"receipt"))!): #\(receiptId)"
            }else{
                cell.receiptNumberLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"receipt"))!):"
            }
            if let confirmationCode = getReservationArray?.confirmationCode{
                cell.confirmCodeLAbel.text = "\((Utility.shared.getLanguage()?.value(forKey:"confirmationcode"))!) \(confirmationCode)"
            }else{
                cell.confirmCodeLAbel.text = "\((Utility.shared.getLanguage()?.value(forKey:"confirmationcode"))!)"
            }

            let timestamValue = Int(getReservationArray?.createdAt! ?? "0")!/1000
            let showDate = Date(timeIntervalSince1970:TimeInterval(timestamValue))
            let dateFormatter = DateFormatter()
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            dateFormatter.dateFormat = receiptformat
//            if(Utility.shared.isRTLLanguage()) {
//       dateFormatter.locale = NSLocale(localeIdentifier:"en") as Locale
//            }
//            else {
//                dateFormatter.locale = NSLocale(localeIdentifier:Utility.shared.getAppLanguageCode()!) as Locale
//            }
            let dateFormatter1 = DateFormatter()
            dateFormatter1.timeZone = TimeZone(abbreviation: "UTC")
            dateFormatter1.dateFormat = itenarayReceiptDayFormat
//            if(Utility.shared.isRTLLanguage()) {
//       dateFormatter1.locale = NSLocale(localeIdentifier:"en") as Locale
//            }
//            else {
//                dateFormatter1.locale = NSLocale(localeIdentifier:Utility.shared.getAppLanguageCode()!) as Locale
//            }
            let day = dateFormatter1.string(from: showDate)
            let date = dateFormatter.string(from: showDate)
            cell.dateLabel.text = "\(day), \(date)"
            cell.selectionStyle = .none
            return cell
        }
        if(indexPath.section == 1)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameReceiptCell", for: indexPath)as! NameReceiptCell
            cell.selectionStyle = .none
            cell.nameLabel.text = getReservationArray?.guestData?.firstName != nil ? getReservationArray?.guestData?.firstName! : ""
            cell.destinationLabel.text = getReservationArray?.listData?.city != nil ? getReservationArray?.listData?.city! : ""
            
            
            if getReservationArray?.nights ?? 0 > 1{
                cell.durationLbel.text = "\((getReservationArray?.nights != nil ? getReservationArray?.nights! : 0) ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"nights")) ?? "nights")"
            }else{
                cell.durationLbel.text = "\((getReservationArray?.nights != nil ? getReservationArray?.nights! : 0) ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)"
            }
            
            cell.accomadationLabel.text = getReservationArray?.listData?.roomType != nil ? getReservationArray?.listData?.roomType! : ""
            if Utility.shared.isRTLLanguage()
            {
                cell.nameLAbel.textAlignment = .right
                cell.destinationLabel.textAlignment = .right
                cell.durationLbel.textAlignment = .right
                cell.accomadationLabel.textAlignment = .right
                cell.nameLabel.textAlignment = .right
                cell.travelLabel.textAlignment = .right
                cell.durationTitleLAbel.textAlignment = .right
                cell.accomadationTitleLabel.textAlignment = .right
            }
            else
            {
                cell.nameLAbel.textAlignment = .left
                              cell.destinationLabel.textAlignment = .left
                              cell.durationLbel.textAlignment = .left
                              cell.accomadationLabel.textAlignment = .left
                cell.nameLabel.textAlignment = .left
                               cell.travelLabel.textAlignment = .left
                               cell.durationTitleLAbel.textAlignment = .left
                               cell.accomadationTitleLabel.textAlignment = .left
            }
            
            cell.reservationCodeTitle.text = "\((Utility.shared.getLanguage()?.value(forKey:"confirmationcode"))!)"
            if let confirmationCode = getReservationArray?.confirmationCode{
                cell.reservationCodeLabel.text = "\(confirmationCode)"
            }else{
                cell.reservationCodeLabel.text = ""
            }
            return cell
        }
        if(indexPath.section == 2)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccommadationCell", for: indexPath)as! AccommadationCell
            cell.selectionStyle = .none
            cell.addressLAbel.text = "\(getReservationArray?.listData?.street != nil ? ((getReservationArray?.listData?.street!)!) : "" ), \(getReservationArray?.listData?.city != nil ? ((getReservationArray?.listData?.city!)!) : "" ), \(getReservationArray?.listData?.state != nil ? ((getReservationArray?.listData?.state!)!) : "" ), \(getReservationArray?.listData?.country != nil ? ((getReservationArray?.listData?.country!)!) : "" ), \(getReservationArray?.listData?.zipcode != nil ? ((getReservationArray?.listData?.zipcode!)!) : "" )"
            cell.hostnameLabel.text = getReservationArray?.hostData?.firstName != nil ? getReservationArray?.hostData?.firstName! : ""
    
            return cell
        }
        if(indexPath.section == 3)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItenarycheckCell", for: indexPath)as! ItenarycheckCell
            cell.selectionStyle = .none
            let day = getdayValue(timestamp: getReservationArray?.checkIn! ?? "")
            let date = getdateValue(timestamp: getReservationArray?.checkIn! ?? "")
            if Utility.shared.isRTLLanguage()
            {
                cell.checkoutLabel.text = "\(day), \(date)"
            }
            else
            {
               cell.checkinLabel.text = "\(day), \(date)"
            }
            
            if(getReservationArray?.checkInStart != "" && getReservationArray?.checkInStart != ""){
            if (getReservationArray?.checkInStart == "Flexible" && getReservationArray?.checkInEnd == "Flexible" ) {
            if Utility.shared.isRTLLanguage()
                       {
                               cell.checkouttimeLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "checkintimesmal"))!)"
                }
            else{
                cell.checkinTimeLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "checkintimesmal"))!)"
                }
                
            } else if (getReservationArray?.checkInStart != "Flexible" && getReservationArray?.checkInEnd == "Flexible") {
                let date = conversionRailwaytime(time:(getReservationArray?.checkInStart!)!)
                
                if Utility.shared.isRTLLanguage()
                    {
                                   cell.checkouttimeLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "from"))!) \(date)"
                    }
                else{
                   cell.checkinTimeLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "from"))!) \(date)"
                    }
                
            }else if (getReservationArray?.checkInStart == "Flexible" && getReservationArray?.checkInEnd != "Flexible") {
                let date = conversionRailwaytime(time:(getReservationArray?.checkInEnd!)!)
                              
                if Utility.shared.isRTLLanguage()
                    {
                        cell.checkouttimeLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "upto"))!) \(date)"
                    }
                else{
                    cell.checkinTimeLabel.text = "\((Utility.shared.getLanguage()?.value(forKey: "upto"))!) \(date)"
                    }
                
            } else if (getReservationArray?.checkInStart != "Flexible" && getReservationArray?.checkInEnd != "Flexible") {
                let date = conversionRailwaytime(time:(getReservationArray?.checkInStart!)!)
                let date1 = conversionRailwaytime(time:(getReservationArray?.checkInEnd!)!)
                
                if Utility.shared.isRTLLanguage()
                    {
                      cell.checkouttimeLabel.text = "\(date) - \(date1)"
                    }
                else{
                    cell.checkinTimeLabel.text = "\(date) - \(date1)"
                    }
                }}else{
               
                if Utility.shared.isRTLLanguage()
                    {
                       cell.checkouttimeLabel.text = ""
                    }
                else{
                     cell.checkinTimeLabel.text = ""
                    }
            }
//            if(getReservationArray?.listData?.listingData?.checkInStart != "Flexible")
//            {
//                //let day = getdayValue(timestamp:(getReservationArray?.listData?.listingData?.checkInStart!)!)
//                let date = conversionRailwaytime(time:(getReservationArray?.listData?.listingData?.checkInStart!)!)
//                cell.checkinTimeLabel.text = "\(date)"
//
//            }
//            else
//            {
//            cell.checkinTimeLabel.text = getReservationArray?.listData?.listingData?.checkInStart!
//            }
//            if(getReservationArray?.listData?.listingData?.checkInEnd != "Flexible")
//            {
//             //   let day = getdayValue(timestamp:(getReservationArray?.listData?.listingData?.checkInEnd!)!)
//                let date = conversionRailwaytime(time:(getReservationArray?.listData?.listingData?.checkInEnd!)!)
//                cell.checkouttimeLabel.text = "\(date)"
//            }
//            else
//            {
//            cell.checkouttimeLabel.text = getReservationArray?.listData?.listingData?.checkInEnd!
//            }
            
            let day1 = getdayValue(timestamp: getReservationArray?.checkOut! ?? "")
            let date1 = getdateValue(timestamp: getReservationArray?.checkOut! ?? "")
           
            if Utility.shared.isRTLLanguage()
            {
                 cell.checkinLabel.text = "\(day1), \(date1)"
                cell.checkinTimeLabel.text = ""
            }
            else
            {
                 cell.checkoutLabel.text = "\(day1), \(date1)"
                cell.checkouttimeLabel.text = ""
            }
            return cell
        }
       if(indexPath.section == 4)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReservationCell", for: indexPath)as! ReservationCell
            cell.selectionStyle = .none
        
            return cell
        }
        if(indexPath.section == 5)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RequestBookcellTableViewCell", for: indexPath)as! RequestBookcellTableViewCell
            cell.selectionStyle = .none
            var currencysymbol = String()
            

            cell.specialImage.isHidden = true
             cell.specialImage.addTarget(self, action: #selector(tooltipBtnTapped),for:.touchUpInside)
            if(getReservationArray?.cleaningPrice == 0 || getReservationArray?.cleaningPrice == nil)
            {
                if(getReservationArray?.discountType != nil && getReservationArray?.discount != 0)
                {
                    if(indexPath.row == 0)
                    {
                        if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
                        {
                            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
                            let from_currency = getReservationArray?.currency!
                            var total = Double()
                            if(getReservation_currencyArray?.convertedIsSpecialAverage != nil)
                            {
                                total = Double(getReservation_currencyArray?.convertedIsSpecialAverage! ?? 0.0)
                            }
                            else
                            {
                                total = Double(getReservation_currencyArray?.convertedBasePrice! ?? 0.0)
                            }
                            if(getReservation_currencyArray?.convertedIsSpecialAverage != getReservation_currencyArray?.convertedBasePrice)
                            {
                              //  cell.specialImage.isHidden = false
                            }
                            if Utility.shared.isRTLLanguage()
                            {
//                                cell.priceLeftLabel.text =  "\(currencysymbol!)\(total.clean) x \(getReservationArray?.nights != nil ? getReservationArray?.nights! : 0) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)\(getReservationArray?.nights! > 1 ? "s" : "")"
                                
                                if getReservationArray?.nights ?? 0 > 1{
                                    cell.priceLeftLabel.text =  "\(currencysymbol!)\(total.clean) x \((getReservationArray?.nights != nil ? getReservationArray?.nights! : 0 ) ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"nights")) ?? "nights")"
                                }else{
                                    cell.priceLeftLabel.text =  "\(currencysymbol!)\(total.clean) x \((getReservationArray?.nights != nil ? getReservationArray?.nights! : 0) ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)"
                                }
                                
                                let calculated_Price = Double(String(format: "%.2f",(getReservation_currencyArray?.convertedTotalNightsAmount! ?? 0.0)))
                                cell.priceLabel.text = "\(currencysymbol!)\(calculated_Price!.clean)"
                            }
                            else{
//                                cell.priceLabel.text =  "\(currencysymbol!)\(total.clean) x \(getReservationArray?.nights != nil ? getReservationArray?.nights! : 0) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)\(getReservationArray?.nights! > 1 ? "s" : "")"
                                
                                if getReservationArray?.nights ?? 0 > 1{
                                    cell.priceLabel.text =  "\(currencysymbol!)\(total.clean) x \((getReservationArray?.nights != nil ? getReservationArray?.nights! : 0) ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"nights")) ?? "nights")"
                                }else{
                                    cell.priceLabel.text =  "\(currencysymbol!)\(total.clean) x \((getReservationArray?.nights != nil ? getReservationArray?.nights! : 0) ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)"
                                }
                                
                                let calculated_Price = Double(String(format: "%.2f",(getReservation_currencyArray?.convertedTotalNightsAmount! ?? 0.0)))
                                cell.priceLeftLabel.text = "\(currencysymbol!)\(calculated_Price!.clean)"
                            }
                            
            
                            
                        }
                        else
                        {
                            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:Utility.shared.currencyvalue_from_API_base)
                            let from_currency = getReservationArray?.currency != nil ? getReservationArray?.currency! : "USD"
                            var total = Double()
                            if(getReservation_currencyArray?.convertedIsSpecialAverage != nil)
                            {
                                total = Double(getReservation_currencyArray?.convertedIsSpecialAverage! ?? 0.0)
                            }
                            else
                            {
                                total = Double(getReservation_currencyArray?.convertedBasePrice! ?? 0.0)
                            }
                            if(getReservationArray?.isSpecialPriceAverage != getReservationArray?.basePrice)
                            {
                             //   cell.specialImage.isHidden = false
                            }
                           if Utility.shared.isRTLLanguage()
                            {
//                                cell.priceLeftLabel.text =  "\(currencysymbol!)\(total.clean) x \(getReservationArray?.nights!) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)\(getReservationArray?.nights! > 1 ? "s" : "")"
                                
                                if getReservationArray?.nights ?? 0 > 1{
                                    cell.priceLeftLabel.text = "\(currencysymbol!)\(total.clean) x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"nights")) ?? "nights")"
                                }else{
                                    cell.priceLeftLabel.text = "\(currencysymbol!)\(total.clean) x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)"
                                }
                                
                               let calculated_Price = Double(String(format: "%.2f",getReservation_currencyArray?.convertedTotalNightsAmount! ?? 0.0))
                                                           cell.priceLabel.text = "\(currencysymbol!)\(calculated_Price!.clean)"
                            }
                            else
                           {
//                            cell.priceLabel.text =  "\(currencysymbol!)\(total.clean) x \(getReservationArray?.nights!) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)\(getReservationArray?.nights! > 1 ? "s" : "")"
                            
                            if getReservationArray?.nights ?? 0 > 1 {
                                cell.priceLabel.text =  "\(currencysymbol!)\(total.clean) x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"nights")) ?? "nights")"
                            }else{
                                cell.priceLabel.text = "\(currencysymbol!)\(total.clean) x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)"
                            }
                                let calculated_Price = Double(String(format: "%.2f",getReservation_currencyArray?.convertedTotalNightsAmount! ?? 0.0))
                            cell.priceLeftLabel.text = "\(currencysymbol!)\(calculated_Price!.clean)"
                            }
                        }

                    }
                    else if(indexPath.row == 1)
                    {
                        
                        if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
                        {
                            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)

                            
                            if(!Utility.shared.host_isfrom_hostRecipt)
                            {
                                let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedGuestServicefee! ?? 0.0))
                                if Utility.shared.isRTLLanguage()
                                {
                                    cell.priceLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                    cell.priceLeftLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                                else{
                                    cell.priceLeftLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                    cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                            
                            }
                            else
                            {
                                let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedHostServiceFee! ?? 0.0))
                                if Utility.shared.isRTLLanguage()
                                {
                              cell.priceLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                    cell.priceLeftLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                                else
                                {
                                   cell.priceLeftLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                    cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                            }
        
                        }
                        else
                        {
                            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:Utility.shared.currencyvalue_from_API_base)

                            
                            if(!Utility.shared.host_isfrom_hostRecipt)
                            {
                                let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedGuestServicefee! ?? 0.0))
                                if Utility.shared.isRTLLanguage()
                                {
                                    cell.priceLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                    cell.priceLeftLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                                else{
                                   cell.priceLeftLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                    cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                            
                            }
                            else
                            {
                                let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedHostServiceFee! ?? 0.0))
                            
                                if Utility.shared.isRTLLanguage()
                                {
                                    cell.priceLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                    cell.priceLeftLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                                else{
                                   cell.priceLeftLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                    cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                            }
                            
                            
                        }
                        
                       
                    }
                    else{
                        
                        if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
                        {
                            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
                            
                            let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedDiscount! ?? 0.0))
                            if Utility.shared.isRTLLanguage()
                            {
                                cell.priceLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                cell.priceLeftLabel.text = "\(getReservationArray?.discountType!.capitalized ?? "")"
                            }
                            else{
                                cell.priceLeftLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                cell.priceLabel.text = "\(getReservationArray?.discountType!.capitalized ?? "")"
                            }
                            
                            
                            
                        }
                        else
                        {
                            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:Utility.shared.currencyvalue_from_API_base)
                            

                            let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedDiscount! ?? 0.0))
                            if Utility.shared.isRTLLanguage()
                            {
                                cell.priceLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                                           cell.priceLeftLabel.text = "\(getReservationArray?.discountType!.capitalized)"
                            }
                            else
                            {
                                cell.priceLeftLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                                           cell.priceLabel.text = "\(getReservationArray?.discountType!.capitalized)"
                            }
                           
                            
                        }
                        
                       // cell.priceLeftLabel.text = "\(getReservationArray?.discount!)"
                    }
                    cell.priceLabelLeadingConstraint.constant = cell.specialImage.isHidden ? -20 : 5
                    return cell
                }
                else
                {
                    if(indexPath.row == 0)
                    {
                        if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
                        {
                            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
                            let from_currency = getReservationArray?.currency!
                            var total = Double()
                            if(getReservation_currencyArray?.convertedIsSpecialAverage != nil)
                            {
                                total = Double(getReservation_currencyArray?.convertedIsSpecialAverage! ?? 0.0)
                            }
                            else
                            {
                                total = Double(getReservation_currencyArray?.convertedBasePrice! ?? 0.0)
                            }
                            if(getReservationArray?.isSpecialPriceAverage != getReservationArray?.basePrice)
                            {
                              //  cell.specialImage.isHidden = false
                            }
                            if Utility.shared.isRTLLanguage()
                            {
//                            cell.priceLeftLabel.text =  "\(currencysymbol!)\(total.clean) x \(getReservationArray?.nights!) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)\(getReservationArray?.nights! > 1 ? "s" : "")"
                                
                                
                                if getReservationArray?.nights ?? 0 > 1 {
                                    cell.priceLeftLabel.text =  "\(currencysymbol!)\(total.clean) x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"nights")) ?? "nights")"
                                }else{
                                    cell.priceLeftLabel.text =  "\(currencysymbol!)\(total.clean) x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)"
                                }
                                
                                let calculated_Price = Double(String(format: "%.2f",getReservation_currencyArray?.convertedTotalNightsAmount! ?? 0.0))
                            cell.priceLabel.text = "\(currencysymbol!)\(calculated_Price!.clean)"
                            }
                            else{
//                                cell.priceLabel.text =  "\(currencysymbol!)\(total.clean) x \(getReservationArray?.nights!) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)\(getReservationArray?.nights! > 1 ? "s" : "")"
                                
                                if getReservationArray?.nights ?? 0 > 1 {
                                    cell.priceLabel.text =  "\(currencysymbol!)\(total.clean) x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"nights")) ?? "nights")"
                                }else{
                                    cell.priceLabel.text =  "\(currencysymbol!)\(total.clean) x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)"
                                }
                                
                                let calculated_Price = Double(String(format: "%.2f",getReservation_currencyArray?.convertedTotalNightsAmount! ?? 0.0))
                                cell.priceLeftLabel.text = "\(currencysymbol!)\(calculated_Price!.clean)"
                            }
                            
                            
                        }
                        else
                        {
                            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:Utility.shared.currencyvalue_from_API_base)
                            let from_currency = getReservationArray?.currency!
                            var total = Double()
                            if(getReservation_currencyArray?.convertedIsSpecialAverage != nil)
                            {
                                total = Double(getReservation_currencyArray?.convertedIsSpecialAverage! ?? 0.0)
                            }
                            else
                            {
                                total = Double(getReservation_currencyArray?.convertedBasePrice! ?? 0.0)
                            }
                            if(getReservationArray?.isSpecialPriceAverage != getReservationArray?.basePrice)
                            {
                              //  cell.specialImage.isHidden = false
                            }
                            if Utility.shared.isRTLLanguage()
                            {
//                                cell.priceLeftLabel.text =  "\(currencysymbol!)\(total.clean) x \(getReservationArray?.nights!) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)\(getReservationArray?.nights! > 1 ? "s" : "")"
                                
                                if getReservationArray?.nights ?? 0 > 1{
                                    cell.priceLeftLabel.text =  "\(currencysymbol!)\(total.clean) x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"nights")) ?? "nights")"
                                }else{
                                    cell.priceLeftLabel.text =  "\(currencysymbol!)\(total.clean) x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)"
                                }
                                
                                let calculated_Price = Double(String(format: "%.2f",getReservation_currencyArray?.convertedTotalNightsAmount! ?? 0.0))
                                cell.priceLabel.text = "\(currencysymbol!)\(calculated_Price!.clean)"
                            }
                            else{
//                                cell.priceLabel.text =  "\(currencysymbol!)\(total.clean) x \(getReservationArray?.nights!) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)\(getReservationArray?.nights! > 1 ? "s" : "")"
                                
                                if getReservationArray?.nights ?? 0 > 1{
                                    cell.priceLabel.text =  "\(currencysymbol!)\(total.clean) x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"nights")) ?? "nights")"
                                }else{
                                    cell.priceLabel.text =  "\(currencysymbol!)\(total.clean) x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)"
                                }
                                
                                let calculated_Price = Double(String(format: "%.2f",getReservation_currencyArray?.convertedTotalNightsAmount! ?? 0.0))
                                cell.priceLeftLabel.text = "\(currencysymbol!)\(calculated_Price!.clean)"
                            }
                            
                            
                            
                        }

                    }
                    else if(indexPath.row == 1)
                    {
                        
                        
                        if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
                        {
                            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
                            
                   
                           
                            if(!Utility.shared.host_isfrom_hostRecipt)
                            {
                                let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedGuestServicefee! ?? 0.0))
                                if Utility.shared.isRTLLanguage()
                                {
                              cell.priceLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                    cell.priceLeftLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                                else{
                                  cell.priceLeftLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                    cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                            }
                            else
                            {
                                let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedHostServiceFee! ?? 0.0))
                                if Utility.shared.isRTLLanguage()
                                {
                              cell.priceLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                     cell.priceLeftLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                                else{
                                   cell.priceLeftLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                     cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                            }
                            
                            
                            
                            
                        }
                        else
                        {
                            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:Utility.shared.currencyvalue_from_API_base)
                            
                          
                            
                            if(!Utility.shared.host_isfrom_hostRecipt)
                            {
                                let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedGuestServicefee! ?? 0.0))
                           // cell.priceLeftLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                if Utility.shared.isRTLLanguage()
                                  {
                                cell.priceLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                       cell.priceLeftLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                  }
                                  else{
                                     cell.priceLeftLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                       cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                  }
                            }
                            else
                            {
                                let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedHostServiceFee! ?? 0.0))
                             // cell.priceLeftLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                if Utility.shared.isRTLLanguage()
                                  {
                                cell.priceLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                       cell.priceLeftLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                  }
                                  else{
                                     cell.priceLeftLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                       cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                  }
                            }
                            
                            
                        }
                    }
                    cell.priceLabelLeadingConstraint.constant = cell.specialImage.isHidden ? -20 : 5
                    return cell
                    
                }
                
            }
            else{
                
                if(getReservationArray?.discountType != nil && getReservationArray?.discount != 0)
                {
                    if(indexPath.row == 0)
                    {
                        var currencysymbol = String()
                        if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
                        {
                            currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)!
                        }
                        else
                        {
                            currencysymbol = Utility.shared.getSymbol(forCurrencyCode:Utility.shared.currencyvalue_from_API_base)!
                        }
                        var total = Double()
                        if(getReservation_currencyArray?.convertedIsSpecialAverage != nil)
                        {
                            total = Double(getReservation_currencyArray?.convertedIsSpecialAverage! ?? 0.0)
                        }
                        else
                        {
                            total = Double(getReservation_currencyArray?.convertedBasePrice! ?? 0.0)
                        }
                        if(getReservationArray?.isSpecialPriceAverage != getReservationArray?.basePrice)
                        {
                           // cell.specialImage.isHidden = false
                        }
                        if Utility.shared.isRTLLanguage()
                        {
//                        cell.priceLeftLabel.text =  "\(currencysymbol)\(total.clean) x \(getReservationArray?.nights!) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)\(Utility.shared.numberofnights_Selected > 1 ? "s" : "")"
                            
                            if Utility.shared.numberofnights_Selected > 1{
                                cell.priceLeftLabel.text =  "\(currencysymbol)\(total.clean) x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"nights")) ?? "nights")"
                            }else{
                                cell.priceLeftLabel.text =  "\(currencysymbol)\(total.clean) x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)"
                            }
                            
                            let calculated_Price = Double(String(format: "%.2f",getReservation_currencyArray?.convertedTotalNightsAmount! ?? 0.0))
                        cell.priceLabel.text = "\(currencysymbol)\(calculated_Price!.clean)"
                        }
                        else
                        {
//                            cell.priceLabel.text =  "\(currencysymbol)\(total.clean) x \(getReservationArray?.nights!) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)\(Utility.shared.numberofnights_Selected > 1 ? "s" : "")"
                            
                            if Utility.shared.numberofnights_Selected > 1 {
                                cell.priceLabel.text =  "\(currencysymbol)\(total.clean) x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"nights")) ?? "nights")"
                            }else{
                                cell.priceLabel.text =  "\(currencysymbol)\(total.clean) x \(getReservationArray?.nights! ?? 0)  \((Utility.shared.getLanguage()?.value(forKey:"night"))!)"
                            }
                            
                            let calculated_Price = Double(String(format: "%.2f",getReservation_currencyArray?.convertedTotalNightsAmount! ?? 0.0))
                                                   cell.priceLeftLabel.text = "\(currencysymbol)\(calculated_Price!.clean)"
                        }
                        if(getReservationArray?.isSpecialPriceAverage != getReservationArray?.basePrice)
                        {
                            //cell.specialImage.isHidden = false
                        }
                        else
                        {
                            //cell.specialImage.isHidden = true
                        }
                    }
                    else if(indexPath.row == 1)
                    {
                       // cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"cleaningfee"))!)"
                        if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
                        {
                            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
                            
                            let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedCleaningPrice! ?? 0.0))
                            if Utility.shared.isRTLLanguage()
                            {
                                 cell.priceLabel.text = "\(currencysymbol!)\((restricted_price!).clean)"
                                cell.priceLeftLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"cleaningfee"))!)"
                            }
                            else{
                                cell.priceLeftLabel.text = "\(currencysymbol!)\((restricted_price!).clean)"
                                cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"cleaningfee"))!)"
                            }
                           
                            
                            
                            
                        }
                        else
                        {
                            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:Utility.shared.currencyvalue_from_API_base)
                            
                            let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedCleaningPrice! ?? 0.0))
                            if Utility.shared.isRTLLanguage()
                            {
                            cell.priceLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                cell.priceLeftLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"cleaningfee"))!)"
                            }
                            else
                            {
                                cell.priceLeftLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"cleaningfee"))!)"
                            }
                            
                            
                        }
                        
                    }
                    else if(indexPath.row == 2)
                    {
                      //  cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                        
                        if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
                        {
                            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
                            
                            
                            if(!Utility.shared.host_isfrom_hostRecipt)
                            {
                                let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedGuestServicefee! ?? 0.0))
                                if Utility.shared.isRTLLanguage()
                                {
                            cell.priceLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                    cell.priceLeftLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                                else{
                                   cell.priceLeftLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                    cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                            }
                            else
                            {
                                let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedHostServiceFee! ?? 0.0))
                                if Utility.shared.isRTLLanguage()
                                {
                                cell.priceLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                     cell.priceLeftLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                                else
                                {
                                   cell.priceLeftLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                    cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                                
                            }
                            
                            
                            
                        }
                        else
                        {
                            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:Utility.shared.currencyvalue_from_API_base)
                            
                            
                            if(!Utility.shared.host_isfrom_hostRecipt)
                            {
                                let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedGuestServicefee! ?? 0.0))
                                if Utility.shared.isRTLLanguage()
                                {
                            cell.priceLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                     cell.priceLeftLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                                else{
                                   cell.priceLeftLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                     cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                            }
                            else
                            {
                                let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedHostServiceFee! ?? 0.0))
                            //   cell.priceLeftLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                if Utility.shared.isRTLLanguage()
                                    {
                                cell.priceLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                         cell.priceLeftLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                    }
                                    else{
                                       cell.priceLeftLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                         cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                    }
                            }
                            
                            
                        }
                    }
                    else{
                       // cell.priceLabel.text =  getReservationArray?.discountType!.capitalized
                        
                        if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
                        {
                            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
            
                            let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedDiscount! ?? 0.0))
                            if Utility.shared.isRTLLanguage()
                            {
                            cell.priceLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                cell.priceLeftLabel.text =  getReservationArray?.discountType!.capitalized
                            }
                            else{
                                cell.priceLeftLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                cell.priceLabel.text =  getReservationArray?.discountType!.capitalized
                            }
                            
                            
                        }
                        else
                        {
                            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:Utility.shared.currencyvalue_from_API_base)
                            
            
                            let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedDiscount! ?? 0.0))
                           // cell.priceLeftLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                            
                            if Utility.shared.isRTLLanguage()
                            {
                            cell.priceLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                cell.priceLeftLabel.text =  getReservationArray?.discountType!.capitalized
                            }
                            else{
                                cell.priceLeftLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                cell.priceLabel.text =  getReservationArray?.discountType!.capitalized
                            }
                        }
                    }
                    cell.priceLabelLeadingConstraint.constant = cell.specialImage.isHidden ? -20 : 5
                    return cell
                }
                    
                else{
                    if(indexPath.row == 0)
                    {
                        if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
                        {
                            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
                            let from_currency = getReservationArray?.currency!
                           
                            var restricted_price:Double!
                            if(getReservation_currencyArray?.convertedIsSpecialAverage != nil && getReservation_currencyArray?.convertedIsSpecialAverage != 0.0)
                            {
                                restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedIsSpecialAverage! ?? 0.0))
                            }
                            else
                            {
                                  restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedTotalNightsAmount ?? 0))
                            }
                           
                            if(getReservationArray?.isSpecialPriceAverage != getReservationArray?.basePrice)
                            {
                              //  cell.specialImage.isHidden = false
                            }
                            let calculated_Price = Double(String(format: "%.2f",getReservation_currencyArray?.convertedTotalNightsAmount ?? 0))
                            
                            if Utility.shared.isRTLLanguage()
                            {
//                                cell.priceLeftLabel.text =  "\(currencysymbol!)\(restricted_price!.clean) x \(getReservationArray?.nights!) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)\(getReservationArray?.nights! > 1 ? "s" : "")"
                                
                                if getReservationArray?.nights ?? 0 > 1 {
                                    cell.priceLeftLabel.text =  "\(currencysymbol!)\(restricted_price!.clean) x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"nights")) ?? "nights")"
                                }else{
                                    cell.priceLeftLabel.text =  "\(currencysymbol!)\(restricted_price!.clean) x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)"
                                }
                                
                                cell.priceLabel.text = "\(currencysymbol!)\(calculated_Price!.clean)"
                            }
                            else
                            {
//                                 cell.priceLabel.text =  "\(currencysymbol!)\(restricted_price!.clean) x \(getReservationArray?.nights!) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)\(getReservationArray?.nights! > 1 ? "s" : "")"
                                
                                if getReservationArray?.nights! ?? 0 > 1 {
                                    cell.priceLabel.text =  "\(currencysymbol!)\(restricted_price!.clean) x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"nights")) ?? "nights")"
                                }else{
                                    cell.priceLabel.text =  "\(currencysymbol!)\(restricted_price!.clean) x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)"
                                }
                                
                               cell.priceLeftLabel.text = "\(currencysymbol!)\(calculated_Price!.clean)"
                            }
                        }
                        else
                        {
                            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:Utility.shared.currencyvalue_from_API_base)
                            let from_currency = getReservationArray?.currency!
                            let total = Double(getReservationArray?.isSpecialPriceAverage! ?? 0)
                            if(getReservationArray?.isSpecialPriceAverage != getReservationArray?.basePrice)
                            {
                               // cell.specialImage.isHidden = false
                            }
                          
                            
                            let calculated_Price = Double(String(format: "%.2f",(getReservation_currencyArray?.convertedTotalNightsAmount! ?? 0.0)))
                           
                            if Utility.shared.isRTLLanguage()
                            {
//                                cell.priceLeftLabel.text =  "\(currencysymbol!)\(getReservation_currencyArray?.convertedIsSpecialAverage!.clean) x \(getReservationArray?.nights!) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)\(getReservationArray?.nights! > 1 ? "s" : "")"
                                
                                if getReservationArray?.nights ?? 0 > 1{
                                    cell.priceLeftLabel.text =  "\(currencysymbol!)\(getReservation_currencyArray?.convertedIsSpecialAverage!.clean ?? "") x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"nights")) ?? "nights")"
                                }else{
                                    cell.priceLeftLabel.text =  "\(currencysymbol!)\(getReservation_currencyArray?.convertedIsSpecialAverage!.clean ?? "") x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)"
                                }
                                 cell.priceLabel.text = "\(currencysymbol!)\(calculated_Price!.clean)"
                            }
                            else
                            {
//                                cell.priceLabel.text =  "\(currencysymbol!)\(getReservation_currencyArray?.convertedIsSpecialAverage!.clean) x \(getReservationArray?.nights!) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)\(getReservationArray?.nights! > 1 ? "s" : "")"
                                
                                if getReservationArray?.nights ?? 0 > 1{
                                    cell.priceLabel.text =  "\(currencysymbol!)\(getReservation_currencyArray?.convertedIsSpecialAverage!.clean ?? "") x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"nights")) ?? "nights")"
                                }else{
                                    cell.priceLabel.text =  "\(currencysymbol!)\(getReservation_currencyArray?.convertedIsSpecialAverage!.clean ?? "") x \(getReservationArray?.nights! ?? 0) \((Utility.shared.getLanguage()?.value(forKey:"night"))!)"
                                }
                                cell.priceLeftLabel.text = "\(currencysymbol!)\(calculated_Price!.clean)"
                            }
                            if(getReservationArray?.isSpecialPriceAverage != getReservationArray?.basePrice)
                            {
                              //  cell.specialImage.isHidden = false
                            }
                            else
                            {
                                cell.specialImage.isHidden = true
                            }
                            
                        }
                    }
                    else if(indexPath.row == 1)
                    {
                        
                        
                        if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
                        {
                            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
                            
                           
                            let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedCleaningPrice! ?? 0.0))
                            if Utility.shared.isRTLLanguage()
                            {
                            cell.priceLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                cell.priceLeftLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"cleaningfee"))!)"
                            }
                            else{
                              cell.priceLeftLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"cleaningfee"))!)"
                            }
                        }
                        else
                        {
                            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:Utility.shared.currencyvalue_from_API_base)
        
                            let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedCleaningPrice! ?? 0.0))
                         //   cell.priceLeftLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                            if Utility.shared.isRTLLanguage()
                            {
                            cell.priceLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                cell.priceLeftLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"cleaningfee"))!)"
                            }
                            else{
                              cell.priceLeftLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"cleaningfee"))!)"
                            }
                        }
                    }
                    else if(indexPath.row == 2)
                    {
                       // cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                        if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
                        {
                            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
                            if(!Utility.shared.host_isfrom_hostRecipt)
                            {
                                let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedGuestServicefee! ?? 0.0))
                            //cell.priceLeftLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                               if Utility.shared.isRTLLanguage()
                               {
                               cell.priceLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                   cell.priceLeftLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                               }
                               else{
                                 cell.priceLeftLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                   cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                               }
                            }
                            else
                            {
                                let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedHostServiceFee! ?? 0.0))
                            // cell.priceLeftLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                if Utility.shared.isRTLLanguage()
                                {
                                    cell.priceLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                    cell.priceLeftLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                                else{
                                    cell.priceLeftLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                 cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                            }
                        }
                        else
                        {
                            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:Utility.shared.currencyvalue_from_API_base)
                            
                            if(!Utility.shared.host_isfrom_hostRecipt)
                            {
                                let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedGuestServicefee! ?? 0.0))
                          //  cell.priceLeftLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                if Utility.shared.isRTLLanguage()
                                {
                                    cell.priceLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                    cell.priceLeftLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                                else{
                                    cell.priceLeftLabel.text = "\(currencysymbol!)\(restricted_price!.clean)"
                                 cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                            }
                            else
                            {
                                let restricted_price =  Double(String(format: "%.2f",getReservation_currencyArray?.convertedHostServiceFee! ?? 0.0))
                          //  cell.priceLeftLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                if Utility.shared.isRTLLanguage()
                                {
                                    cell.priceLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                    cell.priceLeftLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                                else{
                                    cell.priceLeftLabel.text = "-\(currencysymbol!)\(restricted_price!.clean)"
                                 cell.priceLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"servicefee"))!)"
                                }
                            }
                        }
                    }
                    cell.priceLabelLeadingConstraint.constant = cell.specialImage.isHidden ? -20 : 5
                    return cell
                }
            }
        }
        if(indexPath.section == 6)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookingTotalCell", for: indexPath)as! BookingTotalCell
            cell.selectionStyle = .none
           
            if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
            {
                let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
               if(!Utility.shared.host_isfrom_hostRecipt)
               {
              
                if Utility.shared.isRTLLanguage()
                {
                    cell.totalTitleLabel.text = "\(currencysymbol!)\((getReservation_currencyArray?.convertTotalWithGuestServiceFee != nil ? getReservation_currencyArray?.convertTotalWithGuestServiceFee!.clean : "") ?? "")"
                    totalPriceLabel = "\(currencysymbol!)\((getReservation_currencyArray?.convertTotalWithGuestServiceFee != nil ? getReservation_currencyArray?.convertTotalWithGuestServiceFee!.clean : "") ?? "")"
                    cell.totalPriceLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"total"))!)"
                }
                else
                {
                    cell.totalPriceLabel.text = "\(currencysymbol!)\((getReservation_currencyArray?.convertTotalWithGuestServiceFee != nil ? getReservation_currencyArray?.convertTotalWithGuestServiceFee!.clean : "") ?? "")"
                    totalPriceLabel = "\(currencysymbol!)\((getReservation_currencyArray?.convertTotalWithGuestServiceFee != nil ? getReservation_currencyArray?.convertTotalWithGuestServiceFee!.clean : "") ?? "")"
                    cell.totalTitleLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"total"))!)"
                }
                }
                else
               {
                    if((getReservation_currencyArray?.convertedTotalWithHostServiceFee!.clean.contains("-")) != nil)
                {
                    if Utility.shared.isRTLLanguage()
                    {
                        let val = (getReservation_currencyArray?.convertedTotalWithHostServiceFee!.clean.replacingOccurrences(of:"-", with: ""))
                        cell.totalTitleLabel.text = "-\(currencysymbol!)\(val ?? "")"
                        totalPriceLabel = "-\(currencysymbol!)\(val ?? "")"
                        cell.totalPriceLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"total"))!)"
                    }
                    else{
                 let val = (getReservation_currencyArray?.convertedTotalWithHostServiceFee!.clean.replacingOccurrences(of:"-", with: ""))
                        cell.totalPriceLabel.text = "-\(currencysymbol!)\(val ?? "")"
                        totalPriceLabel = "-\(currencysymbol!)\(val ?? "")"
                         cell.totalTitleLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"total"))!)"
                    }
                }
                else
                {
                    if Utility.shared.isRTLLanguage()
                    {
                        cell.totalTitleLabel.text = "\(currencysymbol!)\((getReservation_currencyArray?.convertedTotalWithHostServiceFee != nil ? getReservation_currencyArray?.convertedTotalWithHostServiceFee!.clean : "" ) ?? "")"
                        totalPriceLabel = "\(currencysymbol!)\((getReservation_currencyArray?.convertedTotalWithHostServiceFee != nil ? getReservation_currencyArray?.convertedTotalWithHostServiceFee!.clean : "") ?? "")"
                        cell.totalPriceLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"total"))!)"
                    }
                    else{
                        cell.totalPriceLabel.text = "\(currencysymbol!)\((getReservation_currencyArray?.convertedTotalWithHostServiceFee != nil ? getReservation_currencyArray?.convertedTotalWithHostServiceFee!.clean : "") ?? "")"
                        totalPriceLabel = "\(currencysymbol!)\((getReservation_currencyArray?.convertedTotalWithHostServiceFee != nil ? getReservation_currencyArray?.convertedTotalWithHostServiceFee!.clean : "") ?? "")"
                         cell.totalTitleLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"total"))!)"
                    }
                }
            }
        }
            else
            {
                let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:Utility.shared.currencyvalue_from_API_base)
                if(!Utility.shared.host_isfrom_hostRecipt)
                {
                    if Utility.shared.isRTLLanguage()
                    {
                        cell.totalTitleLabel.text = "\(currencysymbol!)\((getReservation_currencyArray?.convertTotalWithGuestServiceFee != nil ? getReservation_currencyArray?.convertTotalWithGuestServiceFee!.clean : "") ?? "")"
                        totalPriceLabel = "\(currencysymbol!)\((getReservation_currencyArray?.convertTotalWithGuestServiceFee != nil ? getReservation_currencyArray?.convertTotalWithGuestServiceFee!.clean : "") ?? "")"
                        cell.totalPriceLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"total"))!)"
                    }
                    else
                    {
                        cell.totalPriceLabel.text = "\(currencysymbol!)\((getReservation_currencyArray?.convertTotalWithGuestServiceFee != nil ? getReservation_currencyArray?.convertTotalWithGuestServiceFee!.clean : "") ?? "")"
                        totalPriceLabel = "\(currencysymbol!)\((getReservation_currencyArray?.convertTotalWithGuestServiceFee != nil ? getReservation_currencyArray?.convertTotalWithGuestServiceFee!.clean : "") ?? "")"
                        cell.totalTitleLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"total"))!)"
                    }
                }
                else
                {
                    if Utility.shared.isRTLLanguage()
                                       {
                        cell.totalTitleLabel.text = "\(currencysymbol!)\((getReservation_currencyArray?.convertedTotalWithHostServiceFee != nil ? getReservation_currencyArray?.convertedTotalWithHostServiceFee!.clean : "") ?? "")"
                        totalPriceLabel = "\(currencysymbol!)\((getReservation_currencyArray?.convertedTotalWithHostServiceFee != nil ? getReservation_currencyArray?.convertedTotalWithHostServiceFee!.clean : "") ?? "")"
                                         cell.totalPriceLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"total"))!)"
                    }
                    else
                    {
                        cell.totalPriceLabel.text = "\(currencysymbol!)\((getReservation_currencyArray?.convertedTotalWithHostServiceFee != nil ? getReservation_currencyArray?.convertedTotalWithHostServiceFee!.clean : "") ?? "")"
                        totalPriceLabel = "\(currencysymbol!)\((getReservation_currencyArray?.convertedTotalWithHostServiceFee != nil ? getReservation_currencyArray?.convertedTotalWithHostServiceFee!.clean : "") ?? "")"
                         cell.totalTitleLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"total"))!)"
                    }
                }
            }
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RentpaymentReceiptCell", for: indexPath)as! RentpaymentReceiptCell
            cell.selectionStyle = .none
            
            let day = getdayValue(timestamp: getReservationArray?.updatedAt! ?? "")
            let date = getdateValue(timestamp: getReservationArray?.updatedAt! ?? "")
            cell.paymentDateLabel.text = "\(day), \(date)"
            cell.totalLabel.text = totalPriceLabel
            if Utility.shared.isRTLLanguage()
                       {
                cell.totalLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"paymentreceive"))!)"
                cell.paymentDateLabel.text = totalPriceLabel
                cell.paymentRTLLabel.text = "\(day), \(date)"
                cell.paymentreceiveLAbel.text = ""
                
                
               
                
               
                
                cell.paymentRTLLabel.textColor = UIColor(named: "searchPlaces_TextColor")
               
              //  paymentRTLLabel.textAlignment = Utility.shared.isRTLLanguage() ? .left : .right
                
                cell.paymentDateLabel.textColor = UIColor(named: "Title_Header")
               
                
               
                
                           cell.paymentDateLabel.textAlignment = .right
                           
                           cell.totalLabel.textAlignment = .left
                           cell.paymentreceiveLAbel.textAlignment = .right
                           cell.payemntdescriptionLabel.textAlignment = .right
                           
                       }
                       else{
                           cell.paymentRTLLabel.text = ""
                            cell.paymentDateLabel.textAlignment = .left
                                                    cell.totalLabel.textAlignment = .right
                                                    cell.paymentreceiveLAbel.textAlignment = .left
                                                    cell.payemntdescriptionLabel.textAlignment = .left
                       }
            return cell
        }
    }
    @objc func tooltipBtnTapped(_ sender: UIButton!)
    {
        let preference = ToolTipPreferences()
        preference.drawing.bubble.color = UIColor.darkGray
        preference.drawing.bubble.spacing = 10
        preference.drawing.bubble.cornerRadius = 5
        preference.drawing.bubble.inset = 15
        preference.drawing.bubble.border.color = UIColor.darkGray
        preference.drawing.bubble.border.width = 1
        preference.drawing.arrow.tipCornerRadius = 5
        preference.drawing.message.color = UIColor.white
        preference.drawing.message.font = UIFont(name:APP_FONT, size:15)!
        preference.drawing.button.color = UIColor(red: 0.074, green: 0.231, blue: 0.431, alpha: 1.000)
        preference.drawing.button.font = UIFont(name: APP_FONT, size:15)!
        sender.showToolTip(identifier: "", message:"\((Utility.shared.getLanguage()?.value(forKey:"specialtooltip"))!)", button:nil, arrowPosition: .bottom, preferences: preference, delegate: nil)
    }
    //  fun getRate(base: String, to: String, from: String, rateStr: String, amount: Double) : Double {
    func getCurrencyRate(basecurrency:String,fromCurrency:String,toCurrency:String,CurrencyRate:NSDictionary,amount:Double) -> Double
    {
        if(fromCurrency == basecurrency)
        {
            return (CurrencyRate.object(forKey: toCurrency) as! Double) * (amount)
        }
        else if(toCurrency == basecurrency)
        {
            return  (1 / (CurrencyRate.object(forKey: fromCurrency)as! Double) * (amount))
        }
        else{
            return amount * ((CurrencyRate.object(forKey: toCurrency)as! Double) * ((1 / (CurrencyRate.object(forKey: fromCurrency)as! Double))))
        }
        
    }
    func pdfDataWithTableView(tableView: UITableView)->URL {
        let priorBounds = tableView.bounds
        let fittedSize = tableView.sizeThatFits(CGSize(width:priorBounds.size.width, height:tableView.contentSize.height))
        tableView.bounds = CGRect(x:0, y:0, width:fittedSize.width, height:fittedSize.height)
        let pdfPageBounds = CGRect(x:0, y:0, width:tableView.frame.width, height:self.view.frame.height)
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, pdfPageBounds,nil)
        var pageOriginY: CGFloat = 0
        while pageOriginY < fittedSize.height {
            UIGraphicsBeginPDFPageWithInfo(pdfPageBounds, nil)
            UIGraphicsGetCurrentContext()!.saveGState()
            UIGraphicsGetCurrentContext()!.translateBy(x: 0, y: -pageOriginY)
            tableView.layer.render(in: UIGraphicsGetCurrentContext()!)
            UIGraphicsGetCurrentContext()!.restoreGState()
           
            
            pageOriginY += pdfPageBounds.size.height
        }
         let screenRect = UIScreen.main.bounds
//        UIGraphicsBeginImageContextWithOptions(screenRect.size, false, 0.0)
        UIGraphicsEndPDFContext()
        tableView.bounds = priorBounds
        var docURL = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last! as URL
        docURL = docURL.appendingPathComponent("myDocument.pdf")
        pdfData.write(to: docURL as URL, atomically: true)
       return docURL
    }
   func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController
   {
        return self
    }
    func getdateValue(timestamp:String) -> String
    {
         if(Int(timestamp) != nil ) {
        let timestamValue = Int(timestamp)!/1000
        let showDate = Date(timeIntervalSince1970:TimeInterval(timestamValue))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = receiptformat
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
        dateFormatter1.dateFormat = itenarayReceiptDayFormat
             dateFormatter1.timeZone = TimeZone(abbreviation: "UTC")
//             if(Utility.shared.isRTLLanguage()) {
//        dateFormatter1.locale = NSLocale(localeIdentifier:"en") as Locale
//             }
//             else {
//                 dateFormatter1.locale = NSLocale(localeIdentifier:Utility.shared.getAppLanguageCode()!) as Locale
//             }
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
extension UITableView {
    
    // Export pdf from UITableView and save pdf in drectory and return pdf file path
    func exportAsPdfFromTable() -> String {
        
        let originalBounds = self.bounds
        self.bounds = CGRect(x:originalBounds.origin.x, y: originalBounds.origin.y, width: self.contentSize.width, height:FULLHEIGHT+600)
        let pdfPageFrame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: FULLHEIGHT+600)
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, pdfPageFrame, nil)
        UIGraphicsBeginPDFPageWithInfo(pdfPageFrame, nil)
        let printPageRenderer = UIPrintPageRenderer()
        guard let pdfContext = UIGraphicsGetCurrentContext() else {
            return ""
        }
        self.layer.render(in: pdfContext)
        UIGraphicsEndPDFContext()
        return self.saveTablePdf(data: pdfData)
    }
    // Save pdf file in document directory
    func saveTablePdf(data: NSMutableData) -> String {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirectoryPath = paths[0]
        let pdfPath = docDirectoryPath.appendingPathComponent("customerReceipt.pdf")
        if data.write(to: pdfPath, atomically: true) {
            return pdfPath.path
        } else {
            return ""
        }
    }
}

