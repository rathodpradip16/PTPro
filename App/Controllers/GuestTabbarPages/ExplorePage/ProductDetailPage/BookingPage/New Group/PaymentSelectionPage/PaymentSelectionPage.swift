//
//  PaymentSelectionPage.swift
//  App
//
//  Created by RadicalStart on 08/04/21.
//  Copyright © 2021 RADICAL START. All rights reserved.
//

import UIKit
import Stripe
import Braintree
import BraintreeDropIn
import Lottie
import Apollo
import SwiftMessages

class PaymentSelectionPage: UIViewController {


    @IBOutlet weak var viewPlanDetails: UIView!
    @IBOutlet weak var lblPlanTypeAndPrice: UILabel!
    @IBOutlet weak var viewSubPlanDetails: UIView!

    @IBOutlet weak var lblOne: UILabel!
    @IBOutlet weak var lblTwo: UILabel!
    @IBOutlet weak var lblThree: UILabel!
    @IBOutlet weak var lblFour: UILabel!
    @IBOutlet weak var lblFive: UILabel!
    @IBOutlet weak var lblSix: UILabel!
    
    @IBOutlet weak var viewCouponApplied: UIView!
    @IBOutlet weak var lblCouponPlanNameApplied: UILabel!
    @IBOutlet weak var btnDeleteCoupon: UIButton!

    @IBOutlet weak var viewMainCoupon: UIView!
    @IBOutlet weak var viewCoupon: UIView!
    @IBOutlet weak var lblCouponCode: UILabel!
    @IBOutlet weak var btnApplyCoupon: UIButton!
    @IBOutlet weak var lblCouponDetail: UILabel!
    @IBOutlet weak var lblCouponExpiryDate: UILabel!
    
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var proceedToPayBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!

    var isFromSubscriptionPage = false
    
    let availablePaymentTypes = ["Paypal", "Stripe"]
    var selectedPaymentType: Int = 0
    var inputPickerView = UIPickerView()
    var inputUIView = UIView()
    var currencyPaymentTypes: [PTProAPI.GetCurrenciesListQuery.Data.GetCurrencies.Result]? = []
    var selectedCurrency = ""
    
    var getpaymentmethodsArray = [PTProAPI.GetPaymentMethodsQuery.Data.GetPaymentMethods.Result]()
    var getpaymentmethodsArrayFilter = [PTProAPI.GetPaymentMethodsQuery.Data.GetPaymentMethods.Result]()
  
    var selectedPlanDetail:PTProAPI.GetPlanDetailsQuery.Data.GetPlanDetails.Result?

    var couponData:PTProAPI.GetcouponcodeQuery.Data.Getcouponcode.Datum?

    @IBOutlet var lblPaymentType: UILabel!
    var braintreeClient: BTAPIClient!
    var lottieWholeView = UIView()
    var lottieView =  LottieAnimationView()
    
    var currencyvalue_from_API_base = ""
    var getbillingArray : PTProAPI.GetBillingCalculationQuery.Data.GetBillingCalculation.Result?
    var viewListingArray : PTProAPI.ViewListingDetailsQuery.Data.ViewListing.Results?
    var reservID = 0
    var isYearlySelected = false
    var currencySymbol = ""
    var isCouponApplied = false
    var subscriptionTotal = 0.0
    var subscriptionDiscount = 0.0
    var subscriptionCouponCode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewMainCoupon.isHidden = true
        self.tableViewHeight.constant = 300
        self.initializeView()
        self.initialSetup()
        self.payoutAPICall()
        self.view.backgroundColor = UIColor(named: "colorController")
        self.bottomView.backgroundColor = UIColor(named: "colorController")
        self.bottomView.bringSubviewToFront(self.proceedToPayBtn)
        
        self.configurePaypalCheckOut()
        self.getCouponCodeAPICall()
        self.btnDeleteCoupon.setTitle("", for: .normal)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.viewSubPlanDetails.dropShadow(color: .lightGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
            self.viewCouponApplied.dropShadow(color: .lightGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
        }
    }
    
