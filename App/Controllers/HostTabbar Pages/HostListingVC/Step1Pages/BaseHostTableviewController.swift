//  BaseHostTableviewController.swift
//  App

//  Created by RadicalStart on 22/07/19.
//  Copyright © 2019 RADICAL START. All rights reserved.


import UIKit
import Apollo
import Lottie
import SwiftMessages
import PTProAPI

class BaseHostTableviewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate,PlaceListingViewControllerDelegate{
    // Function are here
    
    func total_guest_change(guestcount: String) {
        let listSettings = Utility.shared.getListSettingsArray?.roomType?.listSettings
        _ = listSettings?.filter({ (item) -> Bool in
            if (Utility.shared.step1ValuesInfo["roomType"]! as? Int) == item?.id
            {
                placeLabel = (item?.itemName!)!
                return true
            }else{
                return false
            }
        })
        if !placeLabel.isEmpty
        {
            let index = itemNameArray.firstIndex(where: { (item) -> Bool in
                item == placeLabel
            })
            listValuePicker.selectRow(index != nil ? index! : 0, inComponent: 0, animated: true)
        }
        if((Utility.shared.step1ValuesInfo["personCapacity"]!as! Int) <= 1)
        {
        guestLabel = ("\(Utility.shared.getLanguage()?.value(forKey: "Cap_for")as! String) \(Utility.shared.step1ValuesInfo["personCapacity"]!) \(Utility.shared.getLanguage()?.value(forKey: "guest")as! String)")
        }
        else
        {
         guestLabel = ("\(Utility.shared.getLanguage()?.value(forKey: "Cap_for")as! String) \(Utility.shared.step1ValuesInfo["personCapacity"]!) \(Utility.shared.getLanguage()?.value(forKey: "guest")as! String)s")
        }

        hostTable.reloadData()
        
    }
    
    func guestroom_detail(roomdetail: String) {
//      self.setRoomType()
//        hostTable.reloadData()
    }
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var baseTopView: UIView!
    @IBOutlet weak var baseBackBtn: UIButton!
    @IBOutlet weak var baseTitleLabel: UILabel!
    @IBOutlet weak var baseCurvedView: UIView!
    @IBOutlet weak var baseBottomView: UIView!
    @IBOutlet weak var baseProgressBGView: UIView!
    @IBOutlet weak var baseCurvedProgressView: UIView!
    
   
    @IBOutlet var overlayBtn: UIButton!
    @IBOutlet var overlaystep3: UILabel!
    @IBOutlet var overlayUsername: UILabel!
    @IBOutlet var overlayUserImage: UIImageView!
    @IBOutlet var overlayView: UIView!
    @IBOutlet weak var retryButton: UIButton!
     @IBOutlet weak var errorLAbel: UILabel!
    
    @IBOutlet weak var hostTable: UITableView!
    @IBOutlet weak var nextRedirectBtn: UIButton!
    @IBOutlet weak var offlineView: UIView!
    var showOverlay = false
    
    @IBOutlet var handimg: UIImageView!
    
   
    
    //MARK: - This Property
    
    var getListSettingsArray : GetListingSettingQuery.Data.GetListingSettings.Results?
    var ProfileAPIArray : GetProfileQuery.Data.UserAccount.Result?
    var itemNameArray = [String]()
    var guestArrayCount = Int()
    var guestsDropdownArray = [String]()
    var itemNameTouched = false
    var guestLabel = ""
    var placeLabel = ""
    
    let listInputView = UIView()
    let listValuePicker = UIPickerView()
    var tappedIndexPathRow = 0
    var selectedTextfield = Int()
    var lottieView: LottieAnimationView!