    func initializeView(){
        self.viewPlanDetails.isHidden = isFromSubscriptionPage ? false : true
        if let planDetails = selectedPlanDetail{
            if let curSymbol = Utility.shared.getSymbol(forCurrencyCode: selectedPlanDetail?.currency ?? "") {
                currencySymbol = curSymbol
            }else if(Utility.shared.getPreferredCurrency() != nil &&  Utility.shared.getPreferredCurrency() != "")
            {
                currencySymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!) ?? ""
            }
            
            self.lblPlanTypeAndPrice.text = "\(planDetails.title ?? "") \(currencySymbol)\((isYearlySelected ? planDetails.yearly : planDetails.monthly) ?? 0)/\(isYearlySelected ? "yearly" : "monthly")"
            self.lblOne.text = planDetails.one
            self.lblTwo.text = planDetails.two
            self.lblThree.text = planDetails.three
            self.lblFour.text = planDetails.four
            self.lblFive.text = planDetails.five
            self.lblSix.text = planDetails.six
            subscriptionTotal = Double((isYearlySelected ? planDetails.yearly : planDetails.monthly) ?? 0)
        }
    }
    
    func getCouponUseAPICall()
    {
        self.lottieAnimation()

        var listId:Int = 0
        if isFromSubscriptionPage, let plan = selectedPlanDetail,let planId = plan.id{
            listId = planId
        }else{
            listId = viewListingArray?.__data._data["id"] as? Int ?? 0
        }
        
        let getcouponuseQuery = PTProAPI.GetcouponuseQuery(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""), couponCode: .some(self.couponData?.couponCode ?? ""), listId: .some(listId))
        
        Network.shared.apollo_headerClient.fetch(query: getcouponuseQuery) { response in
            self.lottieView.isHidden = true
            self.lottieWholeView.isHidden = true
            switch response {
            case .success(let result):
                if let status = result.data?.getcouponuse?.status ,status == 200 {
                    DispatchQueue.main.async {
                        self.isCouponApplied = true
                        self.viewMainCoupon.isHidden = false
                        self.viewCoupon.isHidden = true
                        self.viewCouponApplied.isHidden = false
                        self.updateCouponData()
                    }
                }else{
                    self.view.makeToast(result.data?.getcouponuse?.errorMessage)
                }
                break
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }

    func payoutAPICall()
    {
        self.lottieAnimation()
        let getpayoutquery = PTProAPI.GetPaymentMethodsQuery()
        Network.shared.apollo_headerClient.fetch(query: getpayoutquery,cachePolicy:.fetchIgnoringCacheData){ [self] response in
            self.lottieView.isHidden = true
            self.lottieWholeView.isHidden = true
            switch response {
            case .success(let result):
                guard (result.data?.getPaymentMethods?.results) != nil else{
                    print("Missing Data")
                    self.lottieView.isHidden = true
                    self.lottieWholeView.isHidden = true
                    self.view.makeToast(result.data?.getPaymentMethods?.errorMessage)
                    return
                }
                
                self.lottieView.isHidden = true
                self.lottieWholeView.isHidden = true
                self.getpaymentmethodsArray = ((result.data?.getPaymentMethods?.results)!) as! [PTProAPI.GetPaymentMethodsQuery.Data.GetPaymentMethods.Result]
                getpaymentmethodsArrayFilter  =  getpaymentmethodsArray.filter { result in
                    result.isEnable == true
                }
                
                self.tableView.reloadData()
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }
    
    func getCouponCodeAPICall()
    {
        self.lottieAnimation()
        
        var listId:Int = 0
        var subscriptionType = ""
        let couponType = isFromSubscriptionPage ? "booking" : "subscription"
        if isFromSubscriptionPage, let plan = selectedPlanDetail,let planId = plan.id{
            listId = planId
        }else{
            listId = viewListingArray?.__data._data["id"] as? Int ?? 0
        }
        
        if isFromSubscriptionPage, let plan = selectedPlanDetail,let type = plan.title{
            subscriptionType = type
        }else{
            subscriptionType = ""
        }
        
        let getCouponcodeQuery = PTProAPI.GetcouponcodeQuery(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""), couponType: .some( couponType), listId: .some(listId), subscriptionType: .some(subscriptionType))
        
            Network.shared.apollo_headerClient.fetch(query: getCouponcodeQuery) { response in
                self.lottieView.isHidden = true
                self.lottieWholeView.isHidden = true
            switch response {
            case .success(let result):
                if let status = result.data?.getcouponcode?.status ,status == 200 {
                    if let data = result.data?.getcouponcode?.data,data.count != 0{
                        DispatchQueue.main.async {
                            self.viewMainCoupon.isHidden = false
                            self.viewCoupon.isHidden = false
                            self.viewCouponApplied.isHidden = true
                            self.couponData = data[0]!
                            self.updateCouponData()
                        }
                    }else{
                        self.viewMainCoupon.isHidden = true
                    }
                }else{
                    self.view.makeToast(result.data?.getcouponcode?.errorMessage)
                }
                break
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }
    
    func updateCouponData(){
        if let data = couponData{
            self.lblCouponCode.text = data.couponCode
            self.lblCouponDetail.text = "Flat \(data.discount ?? 0.0)% OFF"
            self.lblCouponPlanNameApplied.text = "Coupon Applied: \(couponData?.couponCode ?? "")"
            self.lblCouponExpiryDate.text = "Valid till \(data.endDate ?? "")"
            
            self.subscriptionCouponCode = data.couponCode ?? ""
            self.subscriptionDiscount = data.discount ?? 0.0
            self.updateDiscount()
        }
    }
    
    func updateDiscount(){
        if let curSymbol = Utility.shared.getSymbol(forCurrencyCode: selectedPlanDetail?.currency ?? "") {
            currencySymbol = curSymbol
        }else if(Utility.shared.getPreferredCurrency() != nil &&  Utility.shared.getPreferredCurrency() != "")
        {
            currencySymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!) ?? ""
        }
        
        if let planDetails = selectedPlanDetail{
            let planPrice = Double(((isYearlySelected ? planDetails.yearly : planDetails.monthly) ?? 0))
            let strPlanDuration = isYearlySelected ? "yearly" : "monthly"

            if isCouponApplied{
                let selectedPlan = String(format: "%@%.2f%@", currencySymbol,planPrice,strPlanDuration)
                let discount = ((planPrice * (couponData?.discount ?? 0.0)) / 100)
                let discountAmount = planPrice - discount
                let discountLabel = String(format: "%@%.2f%@", currencySymbol,discountAmount,strPlanDuration)
                let strPlan = "\(planDetails.title ?? "")\(selectedPlan)\n\(discountLabel)"
                
                let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: strPlan)
                let somePartStringRange = (strPlan as NSString).range(of: selectedPlan)
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: somePartStringRange)
                self.lblPlanTypeAndPrice.attributedText = attributeString
            }else{
                viewCouponApplied.isHidden = true
                let selectedPlan = String(format: "%@%.2f%@", currencySymbol,planPrice,strPlanDuration)
                self.lblPlanTypeAndPrice.text = "\(planDetails.title ?? "") \(selectedPlan)"
                subscriptionTotal = planPrice
            }
        }
    }
    
    func lottieAnimation()
    {
        self.lottieView.isHidden = false
        self.lottieWholeView.isHidden = false
        self.lottieWholeView.frame = CGRect(x: 0, y: 0, width: FULLWIDTH, height: FULLHEIGHT)
        self.lottieWholeView.backgroundColor =  UIColor.black.withAlphaComponent(0.5)
        self.view.addSubview(lottieWholeView)
        self.lottieView.frame = CGRect(x:FULLWIDTH/2-50, y: FULLHEIGHT/2-50, width: 100, height: 100)
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
    
    func initialSetup() {
        lottieView = LottieAnimationView.init(name: "loading_qwe")
        updateCurrencyTypes()
        tableView.register(UINib(nibName: "EditAboutCell", bundle: nil), forCellReuseIdentifier: "EditAboutCell")
        tableView.register(UINib(nibName: "TextFieldCell", bundle: nil), forCellReuseIdentifier: "textfieldcell")
        tableView.register(UINib(nibName: "PaymentCell", bundle: nil), forCellReuseIdentifier: "PaymentCell")
        tableView.register(UINib(nibName: "PaymentFooterCell", bundle: nil), forCellReuseIdentifier: "PaymentFooterCell")
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        
        lblPaymentType.font = UIFont(name: APP_FONT_SEMIBOLD, size: 18)
        lblPaymentType.text = "\(Utility.shared.getLanguage()?.value(forKey: "paymenttype") ?? "Payment Type")"
        
        proceedToPayBtn.setTitle("\(Utility.shared.getLanguage()?.value(forKey: "Proceed_Pay") ?? "Proceed to pay")", for: .normal)
        proceedToPayBtn.layer.cornerRadius = proceedToPayBtn.frame.size.height / 2
        proceedToPayBtn.layer.masksToBounds = true
        if Utility.shared.isRTLLanguage(){
            backBtn.rotateImageViewofBtn()
        }
        setdropdown()
        self.braintreeClient = BTAPIClient(authorization: "sandbox_9qm88ts8_znhjthkx85kvbd4q")
    }
    
    
    func updateCurrencyTypes(){
        currencyPaymentTypes?.removeAll()
        for currency in Utility.shared.currencyDataArray {
            if currency.isPayment ?? false{
                currencyPaymentTypes?.append(currency)
            }
        }
    }
    
    
    func setdropdown()
    {
        inputUIView.frame = CGRect(x: 0, y: FULLHEIGHT-200, width: FULLWIDTH, height: 200)
        inputPickerView.frame = CGRect(x: 0, y: 0, width: FULLWIDTH, height: 200)
        inputUIView.addSubview(inputPickerView)
        inputPickerView.delegate = self
        inputPickerView.dataSource = self
        inputPickerView.tintColor = Theme.PRIMARY_COLOR
        inputPickerView.backgroundColor = UIColor(named: "colorController")
        inputPickerView.reloadAllComponents()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let shadowSize : CGFloat = 3.0
      
        
        let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
                                                   y: -shadowSize / 2,
                                                   width: self.bottomView.frame.size.width+40 + shadowSize,
                                                   height: self.bottomView.frame.size.height + shadowSize))
        
//        self.bottomView.layer.masksToBounds = false
//        self.bottomView.layer.shadowColor = Theme.TextLightColor.cgColor
//        self.bottomView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//        self.bottomView.layer.shadowOpacity = 0.3
//        self.bottomView.layer.shadowPath = shadowPath.cgPath
        
    }
    @IBAction func backBtnActionTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func configurePaypalCheckOut(){}
//        Checkout.setCreateOrderCallback { (createOrderAction) in
//            let amount = PurchaseUnit.Amount(currencyCode: .usd, value: "10.00")
//            let purchaseUnit = PurchaseUnit(amount: amount)
//            let order = OrderRequest(intent: .capture, purchaseUnits: [purchaseUnit])
//            
//            createOrderAction.create(order: order)
//        }
//        
//        Checkout.setOnApproveCallback { (approve) in
//            approve.actions.capture { (response, error) in
//                print("Approve Response",response,"----",error)
//            }
//        }
//        
//        Checkout.setOnCancelCallback {
//            print("Cancelled")
//        }
//        
//        Checkout.setOnErrorCallback { (error) in
//            print("Error", error)
//        }
//        
//    }
    
    @IBAction func proceedToPayTapped(_ sender: UIButton) {
        
        if self.selectedPaymentType == nil{
            self.view.makeToast("\(Utility.shared.getLanguage()?.value(forKey: "Select_Payment_Type") ?? "Please select Payment type")")
        }else if self.selectedPaymentType == 0 && self.selectedCurrency == ""{
            self.view.makeToast("\(Utility.shared.getLanguage()?.value(forKey: "Select_Currency_Error") ?? "Please select currency")")
        }else{
            if self.selectedPaymentType == 1{
                self.stripePayments()
            }else{
                self.lottieAnimation()
                if self.isFromSubscriptionPage{
                    self.subscriptionPaymentAPICall(cardtoken: "")
                }else{
                    self.PaymentAPICall(cardtoken: "")
                }
            }
        }
        
    }
    
    func stripePayments(){
        let addCardViewController = STPAddCardViewController()

         addCardViewController.delegate = self

         // Present add card view controller
         let navigationController = UINavigationController(rootViewController: addCardViewController)

         navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true)
    }
    