    //MARK: - ViewController Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lottieView = LottieAnimationView.init(name:"animation")
        if(showOverlay) {
            var frame =  overlayView.frame
            frame.size.height = UIScreen.main.bounds.size.height
            frame.size.width = UIScreen.main.bounds.size.width
            overlayView.frame = frame
              self.view.addSubview(overlayView)
            
            overlayView.backgroundColor =  UIColor(named: "colorController")
            self.view.backgroundColor = UIColor(named: "colorController")!
            
            
            overlayBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"letsstart"))!)", for: .normal)
            overlayBtn.backgroundColor = Theme.Button_BG
            overlayBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
            overlayBtn.layer.cornerRadius = overlayBtn.frame.size.height/2
            overlayBtn.titleLabel?.textAlignment = .center
            
            overlayBtn.isHidden = true
            handimg.isHidden = true
        
        overlayView.isHidden = false
            
            self.CountryAPICAll()
            
            if(Utility.shared.pickedimageString == "") {
            profileAPICall()
            }
            else {
                self.setUpUI()
            }
        }
        else {

            setUpUI()
        }
       
        setdropdown()
        registerCells()
     //   setUpUI()
        self.setDropdownList()
 
    }

    
    //MARK: - ConfigureItemName for Property Type
    func GetListSettingAPICall()
    {
        let getlistsettingsquery = GetListingSettingQuery()
        Network.shared.apollo_headerClient.fetch(query: getlistsettingsquery,cachePolicy: .fetchIgnoringCacheData){ response in
            switch response {
            case .success(let result):
                guard (result.data?.getListingSettings?.results) != nil else{
                    return
                }
                self.getListSettingsArray = (result.data?.getListingSettings?.results)!
                
                self.lottieView.isHidden = true
                self.lottieView.stop()
            case .failure(let error): break
            }
        }
        
    }
    //MARK: - CALL COUNTRYLIST API
    func CountryAPICAll()
    {
        let getcountrycodeQuery = GetCountrycodeQuery()
        apollo.fetch(query: getcountrycodeQuery,cachePolicy: .fetchIgnoringCacheData){ response in
            switch response {
            case .success(let result):
                guard (result.data?.getCountries?.results) != nil else{
                    //                self.view.makeToast("Missing Data")
                    return
                }
                Utility.shared.countrylist =  ((result.data?.getCountries?.results)!) as! [GetCountrycodeQuery.Data.GetCountries.Result]
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }
    
    func callListingSettingsAPI(oflineView : UIView, nextButton : UIButton)
    {
        nextButton.isHidden = false
            //self.lottieAnimation()
            self.GetListSettingAPICall()
    }
    
    //MARK: - Update Listing Step3
    
    func updateStep3ListingAPICall(completion: (_ success:Bool) -> Void)
    {
        
        let minNight:Int  = (Utility.shared.step3ValuesInfo["minNight"] as? Int) != nil ? (Utility.shared.step3ValuesInfo["minNight"] as? Int)! : 0
        let maxNight:Int = (Utility.shared.step3ValuesInfo["maxNight"] as? Int) != nil ? (Utility.shared.step3ValuesInfo["maxNight"] as? Int)! : 0
        let from:Int = Utility.shared.step3ValuesInfo["checkInStart"] != nil && ((Utility.shared.step3ValuesInfo["checkInStart"]as? String) != "Flexible") ? Int("\(Utility.shared.step3ValuesInfo["checkInStart"]!)")! : 0
        let to:Int = Utility.shared.step3ValuesInfo["checkInEnd"] != nil && ((Utility.shared.step3ValuesInfo["checkInEnd"]as? String) != "Flexible") ? Int("\(Utility.shared.step3ValuesInfo["checkInEnd"]!)")! : 0
        if (maxNight != 0 && minNight > maxNight)
        {
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey: "min_nights_Greaterthan_max"))!)")
            completion(true)
            return
        }
        
        if (Utility.shared.step3ValuesInfo["basePrice"] != nil &&  Utility.shared.step3ValuesInfo["basePrice"] as? String == "." || Utility.shared.host_basePrice < 1)
        {
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey: "invalid_basePrice"))!)")
            completion(true)
            return
        }
        //        if(Utility.shared.host_basePrice == 0) {
        //            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey: "baseprice_require"))!)")
        //                                   completion(true)
        //                                      return
        //        }
        if (Utility.shared.step3ValuesInfo["cleaningPrice"] != nil &&  Utility.shared.step3ValuesInfo["cleaningPrice"] as? String == "0" || Utility.shared.step3ValuesInfo["cleaningPrice"] as? String == ".")
            
        {
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey: "invalid_cleaningPrice"))!)")
            completion(true)
            return
        }
        if(from >= to && from != 0 && to != 0)
        {
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey: "fromtimealert"))!)")
            completion(true)
            return
        }
        
        if let value = Utility.shared.step3ValuesInfo["weeklyDiscount"] {
            let weeklyDiscount = Double("\(value)") ?? 0.0
            
            if (weeklyDiscount >= 100){
                self.view.makeToast( "\((Utility.shared.getLanguage()?.value(forKey:"invaliddiscount"))!)")
                completion(true)
                return
            }
        }
        else {
            if let value = Utility.shared.step3ValuesInfo["monthlyDiscount"] {
                let weeklyDiscount = Double("\(value)") ?? 0.0
                
                if (weeklyDiscount >= 100){
                    self.view.makeToast( "\((Utility.shared.getLanguage()?.value(forKey:"invaliddiscount"))!)")
                    completion(true)
                    return
                }
            }
        }
        
        
        completion(false)
        var weekprice = String()
        var monthprice = String()
        if(Utility.shared.step3ValuesInfo["weeklyDiscount"] != nil)
        {
            weekprice = "\(Utility.shared.step3ValuesInfo["weeklyDiscount"]!)"
        }
        else
        {
            weekprice = "0"
        }
        if(Utility.shared.step3ValuesInfo["monthlyDiscount"] != nil)
        {
            monthprice  = ("\(Utility.shared.step3ValuesInfo["monthlyDiscount"]!)")
        }
        else
        {
            monthprice = "0"
        }
        
        
        let updatelist = UpdateListingStep3Mutation(id: .some(Utility.shared.step3ValuesInfo["id"] as! Int),
                                                    houseRules: .some(Utility.shared.step3ValuesInfo["houseRules"] as! [Int?]), bookingNoticeTime: .some("\(Utility.shared.step3ValuesInfo["bookingNoticeTime"] ?? "")"), checkInStart: .some("\(Utility.shared.step3ValuesInfo["checkInStart"] ?? "")"), checkInEnd: .some("\(Utility.shared.step3ValuesInfo["checkInEnd"] ?? "")"), maxDaysNotice:  .some("\(Utility.shared.step3ValuesInfo["maxDaysNotice"] ?? "")"), minNight: Utility.shared.step3ValuesInfo["minNight"] as! GraphQLNullable<Int>, maxNight: Utility.shared.step3ValuesInfo["maxNight"] as! GraphQLNullable<Int>, basePrice: .some(Utility.shared.host_basePrice), cleaningPrice: .some(Utility.shared.host_cleanPrice), currency: .some("\(Utility.shared.step3ValuesInfo["currency"] ?? "")"), weeklyDiscount: .some(Int(weekprice) ?? 0), monthlyDiscount: .some(Int(monthprice) ?? 0), blockedDates: .some([]), bookingType: Utility.shared.step3ValuesInfo["bookingType"] as! String, cancellationPolicy: .some(Utility.shared.step3ValuesInfo["cancellationPolicy"] as! Int))
        
        Network.shared.apollo_headerClient.perform(mutation: updatelist){  response in
            switch response {
            case .success(let result):
                if let data = result.data?.updateListingStep3?.status,data == 200 {
                    self.lottieView.isHidden = true
                    self.manageListingStepsvalue(listId: "\(Utility.shared.step3ValuesInfo["id"]!)" , currentStep: 3)
                } else {
                    self.view.makeToast(result.data?.updateListingStep3?.errorMessage)
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }
              
    func manageListingStepsvalue(listId:String,currentStep:Int){
        let manageListingStepsMutation = ManageListingStepsMutation(listId:listId, currentStep:currentStep)
        Network.shared.apollo_headerClient.perform(mutation: manageListingStepsMutation){  response in
            switch response {
            case .success(let result):
                if let data = result.data?.manageListingSteps?.status,data == 200 {
                    let becomeHost = BecomeHostVC()
                    becomeHost.listID = "\(Utility.shared.createId)"
                    becomeHost.showListingStepsAPICall(listID:"\(Utility.shared.createId)")
                    //  self.view.window!.layer.add(presentrightAnimation()!, forKey: kCATransition)
                    becomeHost.modalPresentationStyle = .fullScreen
                    self.present(becomeHost, animated:false, completion: nil)
                    
                } else {
                    self.view.makeToast(result.data?.manageListingSteps?.errorMessage)
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }
    
    //MARK: - Update Listing Step 1
   
func updateListingAPICall(completion: (_ success: Bool) -> Void) {
    
    
    var bedsCount = Utility.shared.step1ValuesInfo["beds"] as? Int
    if(bedsCount == nil) {
        bedsCount = 0
    }
    if(Utility.shared.bedcount>bedsCount!)
    {
        
        self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"bed_count_exceed"))!)")
        completion(false)
        return
    }
    if Utility.shared.step1ValuesInfo["country"] == nil || (Utility.shared.step1ValuesInfo["country"] as? String) == ""  {
        // if self.countryValue.isBlank{
        self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey: "enter_country"))!)")
        completion(true)
        return
    }
    if Utility.shared.step1ValuesInfo["street"] == nil || (Utility.shared.step1ValuesInfo["street"] as? String) == ""{
        self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey: "enter_street"))!)")
        completion(true)
        return
    }
    if Utility.shared.step1ValuesInfo["city"] == nil || (Utility.shared.step1ValuesInfo["city"] as? String) == "" {
        self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey: "entercity"))!)")
        completion(true)
        return
    }
    if Utility.shared.step1ValuesInfo["state"] == nil || (Utility.shared.step1ValuesInfo["state"] as? String) == "" {
        self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey: "enterstate"))!)")
        completion(true)
        return
    }
    if Utility.shared.step1ValuesInfo["zipcode"] == nil || (Utility.shared.step1ValuesInfo["zipcode"] as? String) == ""  {
        self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey: "enterzipcode"))!)")
        completion(true)
        return
    }
    else {
        if(Utility.shared.isfromshowmap) {
            completion(true)
            
        }  else {
            completion(false)
        }
        var bedtypeInfoArr = [[String : Any]]()
        if let bedTypeInfo = Utility.shared.step1ValuesInfo["bedTypes"] as? [Any]
        {
            for i in 0..<bedTypeInfo.count
            {
                if let userBedTypes = bedTypeInfo[i] as? GetStep1ListingDetailsQuery.Data.GetListingDetails.Results.UserBedsType
                {
                    
                    var bedTypeInfo = [String : Any]()
                    if userBedTypes.bedType != nil {
                        bedTypeInfo.updateValue((userBedTypes.bedType)!, forKey: "bedType")
                        Utility.shared.step1ValuesInfo.updateValue(userBedTypes.bedType!, forKey: "bedType")
                        bedTypeInfo.updateValue(userBedTypes.bedCount!, forKey: "bedCount")
                        bedtypeInfoArr.append(bedTypeInfo)
                    }
                    
                }
                
            }
            let data = try? JSONSerialization.data(withJSONObject: bedtypeInfoArr, options: .prettyPrinted)
            let bedtypes = String(data: data!, encoding: String.Encoding.utf8)!
            var bedTypeString = ""
            if !bedtypes.isEmpty {
                let bedTypesArr = bedtypes.components(separatedBy: "\n")
                for str in bedTypesArr{
                    bedTypeString = bedTypeString + str
                }
            }
            Utility.shared.step1ValuesInfo.updateValue(bedTypeString.trimmingCharacters(in: .whitespaces), forKey: "bedTypes")
        }
        
        
        
        let createlist = CreateListingMutation(listId: .some(Utility.shared.createId),
                                               roomType: .some("\(Utility.shared.step1ValuesInfo["roomType"] ?? "")"),
                                               houseType: .some("\(Utility.shared.step1ValuesInfo["houseType"] ?? "")"),
                                               residenceType: .some("\(Utility.shared.step1ValuesInfo["residenceType"] ?? "")"),
                                               bedrooms: .some("\(Utility.shared.step1ValuesInfo["bedrooms"] ?? "")") ,
                                               buildingSize: .some("\(Utility.shared.step1ValuesInfo["buildingSize"] ?? "")"),
                                               bedType: .some("\(Utility.shared.step1ValuesInfo["bedType"] ?? "")") ,
                                               beds: Utility.shared.step1ValuesInfo["beds"] as! GraphQLNullable<Int> ,
                                               personCapacity: Utility.shared.step1ValuesInfo["personCapacity"] as! GraphQLNullable<Int> ,
                                               bathrooms: Utility.shared.step1ValuesInfo["bathrooms"] as! GraphQLNullable<Double> ,
                                               bathroomType: .some("\(Utility.shared.step1ValuesInfo["bathroomType"] ?? "")"),
                                               country: .some("\(Utility.shared.step1ValuesInfo["country"] ?? "")"),
                                               street: .some("\(Utility.shared.step1ValuesInfo["street"] ?? "")"),
                                               buildingName: .some("\(Utility.shared.step1ValuesInfo["buildingName"] ?? "")"),
                                               city: .some("\(Utility.shared.step1ValuesInfo["city"] ?? "")"),
                                               state: .some("\(Utility.shared.step1ValuesInfo["state"] ?? "")"),
                                               zipcode: .some("\(Utility.shared.step1ValuesInfo["zipcode"] ?? "")"),
                                               lat: .some(Utility.shared.step1ValuesInfo["lat"] as! Double) ,
                                               lng: .some(Utility.shared.step1ValuesInfo["lng"] as! Double) ,
                                               bedTypes: .some("\(Utility.shared.step1ValuesInfo["bedTypes"] ?? "")") ,
                                               isMapTouched: .some((Utility.shared.step1ValuesInfo["isMapTouched"] != nil)) ,
                                               amenities: .some(Utility.shared.step1ValuesInfo["amenities"] as? [Int?] ?? []),
                                               safetyAmenities: .some(Utility.shared.step1ValuesInfo["safetyAmenities"] as? [Int?] ?? []),
                                               spaces: .some(Utility.shared.step1ValuesInfo["spaces"] as? [Int?] ?? []))
        Network.shared.apollo_headerClient.perform(mutation: createlist){ response in
            switch response {
            case .success(let result):
                if let data = result.data?.createListing?.status,data == 200 {
                    
                    Utility.shared.createId = (result.data?.createListing?.id)!
                    
                    if(Utility.shared.isfromshowmap) {
                        return
                    }  else {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            let becomeHost = BecomeHostVC()
                            becomeHost.listID = "\(Utility.shared.createId)"
                            becomeHost.showListingStepsAPICall(listID:"\(Utility.shared.createId)")
                            becomeHost.modalPresentationStyle = .fullScreen
                            self.present(becomeHost, animated:false, completion: nil)
                        }
                    }
                    
                } else {
                    self.view.makeToast(result.data?.createListing?.errorMessage!)
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }
}
    
    // MARK: - Update listing Step2
    func updatelistingStep2APICall(completion: (_ success:Bool) -> Void)
    {
        let text_Title = "\(Utility.shared.step2ValuesInfo["title"] ?? "")".trimmingCharacters(in:.whitespacesAndNewlines)
        let text_Title1 = "\(Utility.shared.step2ValuesInfo["description"] ?? "")".trimmingCharacters(in:.whitespacesAndNewlines)
        if(text_Title == "")
        {
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"addtitlealert"))!)")
            completion(true)
            return
        }
        if(text_Title1 == "")
        {
            
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"desc_alert"))!)")
            completion(true)
            return
        }
        else {
            completion(false)
            let UpdateListingStep2mutation = UpdateListingStep2Mutation(id:Utility.shared.step2ValuesInfo["id"] != nil ? .some(Utility.shared.step2ValuesInfo["id"] as! Int) : .some(0), description:.some("\(Utility.shared.step2ValuesInfo["description"] ?? "")"), title:.some("\(Utility.shared.step2ValuesInfo["title"] ?? "")"), coverPhoto:Utility.shared.step2ValuesInfo["coverPhoto"] != nil ? .some(Utility.shared.step2ValuesInfo["coverPhoto"] as! Int) : .some(0))
            Network.shared.apollo_headerClient.perform(mutation: UpdateListingStep2mutation){  response in
                switch response {
                case .success(let result):
                    if let data = result.data?.updateListingStep2?.status,data == 200 {
                        
                        let becomeHostObj = BecomeHostVC()
                        becomeHostObj.listID = "\(Utility.shared.step2ValuesInfo["id"] != nil ? Utility.shared.step2ValuesInfo["id"] as! Int : 0)"
                        becomeHostObj.showListingStepsAPICall(listID:"\(Utility.shared.step2ValuesInfo["id"] != nil ? Utility.shared.step2ValuesInfo["id"] as! Int : 0)")
                        // self.view.window!.layer.add(presentrightAnimation()!, forKey: kCATransition)
                        becomeHostObj.modalPresentationStyle = .fullScreen
                        self.present(becomeHostObj, animated:false, completion: nil)
                        
                    } else {
                        self.view.makeToast(result.data?.updateListingStep2?.errorMessage)
                    }
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                }
            }
        }
    }
    
    func profileAPICall() {
        
        if Utility.shared.isConnectedToNetwork() {
            
            if (Utility.shared.getCurrentUserID() != nil){
                
                let profileQuery = GetProfileQuery()
                
                Network.shared.apollo_headerClient.fetch(query: profileQuery, cachePolicy: .fetchIgnoringCacheData){ response in
                    switch response {
                    case .success(let result):
                        
                        guard (result.data?.userAccount?.result) != nil else {
                            
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
                                print("Missing Data")
                                return
                            }
                        }
                        self.ProfileAPIArray = ((result.data?.userAccount?.result)!)
                        
                        Utility.shared.userName  = "\(String(describing: self.ProfileAPIArray?.firstName != nil ? self.ProfileAPIArray?.firstName! : "User"))!"
                        
                        if let profImage = self.ProfileAPIArray?.picture{
                            Utility.shared.pickedimageString = "\(IMAGE_AVATAR_MEDIUM)\(profImage)"
                        }
                        else {
                            Utility.shared.pickedimageString = "avatar"
                        }
                        
                        self.setUpUI()
                        
                        if (result.data?.userAccount?.result?.picture) == nil {
                            Utility.shared.isprofilepictureVerified = true
                            
                        }else{
                            
                            Utility.shared.isprofilepictureVerified = false
                        }
                        
                    case .failure(let error):
                        self.view.makeToast(error.localizedDescription)
                    }
                }
            }
        }else{
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey: "error_field"))!)")
            
        }
    }
    
    func setUpUI()
    {
       
        if(Utility.shared.pickedimageString == "") {
            overlayUsername.text = "Hi, \(ProfileAPIArray?.firstName != nil ? ProfileAPIArray?.firstName! : "User")!"
        overlaystep3.text = "\(Utility.shared.getLanguage()?.value(forKey: "ready") ?? "")"
        
            if let profImage = ProfileAPIArray?.picture{
     overlayUserImage.sd_setImage(with: URL(string:"\(IMAGE_AVATAR_MEDIUM)\(profImage)"), placeholderImage: #imageLiteral(resourceName: "unknown"))
            overlayUserImage.contentMode = .scaleAspectFill
        }
        else {
            overlayUserImage.image = #imageLiteral(resourceName: "unknown")
        }
        }
        else {
            overlayUsername.text = "Hi, \(Utility.shared.userName)"
            overlaystep3.text = "\(Utility.shared.getLanguage()?.value(forKey: "ready") ?? "")"
            
            if(Utility.shared.pickedimageString == "avatar") {
                overlayUserImage.image = #imageLiteral(resourceName: "unknown")
            }
            else {
                overlayUserImage.sd_setImage(with: URL(string:Utility.shared.pickedimageString), placeholderImage: #imageLiteral(resourceName: "unknown"))
                overlayUserImage.contentMode = .scaleAspectFill
               
            }
          
        }
        overlayUserImage.borderColor = Theme.ButtonBack_BG
        overlayUserImage.borderWidth = 2.0
        self.view.backgroundColor = UIColor(named: "becomeAHostStep_Color")
        
        
        
        baseBottomView.backgroundColor =  UIColor(named: "colorController")
       
        baseCurvedView.backgroundColor = UIColor(named: "colorController")
       
        nextRedirectBtn.backgroundColor = Theme.Button_BG
      
        self.baseBackBtn.setImage(UIImage(named: "left_arrow"), for: .normal)
        self.baseBackBtn.setTitle("", for: .normal)
        self.baseBackBtn.backgroundColor = UIColor.white
        self.baseBackBtn.layer.cornerRadius = self.baseBackBtn.frame.size.height/2
        self.baseBackBtn.clipsToBounds = true
        
        if Utility.shared.isRTLLanguage(){
            self.baseBackBtn.rotateImageViewofBtn()
        }
        overlayBtn.isHidden = false
        handimg.isHidden = false
        self.baseTitleLabel.text = "\(Utility.shared.getLanguage()?.value(forKey: "lets_become_host") ?? "Hi! Let's get you ready to become a host.")"
        self.baseTitleLabel.textColor = UIColor(named: "Title_Header")
        self.baseTitleLabel.font = UIFont(name: APP_FONT_SEMIBOLD, size: 24.0)
        self.baseTitleLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        
        baseProgressBGView.backgroundColor = Theme.becomeAHostProgressBG_Color
        baseCurvedProgressView.backgroundColor = Theme.PRIMARY_COLOR
        
        self.baseCurvedView.layer.borderColor = Theme.becomeAHostBorder_Color.cgColor
        self.baseCurvedView.layer.borderWidth = 0.5
        self.baseCurvedView.layer.cornerRadius = 20.0
        self.baseCurvedView.clipsToBounds = true
        
        self.offlineView.isHidden = true
       // self.callListingSettingsAPI(oflineView: self.offlineView, nextButton: self.nextRedirectBtn)
        hostTable.isHidden = false
        hostTable.separatorStyle = .none
        hostTable.rowHeight = UITableView.automaticDimension
        hostTable.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 10))
        nextRedirectBtn.setTitle("\(Utility.shared.getLanguage()?.value(forKey: "next")as! String)", for: .normal)
        nextRedirectBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
        errorLAbel.font = UIFont(name: APP_FONT_MEDIUM, size: 15)
        retryButton.titleLabel?.font = UIFont(name: APP_FONT, size: 15)
        nextRedirectBtn.layer.cornerRadius = nextRedirectBtn.frame.size.height/2
        nextRedirectBtn.clipsToBounds = true
        nextRedirectBtn.tintColor = UIColor.white
        errorLAbel.textColor =  UIColor(named: "Title_Header")
        retryButton.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        errorLAbel.text = "\((Utility.shared.getLanguage()?.value(forKey:"error_field"))!)"
               retryButton.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"retry"))!)", for:.normal)
        
        overlayUsername.font = UIFont(name: APP_FONT_MEDIUM, size: 22)
        overlayUsername.textColor = UIColor(named: "Title_Header")
        overlaystep3.textColor = UIColor(named: "Title_Header")
        overlaystep3.font = UIFont(name: APP_FONT_MEDIUM, size: 22)
        
        
    }
    
    func registerCells()
    {
        hostTable.register(UINib(nibName: "TextFieldCell", bundle: nil), forCellReuseIdentifier: "textfieldcell")
        hostTable.register(UINib(nibName: "SingleTextFieldCell", bundle: nil), forCellReuseIdentifier: "singletextfieldcell")
    }
    
    func setdropdown()
    {
        listInputView.frame = CGRect(x: 0, y: FULLHEIGHT-200, width: FULLWIDTH, height: 200)
        listValuePicker.frame = CGRect(x: 0, y: 0, width: FULLWIDTH, height: 200)
        listInputView.addSubview(listValuePicker)
        listValuePicker.delegate = self
        listValuePicker.tintColor = Theme.PRIMARY_COLOR
        listValuePicker.backgroundColor = UIColor(named: "colorController")
        listValuePicker.reloadAllComponents()
    }
    
    func setDropdownList()
    {
        setRoomType()
        setPersonCapacity()
        hostTable.reloadData()
    }
    
    func setRoomType()
    {
        if(Utility.shared.getListSettingsArray?.roomType != nil)
        {
            let listSettings = (Utility.shared.getListSettingsArray?.roomType?.listSettings!)!
        for item in listSettings
        {
            itemNameArray.append((item?.itemName)!)
        }
            if !Utility.shared.step1ValuesInfo.keys.contains("roomType") && itemNameArray.count > 0
        {
            placeLabel = itemNameArray.first!
            listValuePicker.selectRow(0, inComponent: 0, animated: true)
            
            Utility.shared.step1ValuesInfo.updateValue((listSettings[0]?.id!)!, forKey: "roomType")
        }else{
            _ = listSettings.filter({ (item) -> Bool in
                if (Utility.shared.step1ValuesInfo["roomType"]! as? Int) == item?.id
                {
                    placeLabel = (item?.itemName!)!
                    return true
                }else{
                    return false
                }
            })
            if !placeLabel.isEmpty
            {
                let index = itemNameArray.firstIndex(where: { (item) -> Bool in
                    item == placeLabel
                })
                listValuePicker.selectRow(index != nil ? index! : 0, inComponent: 0, animated: true)
            }
        }
        }
    }
    
    func setPersonCapacity()
    {
        if(Utility.shared.getListSettingsArray?.personCapacity != nil)
        {
            if let guestcountStartValue = Utility.shared.getListSettingsArray?.personCapacity?.listSettings![0]?.startValue, let guestcountEndValue = Utility.shared.getListSettingsArray?.personCapacity?.listSettings![0]?.endValue {
           // guestArrayCount = guestcountEndValue - guestcountStartValue
            guestArrayCount = guestcountEndValue
        }
        
        var guestWord = ""
            if Utility.shared.getListSettingsArray?.personCapacity?.listSettings![0]?.startValue == 1
        {
            guestWord = "\(Utility.shared.getLanguage()?.value(forKey: "guest")as! String)"
        }else{
            guestWord = "\( Utility.shared.getLanguage()?.value(forKey: "guests")as! String)"
        }
        
        var incrVal = 0
        for i in 0...guestArrayCount
        {
            if i == 0
            {
                incrVal = (Utility.shared.getListSettingsArray?.personCapacity?.listSettings![0]?.startValue!)!
//                guestsDropdownArray.insert("\(Utility.shared.getLanguage()?.value(forKey: "Cap_for")as! String) \(getListSettingsArray.personCapacity?.listSettings![0]?.startValue ?? 0) \(Utility.shared.getLanguage()?.value(forKey: "guest")as! String)\(incrVal > 1 ? "s" : "")" , at: i)
                
                if incrVal > 1{
                    guestsDropdownArray.insert("\(Utility.shared.getLanguage()?.value(forKey: "Cap_for")as! String) \(getListSettingsArray?.personCapacity?.listSettings![0]?.startValue ?? 0) \(Utility.shared.getLanguage()?.value(forKey: "CapGuests") ?? "Guests")" , at: i)
                }else{
                    guestsDropdownArray.insert("\(Utility.shared.getLanguage()?.value(forKey: "Cap_for")as! String) \(getListSettingsArray?.personCapacity?.listSettings![0]?.startValue ?? 0) \(Utility.shared.getLanguage()?.value(forKey: "guest") ?? "Guest")" , at: i)
                }
            }else {
                incrVal = (incrVal + 1)
//                guestsDropdownArray.insert("\(Utility.shared.getLanguage()?.value(forKey: "Cap_for")as! String) \(incrVal) \(Utility.shared.getLanguage()?.value(forKey: "guest")as! String)\(incrVal > 1 ? "s" : "")" , at: i)
                
                if incrVal > 1{
                    guestsDropdownArray.insert("\(Utility.shared.getLanguage()?.value(forKey: "Cap_for")as! String) \(incrVal) \(Utility.shared.getLanguage()?.value(forKey: "CapGuests") ?? "Guests")" , at: i)
                }else{
                    guestsDropdownArray.insert("\(Utility.shared.getLanguage()?.value(forKey: "Cap_for")as! String) \(incrVal) \(Utility.shared.getLanguage()?.value(forKey: "guest") ?? "Guest")" , at: i)
                }
            }
        }
        if !Utility.shared.step1ValuesInfo.keys.contains("personCapacity")
        {
            guestLabel = guestsDropdownArray.first!
            listValuePicker.selectRow(0, inComponent: 0, animated: true)
            Utility.shared.step1ValuesInfo.updateValue((Utility.shared.getListSettingsArray?.personCapacity?.listSettings![0]?.startValue!)!, forKey: "personCapacity")
        }else{
            if((Utility.shared.step1ValuesInfo["personCapacity"]!as! Int) <= 1)
            {
                guestLabel = ("\(Utility.shared.getLanguage()?.value(forKey: "Cap_for")as! String) \(Utility.shared.step1ValuesInfo["personCapacity"]!) \(Utility.shared.getLanguage()?.value(forKey: "guest")as! String)")
            }
            else
            {
                guestLabel = ("\(Utility.shared.getLanguage()?.value(forKey: "Cap_for")as! String) \(Utility.shared.step1ValuesInfo["personCapacity"]!) \(Utility.shared.getLanguage()?.value(forKey: "guests")as! String)")
            }
            //guestLabel = "\(Utility.shared.step1ValuesInfo["personCapacity"]!)"
            if !guestLabel.isEmpty
            {
                let index = guestsDropdownArray.firstIndex(where: { (item) -> Bool in
                    item == guestLabel
                })
                listValuePicker.selectRow(index != nil ? index! : 0, inComponent: 0, animated: true)
            }
        }
        }
    }
    
    //MARK: - Progress Indicator
    
//    func lottieAnimation(){
//
//        lottieView = LottieAnimationView.init(name:"animation")
//        lottieView.isHidden = false
//        self.lottieView.frame = CGRect(x:FULLWIDTH/2-40, y: FULLHEIGHT/2-40, width:100, height:100)
//        self.view.addSubview(self.lottieView)
//        self.lottieView.backgroundColor = UIColor.clear
//        self.lottieView.layer.cornerRadius = 6.0
//        self.lottieView.clipsToBounds = true
//        self.lottieView.play()
//       // Timer.scheduledTimer(timeInterval:0.2, target: self, selector: #selector(autoscroll_base), userInfo: nil, repeats: true)
//    }
    
    func addLottieViewAsSubview()
    {
       // self.hostTable.isHidden = true
       // self.view.addSubview(self.lottieView)
    }
    
    @objc func autoscroll_base()
    {
        self.lottieView.play()
    }
    
    //MARK: - IBActions

    @IBAction func dismissViewController(_ sender: Any) {
        //self.view?.layer.add(dismissrightAnimation()!, forKey: kCATransition)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func redirectToNextPage(_ sender: Any) {
        
        let placeListing = PlaceListingViewController()
        placeListing.delegatePlaceListing = self
        self.view.window?.backgroundColor = UIColor.white
        //self.view?.layer.add(presentrightAnimation()!, forKey: kCATransition)
        placeListing.modalPresentationStyle = .fullScreen
        self.present(placeListing, animated: false, completion: nil)
    }
    
    //MARK: - UITableViewDelegate and Datasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(Utility.shared.getLanguage()?.value(forKey: "lets_become_host")as! String)"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return nil
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "textfieldcell", for: indexPath) as? TextFieldCell

            if indexPath.row == 0
            {
                cell?.queryTitleLbl.text = "\(Utility.shared.getLanguage()?.object(forKey: "Place_kind")as! String)"
                cell?.txtField.attributedPlaceholder = NSAttributedString(string: placeLabel,
                                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "Title_Header")])
                cell?.selectionStyle = .none
                let toolBar = UIToolbar().ToolbarPikerSelect(mySelect: #selector(dismissgenderPicker))
                toolBar.barTintColor = UIColor(named: "Button_Grey_Color")
                cell?.txtField.inputAccessoryView = toolBar
                cell?.txtField.tintColor = UIColor.clear
                cell?.txtField.inputView = listInputView
                cell?.txtField.tag = 1
                cell?.txtField.delegate = self
                cell?.queryTitleLbl.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
                cell?.txtField.font = UIFont(name: APP_FONT, size: 14)
                cell?.queryTitleLbl.textColor =  UIColor(named: "Title_Header")
        
                cell?.stepNumberLblTopConstraint.constant = 0
                    cell?.linebottomconstant.constant = 0
                    cell?.linetopconstant.constant = 0
                
            }else if indexPath.row == 1
            {
                cell?.queryTitleLbl.text = "\(Utility.shared.getLanguage()?.value(forKey: "No_of_guestAccommodated")as! String)"
                cell?.txtField.attributedPlaceholder = NSAttributedString(string: guestLabel,
                                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "Title_Header")])
                cell?.selectionStyle = .none
                let toolBar = UIToolbar().ToolbarPikerSelect(mySelect: #selector(dismissgenderPicker))
                toolBar.barTintColor = UIColor(named: "Button_Grey_Color")
                cell?.txtField.inputAccessoryView = toolBar
                cell?.txtField.inputView = listInputView
                cell?.txtField.tintColor = UIColor.clear
                cell?.txtField.tag = 2
                cell?.txtField.delegate = self
                cell?.stepnumberLbl.isHidden = true
                cell?.queryTitleLbl.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
                cell?.txtField.font = UIFont(name: APP_FONT, size: 14)
                cell?.queryTitleLbl.textColor =  UIColor(named: "Title_Header")
                
                cell?.stepNumberLblTopConstraint.constant = 0
                    cell?.linebottomconstant.constant = 0
                    cell?.linetopconstant.constant = 0
            }
            
            cell?.imgDownArrow.isHidden = false
            