func confirmPaymentCall(reservationId:Int,paymentIntentId:String){
    let confirmpaymentmutation = PTProAPI.ConfirmReservationMutation(reservationId: reservationId, paymentIntentId: paymentIntentId)
    Network.shared.apollo_headerClient.perform(mutation: confirmpaymentmutation){ response in
        switch response {
        case .success(let result):
            if let data = result.data?.confirmReservation?.status,data == 200 {
                self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"paymentsuccess"))!)")
                if #available(iOS 11.0, *) {
                    Utility.shared.PreApprovedID = false
                    let itenaryPageObj = BookingItenaryVC()
                    Utility.shared.isfromTripsPage = false
                    itenaryPageObj.getbillingArray = self.getbillingArray
                    itenaryPageObj.currencyvalue_from_API_base = self.currencyvalue_from_API_base
                    itenaryPageObj.createReservationAPICall(reservationid:reservationId)
                    self.lottieWholeView.isHidden = true
                    self.lottieView.isHidden = true
                    Utility.shared.guestc = ""
                    itenaryPageObj.isFromReviewPage = false
                    itenaryPageObj.modalPresentationStyle = .fullScreen
                    self.present(itenaryPageObj, animated: true, completion: nil)
                } else {
                    // Fallback on earlier versions
                }
            } else if(result.data?.confirmReservation?.status == 400)
            {
                self.handlePayment(reservationId:reservationId, paymentIntentId: paymentIntentId)
            }else if result.data?.confirmReservation?.status == 500{
                self.lottieWholeView.isHidden = true
                self.lottieView.isHidden = true
                let alert = UIAlertController(title: "\(Utility.shared.getLanguage()?.value(forKey: "oops") ?? "oops" )", message: result.data?.confirmReservation?.errorMessage, preferredStyle: .alert)
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
            }
        case .failure(let error):
            self.view.makeToast(error.localizedDescription)
        }
    }
}
    
    func PaymentAPICall(cardtoken:String)
    {
        var currency_con = String()
        if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
        {
            currency_con = Utility.shared.getPreferredCurrency()!
        }
        else
        {
            currency_con = self.currencyvalue_from_API_base
        }
        var discountLabel = String()
        if(getbillingArray?.discountLabel == nil)
        {
            discountLabel = ""
        }
        else
        {
            discountLabel = getbillingArray?.discountLabel! ?? ""
        }
        
        
        var bookedArrayType = String()
        if Utility.shared.PreApprovedID{
            
            bookedArrayType = "instant"
            
        }else{
            
            bookedArrayType = viewListingArray?.bookingType! ?? ""
            
        }
        
        let paymentMutation = PTProAPI.CreateReservationMutation(listId: viewListingArray?.__data._data["id"] as? Int ?? 0, checkIn: getbillingArray?.checkIn! ?? "", checkOut: getbillingArray?.checkOut! ?? "", guests: Utility.shared.guestCountToBeSend, message: Utility.shared.booking_message, basePrice: getbillingArray?.averagePrice! ?? 0.0, cleaningPrice: getbillingArray?.cleaningPrice! ?? 0.0, currency: getbillingArray?.currency! ?? "", discount: .some(getbillingArray?.discount! ?? 0.0), discountType: .some(getbillingArray?.discountLabel ?? ""), guestServiceFee: .some(getbillingArray?.guestServiceFee! ?? 0.0), hostServiceFee: .some( getbillingArray?.hostServiceFee! ?? 0.0), total: getbillingArray?.total! ?? 0.0, bookingType: .some(bookedArrayType), cardToken: cardtoken, paymentType: .some(self.selectedPaymentType == 1 ? 2 : self.selectedPaymentType), convCurrency: currency_con, averagePrice: .some(getbillingArray?.averagePrice! ?? 0.0), nights: .some(getbillingArray?.nights! ?? 0), paymentCurrency: .some(self.selectedCurrency))
                
        Network.shared.apollo_headerClient.perform(mutation: paymentMutation){  response in
            switch response {
            case .success(let result):
                if let data = result.data?.createReservation?.status,data == 400 {
                    self.lottieWholeView.isHidden = true
                    self.lottieView.isHidden = true
                    if(result.data?.createReservation?.reservationId != nil && result.data?.createReservation?.paymentIntentSecret != nil)
                    {
                        self.handlePayment(reservationId: (result.data?.createReservation?.reservationId!)!, paymentIntentId: (result.data?.createReservation?.paymentIntentSecret!)!)
                    }
                    else{
                        print("Response : \(String(describing: result.data?.createReservation))")
                        
                        
                        self.view.makeToast(result.data?.createReservation?.errorMessage!)
                    }
                    print("Missing Data")
                    
                    return
                }else if result.data?.createReservation?.status == 500{
                    self.lottieWholeView.isHidden = true
                    self.lottieView.isHidden = true
                    let alert = UIAlertController(title: "\(Utility.shared.getLanguage()?.value(forKey: "oops") ?? "oops" )", message: result.data?.createReservation?.errorMessage, preferredStyle: .alert)
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
                    Utility.shared.guestCountToBeSend = 1
                    if self.selectedPaymentType == 0 { //For PayPal
                        if result.data?.createReservation?.results?.paymentState == "pending"{
                            let webviewObj = WebviewVC()
                            
                            self.reservID = result.data?.createReservation?.results?.id ?? 0
                            webviewObj.isForPayPal = true
                            webviewObj.delegate = self
                            webviewObj.webstring = result.data?.createReservation?.redirectUrl ?? ""
                            webviewObj.pageTitle = ""
                            webviewObj.modalPresentationStyle = .fullScreen
                            webviewObj.webviewRedirection(webviewString:result.data?.createReservation?.redirectUrl ?? "")
                            self.present(webviewObj, animated: true, completion: nil)
                        }else{
                            
                        }
                    }else{
                        self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"paymentsuccess"))!)")
                        if #available(iOS 11.0, *) {
                            Utility.shared.PreApprovedID = false
                            let itenaryPageObj = BookingItenaryVC()
                            Utility.shared.isfromTripsPage = false
                            itenaryPageObj.getbillingArray = self.getbillingArray
                            itenaryPageObj.currencyvalue_from_API_base = self.currencyvalue_from_API_base
                            itenaryPageObj.isFromReviewPage = false
                            itenaryPageObj.createReservationAPICall(reservationid: (result.data?.createReservation?.results?.id!)!)
                            self.lottieWholeView.isHidden = true
                            self.lottieView.isHidden = true
                            itenaryPageObj.modalPresentationStyle = .fullScreen
                            Utility.shared.guestc = ""
                            self.present(itenaryPageObj, animated: true, completion: nil)
                        } else {
                            // Fallback on earlier versions
                        }
                    }
                }
            case .failure(_): break
            }
        }
    }
    
    func subscriptionPaymentAPICall(cardtoken:String)
    {
        var currency_con = String()
        if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
        {
            currency_con = Utility.shared.getPreferredCurrency()!
        }
        else
        {
            currency_con = selectedPlanDetail?.currency ?? ""
        }
        
        
        var planID = 0
        if let plan = selectedPlanDetail, let planId = plan.id{
            planID = planId
        }
        
        let createSubscriptionPaymentMutation = PTProAPI.CreateSubscriptionPaymentMutation(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""), planId: .some(planID), total: Double(subscriptionTotal), paymentType: .some(self.selectedPaymentType == 1 ? 2 : 1), paymentCurrency: .some(self.selectedCurrency), cardToken: .some(cardtoken), currency: currency_con, planType: (isYearlySelected ? "year" : "month"), totaldiscount: .some(Double(isCouponApplied ? subscriptionDiscount : 0.0)), couponCode: .some(isCouponApplied ? subscriptionCouponCode : ""))
                  
        print("{\"userId\":\"\(Utility.shared.ProfileAPIArray?.userId ?? "")","planId\":\(planID),\"total\":\(subscriptionTotal),\"paymentType\":\(self.selectedPaymentType),\"paymentCurrency\":\"\(self.selectedCurrency)\",\"cardToken\":\"\",\"currency\":\"\(currency_con)","planType\":\"month","couponCode\":\"\(subscriptionCouponCode)\"}")

        print(createSubscriptionPaymentMutation.__variables as Any)
        Network.shared.apollo_headerClient.perform(mutation: createSubscriptionPaymentMutation){  response in
            switch response {
            case .success(let result):
                if let data = result.data?.createSubscriptionPayment?.status,data == 400 {
                    self.lottieWholeView.isHidden = true
                    self.lottieView.isHidden = true
                    print("esult.data?.createSubscriptionPayment?.results?.id  \(result.data?.createSubscriptionPayment?.results?.id ?? 0)")
                    
                    print("esult.data?.createSubscriptionPayment?.paymentIntentSecret  \(result.data?.createSubscriptionPayment?.paymentIntentSecret ?? "")")

                    if(result.data?.createSubscriptionPayment?.results?.id != nil && result.data?.createSubscriptionPayment?.paymentIntentSecret != nil)
                    {
                        self.handlePayment(reservationId: (result.data?.createSubscriptionPayment?.reservationId!)!, paymentIntentId: (result.data?.createSubscriptionPayment?.paymentIntentSecret!)!)
                    }
                    else{
                        print("Response : \(String(describing: result.data?.createSubscriptionPayment))")
                        self.view.makeToast(result.data?.createSubscriptionPayment?.errorMessage!)
                    }
                    print("Missing Data")
                    
                    return
                }else if result.data?.createSubscriptionPayment?.status == 500{
                    self.lottieWholeView.isHidden = true
                    self.lottieView.isHidden = true
                    let alert = UIAlertController(title: "\(Utility.shared.getLanguage()?.value(forKey: "oops") ?? "oops" )", message: result.data?.createSubscriptionPayment?.errorMessage, preferredStyle: .alert)
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
                    Utility.shared.guestCountToBeSend = 1
                    if self.selectedPaymentType == 0 { //For PayPal
                        if result.data?.createSubscriptionPayment?.redirectUrl != ""{
                            let webviewObj = WebviewVC()
                            self.reservID = result.data?.createSubscriptionPayment?.reservationId ?? 0
                            webviewObj.isForPayPal = true
                            webviewObj.delegate = self
                            webviewObj.webstring = result.data?.createSubscriptionPayment?.redirectUrl ?? ""
                            webviewObj.pageTitle = ""
                            webviewObj.modalPresentationStyle = .fullScreen
                            webviewObj.webviewRedirection(webviewString:result.data?.createSubscriptionPayment?.redirectUrl ?? "")
                            self.present(webviewObj, animated: true, completion: nil)
                        }else{
                            
                        }
                    }else{
                        self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"paymentsuccess"))!)")
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let orderSummaryVC = storyboard.instantiateViewController(withIdentifier: "OrderSummaryVC") as! OrderSummaryVC
                        orderSummaryVC.selectedPlan = self.selectedPlanDetail?.title ?? ""
                        orderSummaryVC.selectedPaymentType = self.selectedPaymentType
                        orderSummaryVC.modalPresentationStyle = .fullScreen
                        self.present(orderSummaryVC, animated: true, completion: nil)
                    }
                }
            case .failure(_): break
            }
        }
    }
    
    
    @objc func dismissgenderPicker(text:Int) {
        view.endEditing(true)
    }
    
    @objc func countryBtnTapped(_ sender: UIButton){
        let cell = view.viewWithTag(sender.tag + 8000) as! PaymentFooterCell
        cell.txtFiled.becomeFirstResponder()
   }
    
    // MARK: - Action
    @IBAction func onClickDeleteCouponCode(_ sender: Any) {
        viewCouponApplied.isHidden = true
        self.viewCoupon.isHidden = false
        self.isCouponApplied = false
        self.updateCouponData()
    }
    
    @IBAction func onClickApplyCouponCode(_ sender: Any) {
        self.getCouponUseAPICall()
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

// MARK: TableView Delegate & DataSource
extension PaymentSelectionPage: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return getpaymentmethodsArrayFilter.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : PaymentCell = tableView.dequeueReusableCell(withIdentifier: "PaymentCell", for: indexPath) as! PaymentCell
        cell.selectionStyle = .none
       
        if(indexPath.section == 0) {
            if("\((getpaymentmethodsArrayFilter[indexPath.section].name!))" == "Paypal")
            {
            cell.typeImg.image = #imageLiteral(resourceName: "paypal")
            cell.lineLbl.isHidden = self.selectedPaymentType == 0
            }
            else {
                cell.typeImg.image = #imageLiteral(resourceName: "stripe")
                cell.lineLbl.isHidden = true
                self.selectedPaymentType = 1
            }
        }
        else {
            cell.typeImg.image = #imageLiteral(resourceName: "stripe")
            cell.lineLbl.isHidden = true
        }
        cell.lineLbl.backgroundColor = UIColor(named: "Review_Page_Line_Color")
        if("\((getpaymentmethodsArrayFilter[indexPath.section].name!))" == "Paypal")
        {
        cell.aboutLabel.text = availablePaymentTypes[0]
        }
        else {
            cell.aboutLabel.text = availablePaymentTypes[1]
        }
        cell.aboutLabel.textColor = UIColor(named: "Title_Header")
        cell.tag = indexPath.section + 6000
        if("\((getpaymentmethodsArrayFilter[indexPath.section].name!))" == "Paypal")
        {
        if self.selectedPaymentType == indexPath.section{
            cell.rightArrowimg.image = #imageLiteral(resourceName: "verify-round")
        }else{
            
            
            cell.rightArrowimg.image = #imageLiteral(resourceName: "price_unclick")
        }
        }
        else {
            if getpaymentmethodsArrayFilter.count == 1 {
            if self.selectedPaymentType == 1 {
                cell.rightArrowimg.image = #imageLiteral(resourceName: "verify-round")
        }
            }
            else {
                if self.selectedPaymentType == indexPath.section{
                    cell.rightArrowimg.image = #imageLiteral(resourceName: "verify-round")
                }else{
                    cell.rightArrowimg.image = #imageLiteral(resourceName: "price_unclick")
                }
            }
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.selectedPaymentType != indexPath.section{
            self.selectedPaymentType = indexPath.section
            
            if self.selectedPaymentType == 0{
                self.tableViewHeight.constant = 300
            }else{
                self.tableViewHeight.constant = 250
            }
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 0 && self.selectedPaymentType == 0 &&  ("\((getpaymentmethodsArrayFilter[section].name!))" == "Paypal") ? 80 : 0
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView : PaymentFooterCell = tableView.dequeueReusableCell(withIdentifier: "PaymentFooterCell") as! PaymentFooterCell
//        footerView.stepnumberLbl.text = ""
//        footerView.stepnumberLbl.isHidden = true
//        footerView.queryTitleLbl.text = "\(Utility.shared.getLanguage()?.value(forKey: "currency") ?? "Currency")"
        footerView.txtFiled.placeholder = "\(Utility.shared.getLanguage()?.value(forKey: "currency") ?? "Currency")"
        if(section == 0 && self.selectedPaymentType == 0) {
        let cell = view.viewWithTag(section + 6000) as! PaymentCell
        cell.lineLbl.isHidden = true
        }
        footerView.lineview.backgroundColor = UIColor(named: "Review_Page_Line_Color")
        footerView.tag = section + 8000
        footerView.countryBtn.addTarget(self, action: #selector(countryBtnTapped), for: .touchUpInside)
        footerView.txtFiled.tag = section
        footerView.countryBtn.tag = section
        footerView.txtFiled.font = UIFont(name: APP_FONT, size:14)
        let toolBar = UIToolbar().ToolbarPikerSelect(mySelect: #selector(dismissgenderPicker))
        toolBar.barTintColor = UIColor(named: "Button_Grey_Color")
        footerView.txtFiled.inputAccessoryView = toolBar
        footerView.txtFiled.inputView = inputPickerView
        footerView.txtFiled.tintColor = UIColor.clear
        footerView.txtFiled.delegate = self
        footerView.txtFiled.text = selectedCurrency
        footerView.txtFiled.textColor = Theme.PRIMARY_COLOR
        
        return footerView
    }
}

// MARK: PickerView Delegate & DataSource
extension PaymentSelectionPage: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyPaymentTypes?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        var titleData = ""
        
        titleData =  currencyPaymentTypes?[row].symbol ?? "USD"
        
        let myTitle = NSAttributedString(string: titleData , attributes: [NSAttributedString.Key.font:UIFont(name: APP_FONT, size: 15.0)!,NSAttributedString.Key.foregroundColor:Theme.PRIMARY_COLOR])
        
        return myTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCurrency = currencyPaymentTypes?[row].symbol ?? ""
    }
    
}

extension PaymentSelectionPage: UITextFieldDelegate , WebviewVCDelegate{
    
    
    func setPayoutCall(accountid: String) {
        
    }
    
    func onSuccessPayPalPayment(isSuccess: Bool, toastermsg: String,successURL: URL?) {
        if isSuccess{
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"paymentsuccess"))!)")
            
            let urlQuery = successURL?.query
            let arrayOfQuery = urlQuery?.split(separator: "&")
            let paymentID = arrayOfQuery?.first?.split(separator: "=")
            let payerID = arrayOfQuery?.last?.split(separator: "=")
            
            if isFromSubscriptionPage{
                self.confirmSubscriptionPayPalExecute(paymentID: "\(paymentID?.last ?? "")", PayerID: "\(payerID?.last ?? "")")
            }else{
                self.ConfirmPayPal(paymentID: "\(paymentID?.last ?? "")", PayerID: "\(payerID?.last ?? "")")
            }

        }else{
            self.lottieView.isHidden = true
            self.lottieWholeView.isHidden = true
        }
        }
    
    

    func confirmSubscriptionPayPalExecute(paymentID: String, PayerID: String){
        let confirmPayPal = PTProAPI.ConfirmSubscriptionPayPalExecuteMutation(paymentId: paymentID, payerId: PayerID, userId: Utility.shared.ProfileAPIArray?.userId ?? "")
        
        Network.shared.apollo_headerClient.perform(mutation: confirmPayPal){ response in
            switch response {
            case .success(let result):
                if result.data?.confirmSubscriptionPayPalExecute?.status == 200 {
                    if #available(iOS 11.0, *) {
                        Utility.shared.PreApprovedID = false
                        self.lottieView.isHidden = true
                        self.lottieWholeView.isHidden = true
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let orderSummaryVC = storyboard.instantiateViewController(withIdentifier: "OrderSummaryVC") as! OrderSummaryVC
                        orderSummaryVC.selectedPlan = self.selectedPlanDetail?.title ?? ""
                        orderSummaryVC.selectedPaymentType = self.selectedPaymentType
                        orderSummaryVC.modalPresentationStyle = .fullScreen
                        self.present(orderSummaryVC, animated: true, completion: nil)
                    } else {
                        // Fallback on earlier versions
                    }
                }else if result.data?.confirmSubscriptionPayPalExecute?.status == 500{
                    self.lottieWholeView.isHidden = true
                    self.lottieView.isHidden = true
                    let alert = UIAlertController(title: "\(Utility.shared.getLanguage()?.value(forKey: "oops") ?? "oops" )", message: result.data?.confirmSubscriptionPayPalExecute?.errorMessage, preferredStyle: .alert)
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
                    self.view.makeToast(result.data?.confirmSubscriptionPayPalExecute?.errorMessage ?? "")
                }
            case .failure(let error):
                self.lottieView.isHidden = true
                self.lottieWholeView.isHidden = true
                self.view.makeToast(error.localizedDescription)
            }
        }
    }
    
    func ConfirmPayPal(paymentID: String, PayerID: String){
        let confirmPayPal = PTProAPI.ConfirmPayPalExecuteMutation(paymentId: paymentID, payerId: PayerID)
        
        Network.shared.apollo_headerClient.perform(mutation: confirmPayPal){ response in
            switch response {
            case .success(let result):
                if result.data?.confirmPayPalExecute?.status == 200 {
                    if #available(iOS 11.0, *) {
                        Utility.shared.PreApprovedID = false
                        self.lottieView.isHidden = true
                        self.lottieWholeView.isHidden = true
                        let itenaryPageObj = BookingItenaryVC()
                        Utility.shared.isfromTripsPage = false
                        itenaryPageObj.getbillingArray = self.getbillingArray
                        itenaryPageObj.currencyvalue_from_API_base = self.currencyvalue_from_API_base
                        itenaryPageObj.isFromReviewPage = false
                        itenaryPageObj.createReservationAPICall(reservationid: self.reservID)
                        self.lottieWholeView.isHidden = true
                        self.lottieView.isHidden = true
                        Utility.shared.guestc = ""
                        itenaryPageObj.modalPresentationStyle = .fullScreen
                        self.present(itenaryPageObj, animated: true, completion: nil)
                    } else {
                        // Fallback on earlier versions
                    }
                }else if result.data?.confirmPayPalExecute?.status == 500{
                    self.lottieWholeView.isHidden = true
                    self.lottieView.isHidden = true
                    let alert = UIAlertController(title: "\(Utility.shared.getLanguage()?.value(forKey: "oops") ?? "oops" )", message: result.data?.confirmPayPalExecute?.errorMessage, preferredStyle: .alert)
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
                    self.view.makeToast(result.data?.confirmPayPalExecute?.errorMessage ?? "")
                }
            case .failure(let error):
                self.lottieView.isHidden = true
                self.lottieWholeView.isHidden = true
                self.view.makeToast(error.localizedDescription)
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.inputPickerView.reloadAllComponents()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if currencyPaymentTypes?.count != 0{
        selectedCurrency = (selectedCurrency != "" ? selectedCurrency : currencyPaymentTypes?[0].symbol) ?? ""
        }
        tableView.reloadData()
    }
}

// MARK: STPAddCardViewControllerDelegate

extension PaymentSelectionPage: STPAddCardViewControllerDelegate,STPPaymentCardTextFieldDelegate{
    func addCardViewControllerDidCancel(_ addCardViewController: STPAddCardViewController) {
            dismiss(animated: true, completion: nil)
        }

        func addCardViewController(_ addCardViewController: STPAddCardViewController, didCreatePaymentMethod paymentMethod: STPPaymentMethod, completion: @escaping STPErrorBlock) {
            self.lottieAnimation()
            print("paymentmethodid:\(paymentMethod.stripeId)")
            if isFromSubscriptionPage{
                self.subscriptionPaymentAPICall(cardtoken: "\(paymentMethod.stripeId)")
            }else{
                self.PaymentAPICall(cardtoken: "\(paymentMethod.stripeId)")
            }
            dismiss(animated: true, completion: nil)
        }
        
    func handlePayment(reservationId:Int,paymentIntentId:String)
    {
        STPPaymentHandler.shared().handleNextAction(
            forPayment: paymentIntentId,
            with:self,
            returnURL: nil,
            completion: { status, paymentIntent, error in
                if case .succeeded = status, let paymentIntent = paymentIntent {
                    //completion(.success(paymentIntent))
                    self.lottieAnimation()
                    if self.isFromSubscriptionPage{
                        self.confirmSubscriptionPayPalExecute(paymentID: "\(reservationId)", PayerID: "\(paymentIntent.stripeId)")
                    }else{
                        self.confirmPaymentCall(reservationId: reservationId, paymentIntentId:"\(paymentIntent.stripeId)")
                    }
                } else {
                    //completion(.failure(error ?? AppError.invalid))
                    self.lottieView.isHidden = true
                    self.lottieWholeView.isHidden = true
                }
        })

    }
}


// MARK: Braintree Delegate methods
extension PaymentSelectionPage: STPAuthenticationContext, BTViewControllerPresentingDelegate {
    func appSwitcherWillPerformAppSwitch(_ appSwitcher: Any) {
        
    }
    
    func appSwitcherWillProcessPaymentInfo(_ appSwitcher: Any) {
        
    }
    
    func paymentDriver(_ driver: Any, requestsPresentationOf viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
    
    func paymentDriver(_ driver: Any, requestsDismissalOf viewController: UIViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func authenticationPresentingViewController() -> UIViewController {
        return self
    }
}