//            let downArrowIconView = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 50))
//            let downArrowIcon = UIImageView()
//            if Utility.shared.isRTLLanguage(){
//                downArrowIcon.frame = CGRect(x: 20, y:((cell?.txtField.frame.size.height)! / 2)-3 , width: 10, height: 10)
//            }else{
//                downArrowIcon.frame = CGRect(x: 0, y: ((cell?.txtField.frame.size.height)! / 2)-3, width: 10, height: 10)
//            }
//
//            downArrowIcon.image = UIImage(named: "downArrow")
//            downArrowIcon.contentMode = .scaleAspectFit
//            downArrowIconView.tag = indexPath.row
//            downArrowIconView.addTarget(self, action: #selector(onClickedbaseDownArrow), for: .touchUpInside)
//            downArrowIconView.addSubview(downArrowIcon)
//
//            if Utility.shared.isRTLLanguage(){
//                cell?.txtField.rightView = downArrowIconView
//                cell?.txtField.rightViewMode = .always
//                cell?.txtField.clearButtonMode = .whileEditing
//                cell?.txtField.textAlignment = .right
//            }else{
//                cell?.txtField.rightView = downArrowIconView
//                cell?.txtField.rightViewMode = .always
//                cell?.txtField.clearButtonMode = .whileEditing
//                cell?.txtField.textAlignment = .left
//            }
            
            return cell!
        }
        
        return UITableViewCell()
        
    }
    
    @objc func onClickedbaseDownArrow(sender: UIButton){
        let cell = hostTable.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as! TextFieldCell
        cell.txtField.becomeFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0
        {
            selectedTextfield = 1
            if !placeLabel.isEmpty
            {
                let index = itemNameArray.firstIndex(where: { (item) -> Bool in
                    item == placeLabel
                })
                listValuePicker.selectRow(index != nil ? index! : 0, inComponent: 0, animated: true)
            }
        }else if indexPath.row == 1
        {
            selectedTextfield = 2
            if !guestLabel.isEmpty
            {
                let index = guestsDropdownArray.firstIndex(where: { (item) -> Bool in
                    item == guestLabel
                })
                listValuePicker.selectRow(index != nil ? index! : 0, inComponent: 0, animated: true)
            }
        }
        listValuePicker.reloadAllComponents()
    }
    
    @objc func dismissgenderPicker(text:Int) {

        view.endEditing(true)
    }
    
    //MARK: - UIPickerViewDelegate and Datasource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(selectedTextfield == 1)
        {
            return itemNameArray.count
        }
        else{
            return guestArrayCount
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        var titleData = ""
        
        if(selectedTextfield == 1)
        {
            titleData = itemNameArray[row]
        }else{
            titleData = guestsDropdownArray[row]
        }
        let myTitle = NSAttributedString(string: titleData , attributes: [NSAttributedString.Key.font:UIFont(name: APP_FONT, size: 15.0)!,NSAttributedString.Key.foregroundColor:Theme.PRIMARY_COLOR])
        return myTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent  component: Int) {
        
        if(selectedTextfield == 1)
        {
            placeLabel = itemNameArray[row]
            listValuePicker.selectRow(row, inComponent: component, animated: true)
            Utility.shared.step1ValuesInfo.updateValue((Utility.shared.getListSettingsArray?.roomType?.listSettings![row]?.id!)!, forKey: "roomType")
        }else{
            guestLabel = guestsDropdownArray[row]
            listValuePicker.selectRow(row, inComponent: component, animated: true)
            let stringArray = guestLabel.components(separatedBy: CharacterSet.decimalDigits.inverted)
            for item in stringArray {
                if let number = Int(item) {
                    Utility.shared.step1ValuesInfo.updateValue(number, forKey: "personCapacity")
                }
            }
        }
    }
    
    //MARK: - UITextFieldDelegates
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTextfield = textField.tag
        if selectedTextfield == 1
        {
            if !placeLabel.isEmpty
            {
                let index = itemNameArray.firstIndex(where: { (item) -> Bool in
                    item == placeLabel
                })
                listValuePicker.selectRow(index != nil ? index! : 0, inComponent: 0, animated: true)
            }
        }else if selectedTextfield == 2
        {
            if !guestLabel.isEmpty
            {
                let index = guestsDropdownArray.firstIndex(where: { (item) -> Bool in
                    item == guestLabel
                
                })
                listValuePicker.selectRow(index != nil ? index! : 0, inComponent: 0, animated: true)
            }
        }
        listValuePicker.reloadAllComponents()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        selectedTextfield = textField.tag
        hostTable.reloadData()
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func overlayStartTapped(_ sender: Any) {
        self.overlayView.isHidden = true
    }
    
    
    @IBAction func overlayBackBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

