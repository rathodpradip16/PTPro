//
//  MoreFilterVC.swift
//  App
//
//  Created by RADICAL START on 28/03/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import Lottie
import RangeSeekSlider
import Apollo
import SwiftMessages

class MoreFilterVC: UIViewController,UITableViewDelegate,UITableViewDataSource,RangeSeekSliderDelegate,AirbnbDatePickerDelegate {
   
   
    
    
    //MARK:************************************************ IBOUTLET CONNECTIONS **************************************************>
    
    @IBOutlet weak var fitertitleLabel: UILabel!
    @IBOutlet var bottomView: UIView!
    @IBOutlet var topView: UIView!
    
    @IBOutlet var seemoreBtn: UIButton!
    @IBOutlet var closeBtn: UIButton!
    
    @IBOutlet var filterTV: UITableView!
    @IBOutlet var clearBtn: UIButton!
    
    
    @IBOutlet var lineView: UIView!
    public var selectedStartDate: Date?
    public var selectedEndDate: Date?
    //MARK:************************************************ GLOBAL VARIABLE DECLARATIONS **************************************************>
    
    
    var dateFormatter: DateFormatter {
        get {
            let f = DateFormatter()
            f.dateFormat = "MMM d, YYYY"
            if(Utility.shared.getAppLanguageCode() != nil)
            {
                if(Utility.shared.isRTLLanguage()) {
                    f.locale = NSLocale(localeIdentifier:"en") as Locale
                }
                else {
                    f.locale = NSLocale(localeIdentifier:Utility.shared.getAppLanguageCode()!) as Locale
                }
            }
            return f
        }
    }
    
    var dateFormatterDate: DateFormatter {
        get {
            let f = DateFormatter()
            f.dateFormat = "d"
            if(Utility.shared.getAppLanguageCode() != nil)
            {
            f.locale = NSLocale(localeIdentifier:Utility.shared.getAppLanguageCode()!) as Locale
            }
            return f
        }
    }
    
    var dateFormatterDateMonth: DateFormatter {
        get {
            let f = DateFormatter()
            f.dateFormat = "MMM d"
            if(Utility.shared.getAppLanguageCode() != nil)
            {
                if(Utility.shared.isRTLLanguage()) {
                    f.locale = NSLocale(localeIdentifier:"en") as Locale
                }
                else {
                    f.locale = NSLocale(localeIdentifier:Utility.shared.getAppLanguageCode()!) as Locale
                }
            }
            return f
        }
    }
    
    var homeTypeArray = NSArray()
    var roomsTypeArray = NSArray()
    var amenitiesTitleArray = NSArray()
    var FacilitiesTitleArray = NSArray()
    var houseRulesArray = NSArray()
    var isShowmoreClicked:Bool = false
    var isfacilitiesmoreClicked:Bool = false
    var ishousemoreClicked:Bool = false
    var isHomeTypeClicked:Bool = false
    var count = Int()
    var minCount = Int()
    var maxCount = Int()
    var minsliderValue = String()
    var maxsliderValue = String()
    var getsearchPriceArray : GetDefaultSettingQuery.Data.GetSearchSettings.Results?
    var RoomsFilterArray = [GetDefaultSettingQuery.Data.GetListingSettingsCommon.Result]()
    
    var lottieView: LottieAnimationView!
    
    var apollo_headerClient: ApolloClient!
    
    
    
    var roomtypeArray = NSMutableArray()
    var amenitiesArray = NSMutableArray()
    var facilitiesArray = NSMutableArray()
    var housingRulesArray = NSMutableArray()
    var priceRangeArray = NSMutableArray()
    var instantBook = String()
    var bedrooms_count = Int()
    var beds_count = Int()
    var bathroom_count = Int()
    var TotalFilterCount : Int = 0
    var isSwitchEnable:Bool = false
    
    var minvalue = Int()
    var maxValue = Int()
    
    var delegate: searchPageProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.checkApolloStatus()
       // self.lottieAnimation()
        self.initialSetup()
        self.registerCells()
        if(RoomsFilterArray.count == 0)
        {
            self.lottieAnimation()
            self.FilterAPICall()
        }
        //self.FilterAPICall()
        
        filterTV.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        filterTV.estimatedSectionFooterHeight = 0
        filterTV.sectionFooterHeight = 0

        // Do any additional setup after loading the view.
    }
    func checkApolloStatus()
    {
        if((Utility.shared.getCurrentUserToken()) != nil)
        {
        }
        else{
            apollo_headerClient = ApolloClient(url: URL(string:graphQLEndpoint)!)
        }
        
    }
    func registerCells(){
        filterTV.register(UINib(nibName: "InstantBookCell", bundle: nil), forCellReuseIdentifier: "InstantBookCell")
        filterTV.register(UINib(nibName: "PriceRangeCell", bundle: nil), forCellReuseIdentifier: "PriceRangeCell")
        filterTV.register(UINib(nibName: "HometypeCell", bundle: nil), forCellReuseIdentifier: "HometypeCell")
        filterTV.register(UINib(nibName: "RoomsCell", bundle: nil), forCellReuseIdentifier: "RoomsCell")
        filterTV.register(UINib(nibName: "AmenitiesCell", bundle: nil), forCellReuseIdentifier: "AmenitiesCell")
        filterTV.register(UINib(nibName: "HouseRulesCell", bundle: nil), forCellReuseIdentifier: "HouseRulesCell")
        filterTV.register(UINib(nibName: "FacilitiesCell", bundle: nil), forCellReuseIdentifier: "FacilitiesCell")
        filterTV.register(UINib(nibName: "DateCell", bundle: nil), forCellReuseIdentifier: "DateCell")
        
        self.filterTV.separatorStyle = .none
        
        
    }
    
    func lottieAnimation(){
        lottieView = LottieAnimationView.init(name:"animation")
        lottieView.isHidden = false
        self.lottieView.frame = CGRect(x:FULLWIDTH/2-40, y:FULLHEIGHT/2-150, width:100, height:100)
        self.filterTV.addSubview(self.lottieView)
        self.lottieView.backgroundColor = UIColor.clear
        self.lottieView.layer.cornerRadius = 6.0
        self.lottieView.clipsToBounds = true
        self.lottieView.play()
        Timer.scheduledTimer(timeInterval:0.2, target: self, selector: #selector(autoscrolling), userInfo: nil, repeats: true)
    }
    
    
    @objc func autoscrolling()
    {
        self.lottieView.play()
    }
    func initialSetup(){
        

        seemoreBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 18)
        fitertitleLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
        
        
        filterTV.separatorColor =  UIColor.green
        lineView.backgroundColor = UIColor(named: "Review_Page_Line_Color")

       if IS_IPHONE_XR
        {
        self.topView.frame = CGRect(x: 0, y: 0, width: FULLWIDTH-40, height: 80)
        filterTV.frame = CGRect(x: 0, y: 85, width: FULLWIDTH-40, height: FULLHEIGHT-380)
            
        }
        
        self.view.backgroundColor = UIColor(named: "colorController")
        filterTV.backgroundColor = UIColor(named: "colorController")
        
          roomtypeArray = Utility.shared.roomtypeArray
          amenitiesArray =  Utility.shared.amenitiesArray
          facilitiesArray =  Utility.shared.facilitiesArray
          housingRulesArray =  Utility.shared.houseRulesArray
          isSwitchEnable = Utility.shared.isSwitchEnable
        seemoreBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"seeresults"))!)", for: .normal)
        clearBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"clearall"))!)", for: .normal)
        clearBtn.titleLabel?.font = UIFont(name: APP_FONT, size: 14)
        fitertitleLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"filters"))!)"
        
        fitertitleLabel.textColor = .white
        
        
    }
    
    func FilterAPICall(){
        if Utility.shared.isConnectedToNetwork(){
            let priceRangequery = GetDefaultSettingQuery()
            Network.shared.apollo_headerClient.fetch(query: priceRangequery){ response in
                switch response {
                case .success(let result):
                    //RecommendedListing
                    guard (result.data?.getSearchSettings?.results) != nil else{
                        if (result.data?.getSearchSettings?.status == 400) {
                            self.view.makeToast(result.data?.getSearchSettings?.errorMessage)
                        }
                        return
                    }
                    self.getsearchPriceArray = ((result.data?.getSearchSettings?.results)!)
                    
                    
                    
                    
                    guard (result.data?.getListingSettingsCommon?.results) != nil else{
                        return
                    }
                    self.RoomsFilterArray = ((result.data?.getListingSettingsCommon?.results)!) as! [GetDefaultSettingQuery.Data.GetListingSettingsCommon.Result]
                    
                    self.filterTV.reloadData()
                    self.lottieView.isHidden = true
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                }
            }
        }
    }
    
    @IBAction func clearBtnTapped(_ sender: Any) {
          if(RoomsFilterArray.count > 0)
          {
        self.lottieAnimation()
        Utility.shared.instantBook = ""
        Utility.shared.roomtypeArray.removeAllObjects()
        Utility.shared.amenitiesArray.removeAllObjects()
        Utility.shared.priceRangeArray.removeAllObjects()
        Utility.shared.facilitiesArray.removeAllObjects()
        Utility.shared.houseRulesArray.removeAllObjects()
              
              Utility.shared.showGuestCount = false
              Utility.shared.showbedRoomCount = false
              Utility.shared.showbathCount = false
              Utility.shared.showbedCount = false
             
            facilitiesArray.removeAllObjects()
            roomtypeArray.removeAllObjects()
            amenitiesArray.removeAllObjects()
            priceRangeArray.removeAllObjects()
            housingRulesArray.removeAllObjects()
              
             // Utility.shared.priceRangeArray.add(0)
        Utility.shared.beds_count = 0
        Utility.shared.bedrooms_count = 0
        Utility.shared.bathroom_count = 0
        Utility.shared.filterCount = 0
        if(isSwitchEnable)
        {
            isSwitchEnable = false
            Utility.shared.isSwitchEnable = false
        }
        Utility.shared.TotalFilterCount = 0
              Utility.shared.selectedstartDate = ""
              Utility.shared.selectedEndDate = ""
              selectedStartDate = nil
              selectedEndDate = nil
       
//        let indexPath = IndexPath(item: 0, section: 0)
//              filterTV.reloadRows(at: [indexPath], with: .none)
//
              let indexPaths = IndexPath(item: 0, section: 3)
                    filterTV.reloadRows(at: [indexPaths], with: .none)
              
              
              filterTV.reloadData()
              
             
        self.lottieView.isHidden = true
             
        }
        
    }
    
    
    
    @IBAction func closeBtnTapped(_ sender: Any) {
        Utility.shared.instantBook = ""
        Utility.shared.roomtypeArray.removeAllObjects()
        Utility.shared.amenitiesArray.removeAllObjects()
        Utility.shared.priceRangeArray.removeAllObjects()
        Utility.shared.facilitiesArray.removeAllObjects()
        Utility.shared.houseRulesArray.removeAllObjects()
        Utility.shared.beds_count = 0
        Utility.shared.bedrooms_count = 0
        Utility.shared.bathroom_count = 0
        Utility.shared.filterCount = 0
        
        Utility.shared.showGuestCount = false
        Utility.shared.showbedRoomCount = false
        Utility.shared.showbathCount = false
        Utility.shared.showbedCount = false
        if(Utility.shared.isSwitchEnable)
        {
            Utility.shared.isSwitchEnable = false
        }
       
        AirbnbDatePickerViewController().handleClearInput()
        Utility.shared.TotalFilterCount = 0
       
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func seeMoreTapped(_ sender: Any) {
        Utility.shared.isfromFilterPage = true
        Utility.shared.isfromMoreFilter = true
        
          Utility.shared.roomtypeArray = roomtypeArray
          Utility.shared.amenitiesArray = amenitiesArray
         Utility.shared.facilitiesArray = facilitiesArray
        Utility.shared.houseRulesArray =  housingRulesArray
        Utility.shared.isSwitchEnable =  isSwitchEnable
        Utility.shared.selectedEndDate_filter = ""
        Utility.shared.selectedstartDate_filter = ""
        if(selectedStartDate != nil && selectedEndDate != nil)
        {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        Utility.shared.selectedstartDate_filter = (dateFormatterGet.string(from: selectedStartDate!))
       
        Utility.shared.selectedEndDate_filter = (dateFormatterGet.string(from: selectedEndDate!))
        }
       
        Utility.shared.TotalFilterCount = Utility.shared.amenitiesArray.count + Utility.shared.houseRulesArray.count + Utility.shared.facilitiesArray.count+Utility.shared.roomtypeArray.count
        if(Utility.shared.selectedstartDate_filter != nil && Utility.shared.selectedEndDate_filter != nil && Utility.shared.selectedstartDate_filter != "" && Utility.shared.selectedEndDate_filter != "")
        {
            
            
            Utility.shared.TotalFilterCount += 1
        }
        
        if(Utility.shared.filterCount != 0 && Utility.shared.showGuestCount ){
            Utility.shared.TotalFilterCount += 1
        }
        if(Utility.shared.isSwitchEnable){
         Utility.shared.TotalFilterCount += 1
        }
        if(Utility.shared.bedrooms_count > 0 && Utility.shared.showbedRoomCount){
            Utility.shared.TotalFilterCount += 1
        }
         if(Utility.shared.bathroom_count > 0 && Utility.shared.showbathCount){
            Utility.shared.TotalFilterCount += 1
        }
         if(Utility.shared.beds_count > 0 && Utility.shared.showbedCount){
            Utility.shared.TotalFilterCount += 1
        }
         if(Utility.shared.priceRangeArray.count != 0){
            Utility.shared.TotalFilterCount += 1
        }
//        if(Utility.shared.filterCount != 0 ){
//           Utility.shared.TotalFilterCount += 1
//       }
        if(Utility.shared.TotalFilterCount == 0) {
            if(Utility.shared.locationfromSearch == nil || Utility.shared.locationfromSearch == "" || Utility.shared.locationfromSearch == "empty") {
        Utility.shared.locationfromSearch = "empty"
            }
        }
        
        delegate?.callSearchAPI()
        if(Utility.shared.isfromfloatmap_Page)
        {
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        }
        else
        {
        self.dismiss(animated: true, completion: nil)
        }
        
    }
    //MARK:************************************************ TABLEVIEW DELEGATE/DATASOURCE METHODS*********************************************>
    
     func numberOfSections(in tableView: UITableView) -> Int {
        if(RoomsFilterArray.count > 0)
        {
        return 9
        }
        else{
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0)
        {
           
            return 1
          
        }
        if(section == 1)
        {
           
            return 1
          
        }
        if(section == 2)
        {
            if(RoomsFilterArray.count > 0)
            {
            return 1
            }
            return 0
        }
        else if(section == 3){
            if(((getsearchPriceArray?.minPrice) != nil)&&((getsearchPriceArray?.maxPrice) != nil))
            {
                if(Utility.shared.priceRangeArray.count != 0){
                    return 1
                }
                return 1
            }
            return 0
        }
        if(section == 4){
            if(RoomsFilterArray.count>0 && RoomsFilterArray[0].listSettings!.count != 0){
            if(isHomeTypeClicked){
            return RoomsFilterArray[0].listSettings!.count
            }
            
                return ((RoomsFilterArray[0].listSettings?.count ?? 0) > 2) ? 2 : (RoomsFilterArray[0].listSettings?.count ?? 0)
            }
            return 0
        }
        else if(section == 5){
            if(RoomsFilterArray.count > 0)
            {
            return 3
            }
            return 0
        }
        else if(section == 6){
            if(RoomsFilterArray.count>0 && RoomsFilterArray[9].listSettings!.count != 0){
            if(isShowmoreClicked){
            return RoomsFilterArray[9].listSettings!.count
            }
            
                return ((RoomsFilterArray[9].listSettings?.count ?? 0) > 2) ? 2 : (RoomsFilterArray[9].listSettings?.count ?? 0)
            }
            return 0
            
        }
        else if(section == 7){
            if(RoomsFilterArray.count>0 && RoomsFilterArray[11].listSettings!.count != 0){
             if(isfacilitiesmoreClicked){
            return RoomsFilterArray[11].listSettings!.count
            }
            return ((RoomsFilterArray[11].listSettings?.count ?? 0) > 2) ? 2 : (RoomsFilterArray[11].listSettings?.count ?? 0)
            }
            return 0
        }
        else if(section == 8)
        {
            if(RoomsFilterArray.count>0 && RoomsFilterArray[13].listSettings!.count != 0){
             if(ishousemoreClicked){
            return RoomsFilterArray[13].listSettings!.count
            }
            return ((RoomsFilterArray[9].listSettings?.count ?? 0) > 2) ? 2 : (RoomsFilterArray[9].listSettings?.count ?? 0)
            }
            return 0
        }
        return 0
    }
    func tableView( _ tableView : UITableView,  titleForHeaderInSection section: Int)->String?
    {
        if(section == 1){
            return "\((Utility.shared.getLanguage()?.value(forKey:"guests"))!)"
        }
        else if(section == 3){
            return "\((Utility.shared.getLanguage()?.value(forKey:"pricerange"))!)"
        }
        else if(section == 4 ){
            return "\((Utility.shared.getLanguage()?.value(forKey:"hometype"))!)"
        }
        else if(section == 5){
            return "\((Utility.shared.getLanguage()?.value(forKey:"roomsandbeds"))!)"
        }
        else if(section == 6){
            return  "\((Utility.shared.getLanguage()?.value(forKey:"amenities"))!)"
        }
        else if(section == 7){
            return "\((Utility.shared.getLanguage()?.value(forKey:"facilities"))!)"
        }
        else if(section == 8){
            return "\((Utility.shared.getLanguage()?.value(forKey:"houserules"))!)"
        }
        return ""
    }
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor =   UIColor(named: "colorController")
        
        let lineLabel = UILabel(frame: CGRect(x:15, y:0, width:FULLWIDTH-30, height: 1.0))
        lineLabel.backgroundColor = UIColor(named: "Review_Page_Line_Color")
        headerView.addSubview(lineLabel)
        
        let headerLabel = UILabel(frame: CGRect(x: 20, y:10, width:
        tableView.bounds.size.width-40, height: 40))
        headerLabel.font = UIFont(name: APP_FONT_MEDIUM, size:16)
         headerLabel.textColor =  UIColor(named: "Title_Header")
        headerLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
//        headerLabel.sizeToFit()
        headerView.addSubview(headerLabel)
        
        return headerView
    }
    
    
   func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if((section==2) || (section==0)){
        return 0
    }
        return 50
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String?
    {
        
        if(section == 6){
            if(!isShowmoreClicked){
            return  "\((Utility.shared.getLanguage()?.value(forKey:"showmore")) ?? "Show more")"
            }
           return "\((Utility.shared.getLanguage()?.value(forKey:"showless")) ?? "Show Less")"
        }
        else if(section == 4){
            if(!isHomeTypeClicked){
            return  "\((Utility.shared.getLanguage()?.value(forKey:"showmore")) ?? "Show more")"
            }
           return "\((Utility.shared.getLanguage()?.value(forKey:"showless")) ?? "Show Less")"
        }
        else if(section == 7){
            if(!isfacilitiesmoreClicked){
            return "\((Utility.shared.getLanguage()?.value(forKey:"showmore")) ?? "Show more")"
            }
            return "\((Utility.shared.getLanguage()?.value(forKey:"showless")) ?? "Show Less")"
        }
        else if(section == 8){
            if(!ishousemoreClicked){
            return "\((Utility.shared.getLanguage()?.value(forKey:"showmore")) ?? "Show more")"
            }
            else{
                return "\((Utility.shared.getLanguage()?.value(forKey:"showless")) ?? "Show Less")"
            }
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
        let footerView = UIView()
       // footerView.backgroundColor = UIColor.green
         if((section==6 && (RoomsFilterArray[9].listSettings?.count ?? 0) > 2)||(section==7 &&  (RoomsFilterArray[11].listSettings?.count ?? 0) > 2)||(section==8 &&  (RoomsFilterArray[13].listSettings?.count ?? 0) > 2)  || (section==4 &&  (RoomsFilterArray[0].listSettings?.count ?? 0) > 2))
        {
        let showmore = UIButton()
        let overlaybtn = UIButton()
        let downArrow = UIImageView()
        let footerText  = (self.tableView(tableView, titleForFooterInSection: section))
            
        downArrow.tintColor = Theme.PRIMARY_COLOR
        showmore.frame = CGRect(x:20, y:0, width:80, height:45)
             downArrow.frame = CGRect(x:showmore.frame.size.width+18, y:20.5, width:9, height: 6)
             overlaybtn.frame = CGRect(x:20, y:0, width:showmore.frame.size.width + downArrow.frame.size.width, height:35)
             overlaybtn.setTitle("", for: .normal)
             if(footerText == "\((Utility.shared.getLanguage()?.value(forKey:"showmore")) ?? "Show more")") {
                 downArrow.image = UIImage(#imageLiteral(resourceName: "downarrow-green"))
             }
             else {
                 downArrow.image = UIImage(#imageLiteral(resourceName: "upArrow"))
             }
            if Utility.shared.isRTLLanguage(){
                if(section==6){
                showmore.frame = CGRect(x:FULLWIDTH-90, y:0, width:tableView.bounds.size.width, height:45)
                    overlaybtn.frame = CGRect(x:FULLWIDTH-90, y:0, width:showmore.frame.size.width + downArrow.frame.size.width, height:35)
                }
                if(section==4){
                showmore.frame = CGRect(x:FULLWIDTH-90, y:0, width:tableView.bounds.size.width, height:45)
                    overlaybtn.frame = CGRect(x:FULLWIDTH-90, y:0, width:showmore.frame.size.width + downArrow.frame.size.width, height:35)
                }
                if (section==7) {
                    showmore.frame = CGRect(x:FULLWIDTH-90, y:0, width:tableView.bounds.size.width, height:45)
                    overlaybtn.frame = CGRect(x:FULLWIDTH-90, y:0, width:showmore.frame.size.width + downArrow.frame.size.width, height:35)
                }
                if (section==8) {
                    showmore.frame = CGRect(x:FULLWIDTH-90, y:0, width:tableView.bounds.size.width, height:45)
                    overlaybtn.frame = CGRect(x:FULLWIDTH-90, y:0, width:showmore.frame.size.width + downArrow.frame.size.width, height:35)
                }
                downArrow.frame = CGRect(x:showmore.frame.origin.x - 35 + 20, y:20, width: 9, height: 6)
                }
             showmore.backgroundColor =    UIColor(named: "colorController")
        showmore.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        showmore.titleLabel?.font =  UIFont(name: APP_FONT, size:14)
        showmore.contentHorizontalAlignment = .left
        showmore.setTitle(self.tableView(tableView, titleForFooterInSection: section), for: .normal)
             overlaybtn.tag = section
             overlaybtn.addTarget(self, action: #selector(addBtnTapped(_:)), for: .touchUpInside)
        
        footerView.addSubview(showmore)
             footerView.addSubview(downArrow)
             footerView.addSubview(overlaybtn)
        }
        
        return footerView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if((section==6)||(section==7)||(section==8) || (section == 4)){
            return 50
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
           return 50
              }
       else if(indexPath.section == 2)
        {
            return 95
        }
        else if(indexPath.section==3){
            return 120
        }
       else if((indexPath.section==4)){
            return 60
       }else if (indexPath.section == 6){
           return UITableView.automaticDimension
       }
         else if(indexPath.section == 5){
             return 70
         }

        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DateCell", for: indexPath)as! DateCell
            cell.dateView.backgroundColor = UIColor(named: "becomeAHostStep_Color")
//            if Utility.shared.isRTLLanguage() {
//                cell.dateBtnLeading.constant = 30
//            }
            cell.selectionStyle = .none
            cell.dateBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
            if Utility.shared.selectedstartDate == "" && Utility.shared.selectedEndDate == "" {
                cell.dateBtn.setTitle("  \(Utility.shared.getLanguage()?.value(forKey:"seldate") ?? " Select dates ")",  for: .normal)
            }
            else{
                let calendar = Calendar.current
                let sampleDateFormat = DateFormatter()
                sampleDateFormat.locale = Locale(identifier: "en_US_POSIX")
                sampleDateFormat.timeZone = TimeZone.init(abbreviation: "GMT")
                sampleDateFormat.dateFormat = "yyyy-MM-dd"
                
                
                
                
                
                
                let firstDate = sampleDateFormat.date(from: Utility.shared.selectedstartDate)
                let secondDate = sampleDateFormat.date(from: Utility.shared.selectedEndDate)
                
//                let date1Components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: firstDate!)
//                let date2Components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: secondDate!)
//
//                if date1Components.month == date2Components.month {
//                    self.selectedStartDate = firstDate
//                    self.selectedEndDate = secondDate
//                    cell.dateBtn.setTitle("  \(dateFormatterDateMonth.string(from: selectedStartDate!)) - \(dateFormatterDate.string(from: selectedEndDate!))", for: .normal)
//                }
//                else {
//                    if date1Components.year != date2Components.year {
                        self.selectedStartDate = firstDate
                        self.selectedEndDate = secondDate
                        cell.dateBtn.setTitle("  \(dateFormatter.string(from: selectedStartDate!)) - \(dateFormatter.string(from: selectedEndDate!))", for: .normal)
//                    }
//                    else {
//
//                        self.selectedStartDate = firstDate
//                        self.selectedEndDate = secondDate
//                        cell.dateBtn.setTitle("  \(dateFormatterDateMonth.string(from: selectedStartDate!)) - \(dateFormatterDateMonth.string(from: selectedEndDate!))", for: .normal)
//                    }
             //   }
                
                
                
                
               
            }
            cell.dateBtn.addTarget(self, action: #selector(showDatePicker), for: .touchUpInside)
            return cell
        }
        else if(indexPath.section == 1){
            count = 0
           minCount = 0
            let cell = tableView.dequeueReusableCell(withIdentifier: "RoomsCell", for: indexPath)as! RoomsCell
            cell.roomsTitleLabel.textColor = UIColor(named: "searchPlaces_TextColor")
            if(indexPath.row == 0){
                cell.roomsTitleLabel.text =  "\(Utility.shared.getLanguage()?.value(forKey:"Addguest") ?? "Add guest")"
                
                if(!Utility.shared.showGuestCount) {
                    
                    
                    Utility.shared.filterCount = Utility.shared.min_filter_guest_count
                    cell.countshowLabel.text =  String(Utility.shared.min_filter_guest_count)
                }
                else {
                cell.countshowLabel.text =  String(Utility.shared.filterCount)
                }
            }
            
            if cell.countshowLabel.text == String(Utility.shared.min_filter_guest_count){
                cell.minusBtn.isEnabled = false
                cell.minusBtn.alpha = 0.5
            }else{
                cell.minusBtn.isEnabled = true
                cell.minusBtn.alpha = 1.0
            }
            
            if cell.countshowLabel.text == String(Utility.shared.maximum_guest_count){
                cell.plusBtn.isEnabled = false
                cell.plusBtn.alpha = 0.5
            }else{
                cell.plusBtn.isEnabled = true
                cell.plusBtn.alpha = 1.0
            }

            
           
            cell.plusBtn.layer.cornerRadius = cell.plusBtn.frame.size.width/2
            cell.plusBtn.layer.borderWidth = 1.0
            cell.plusBtn.tag = indexPath.section
            cell.minusBtn.tag = indexPath.section
            
            cell.plusBtn.removeTarget(self, action: #selector(plusBtnTappedFilter), for: .touchUpInside)
            cell.plusBtn.addTarget(self, action: #selector(plusBtnTappedFilter), for: .touchUpInside)
            cell.plusBtn.layer.borderColor = Theme.PRIMARY_COLOR.cgColor
            cell.minusBtn.layer.cornerRadius = cell.minusBtn.frame.size.width/2
            cell.minusBtn.layer.borderWidth = 1.0
            cell.minusBtn.layer.borderColor = Theme.PRIMARY_COLOR.cgColor
            cell.minusBtn.removeTarget(self, action: #selector(minusBtnTappedFilter), for: .touchUpInside)
            cell.minusBtn.addTarget(self, action: #selector(minusBtnTappedFilter), for: .touchUpInside)
            cell.tag = indexPath.section+8000
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.dashView.backgroundColor = UIColor.green
            //cell.backgroundColor = UIColor.red
            
            return cell

        }
        
          else if(indexPath.section == 2){
                   let cell = tableView.dequeueReusableCell(withIdentifier: "InstantBookCell", for: indexPath)as! InstantBookCell
                   cell.instantbookLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"instantbook"))!)"
              cell.DecsriptionLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"booktext")) ?? "")"
              cell.DecsriptionLabel.textColor = UIColor(named: "searchPlaces_TextColor")

                   cell.selectionStyle = UITableViewCell.SelectionStyle.none
                   
                   
                   cell.tag = indexPath.row+8000
        
                   if(isSwitchEnable){
                       cell.lotSwitch.isOn = true
                        cell.lotSwitch.isSelected = true
                   }
                   else{
                       cell.lotSwitch.isOn = false
                       cell.lotSwitch.isSelected = true
                       cell.lotSwitch.isEnabled = true
                       
                      
                   }

                    // image = (image.tint(with: Theme.PRIMARY_COLOR))
                   //cell.lotSwitch.onTintColor = UIColor(patternImage: image)
                   cell.lotSwitch.addTarget(self, action: #selector(switchToggled), for: .valueChanged)
              //cell.backgroundColor = UIColor.systemPink
                  // cell.lotSwitch.thumbTintColor = UIColor(patternImage: image)
                   return cell
               }
               else if(indexPath.section == 3) {
                   
                   let cell = tableView.dequeueReusableCell(withIdentifier: "PriceRangeCell", for: indexPath)as! PriceRangeCell
                   cell.sliderView.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
                 //  cell.priceLabel.text = "$10-$549"
                   cell.tag = 9000
                   cell.priceshowLabel.textColor = UIColor(named: "searchPlaces_TextColor")
                   
                   if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
                   {
                       let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
                       let from_currency = getsearchPriceArray?.priceRangeCurrency! ?? ""
                       let currency_amount = CGFloat(getsearchPriceArray?.minPrice != nil ? (getsearchPriceArray?.minPrice)! : Double(0))
                       let max_currency_amount = CGFloat(getsearchPriceArray?.maxPrice! ?? 0.0)
                       let price_value = Utility.shared.getCurrencyRate(basecurrency:Utility.shared.currencyvalue_from_API_base, fromCurrency:from_currency ?? "", toCurrency:Utility.shared.getPreferredCurrency()!, CurrencyRate:Utility.shared.currency_Dict, amount:Double(currency_amount))
                       
                       let price_value1 = Utility.shared.getCurrencyRate(basecurrency:Utility.shared.currencyvalue_from_API_base, fromCurrency:from_currency, toCurrency:Utility.shared.getPreferredCurrency()!, CurrencyRate:Utility.shared.currency_Dict, amount:Double(max_currency_amount))
                           let restricted_price =  Double(String(format: "%.2f",price_value))
                       if(Utility.shared.priceRangeArray.count != 0){
                           cell.sliderView.minValue = CGFloat(restricted_price!)
                           cell.sliderView.maxValue = CGFloat(price_value1)
                        self.minvalue = Int(restricted_price!)
                               self.maxValue = Int(price_value1)
                           cell.sliderView.selectedMinValue = Utility.shared.priceRangeArray[0] as! CGFloat
                           cell.sliderView.selectedMaxValue = Utility.shared.priceRangeArray[1] as! CGFloat
                           cell.priceshowLabel.text = "\(currencysymbol!)\(Utility.shared.priceRangeArray[0] as! Int) - \(currencysymbol!)\(Utility.shared.priceRangeArray[1] as! Int)"
                       }
                       else{
                           cell.sliderView.minValue = CGFloat(restricted_price!)
                           cell.sliderView.maxValue = CGFloat(price_value1)
                           self.minvalue = Int(restricted_price!)
                           self.maxValue = Int(price_value1)
                           cell.sliderView.selectedMinValue = CGFloat(restricted_price!)
                           cell.sliderView.selectedMaxValue = CGFloat(price_value1)
                           cell.sliderView.selectedMinValue = CGFloat(restricted_price!)
                           cell.sliderView.selectedMaxValue = CGFloat(price_value1)
                            cell.priceshowLabel.text = "\(currencysymbol!)\(Int(restricted_price!)) - \(currencysymbol!)\(Int(price_value1))"
                           
                       }
                       cell.sliderView.numberFormatter.positivePrefix = Utility.shared.getSymbol(forCurrencyCode: (Utility.shared.getPreferredCurrency()!))
                      
                   }
                   else
                   {
                       let currencysymbol = Utility.shared.getSymbol(forCurrencyCode:Utility.shared.currencyvalue_from_API_base)
                       let from_currency = (getsearchPriceArray?.priceRangeCurrency!)
                       let currency_amount = CGFloat(getsearchPriceArray?.minPrice != nil ? (getsearchPriceArray?.minPrice!)! : Double(0))
                       let max_currency_amount = CGFloat(getsearchPriceArray?.maxPrice! ?? Double(0))
                       let price_value = Utility.shared.getCurrencyRate(basecurrency:Utility.shared.currencyvalue_from_API_base, fromCurrency:from_currency ?? "", toCurrency:Utility.shared.currencyvalue_from_API_base, CurrencyRate:Utility.shared.currency_Dict, amount:Double(currency_amount))
                       let restricted_price =  Double(String(format: "%.2f",price_value))
                       var currency = String()
                        if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
                                  {
                                   currency = Utility.shared.getPreferredCurrency()!
                           
                       }
                       else
                       {
                           currency = Utility.shared.currencyvalue_from_API_base
                       }
                       let price_value1 = Utility.shared.getCurrencyRate(basecurrency:Utility.shared.currencyvalue_from_API_base, fromCurrency:from_currency ?? "", toCurrency:currency, CurrencyRate:Utility.shared.currency_Dict, amount:Double(max_currency_amount))
                       if(Utility.shared.priceRangeArray.count != 0){
                           cell.sliderView.minValue = CGFloat(price_value)
                           cell.sliderView.maxValue = CGFloat(price_value1)
                           cell.sliderView.selectedMinValue = Utility.shared.priceRangeArray[0] as! CGFloat
                           cell.sliderView.selectedMaxValue = Utility.shared.priceRangeArray[1] as! CGFloat
                           cell.priceshowLabel.text = "\(currencysymbol!)\(Utility.shared.priceRangeArray[0] as! Int) - \(currencysymbol!)\(Utility.shared.priceRangeArray[1] as! Int)"
                       }
                       else{
                           cell.sliderView.minValue = CGFloat(restricted_price!)
                           cell.sliderView.maxValue = CGFloat(price_value1)
                           cell.sliderView.selectedMinValue = CGFloat(restricted_price!)
                           cell.sliderView.selectedMaxValue = CGFloat(price_value1)
                           cell.priceshowLabel.text = "\(currencysymbol!)\(Int(restricted_price!)) - \(currencysymbol!)\(Int(price_value1))"
                           
                       }
                       cell.sliderView.numberFormatter.positivePrefix = Utility.shared.getSymbol(forCurrencyCode: (Utility.shared.currencyvalue_from_API_base))
                   }
                   
                   
                   cell.sliderView.delegate = self
                   
                   cell.sliderView.numberFormatter.maximumFractionDigits = 2
                   cell.selectionStyle = UITableViewCell.SelectionStyle.none
                   cell.sliderView.numberFormatter.numberStyle = .currency
                   cell.sliderView.minLabelFont = UIFont.boldSystemFont(ofSize:14)
                   cell.sliderView.maxLabelFont = UIFont.boldSystemFont(ofSize:14)
                   //cell.backgroundColor = UIColor.green
                   
                   return cell
               }
        else if(indexPath.section == 4){
            let cell = tableView.dequeueReusableCell(withIdentifier: "HometypeCell", for: indexPath)as! HometypeCell
           // cell.homeTypeLabel.text = homeTypeArray[indexPath.row] as? String
            cell.homeTypeLabel.text = RoomsFilterArray[0].listSettings![indexPath.row]?.itemName
            cell.homeTypeLabel.textColor =  UIColor(named: "searchPlaces_TextColor")
            cell.tag = indexPath.row+2000
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            if(roomtypeArray.contains(RoomsFilterArray[0].listSettings![indexPath.row]?.id as Any))
            {
                cell.checkBtn.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
                cell.checkBtn.tintColor = Theme.PRIMARY_COLOR
            }
            else{
                cell.checkBtn.setImage(#imageLiteral(resourceName: "uncheck"), for: .normal)
            }
            cell.checkBtn.tag = indexPath.row
            cell.checkBtn.addTarget(self, action: #selector(checkBtnTapped), for: .touchUpInside)
            return cell
            
        }
        else if(indexPath.section == 5){
            count = 0
           minCount = 0
            let cell = tableView.dequeueReusableCell(withIdentifier: "RoomsCell", for: indexPath)as! RoomsCell
            cell.roomsTitleLabel.textColor = UIColor(named: "searchPlaces_TextColor")
            if(indexPath.row == 0){
                cell.roomsTitleLabel.text = RoomsFilterArray[4].typeLabel
               
                if(!Utility.shared.showbedRoomCount) {
                   
                    
                    Utility.shared.bedrooms_count = Utility.shared.min_filter_bedroom_count
                    cell.countshowLabel.text =  String(Utility.shared.min_filter_bedroom_count)
                }
                else {
                cell.countshowLabel.text =  String(Utility.shared.bedrooms_count)
                }
                
                if cell.countshowLabel.text == String(Utility.shared.min_filter_bedroom_count){
                    cell.minusBtn.isEnabled = false
                    cell.minusBtn.alpha = 0.5
                }else{
                    cell.minusBtn.isEnabled = true
                    cell.minusBtn.alpha = 1.0
                }
                
                if cell.countshowLabel.text == String(RoomsFilterArray[4].listSettings![0]!.endValue!){
                    cell.plusBtn.isEnabled = false
                    cell.plusBtn.alpha = 0.5
                }else{
                    cell.plusBtn.isEnabled = true
                    cell.plusBtn.alpha = 1.0
                }
               // cell.countshowLabel.text =  String(Utility.shared.bedrooms_count)
            }
            else if(indexPath.row == 1){

                if(!Utility.shared.showbedCount) {
                   // Utility.shared.showbedCount = true
                    
                    Utility.shared.beds_count = Utility.shared.min_filter_bed_count
                    cell.countshowLabel.text =  String(Utility.shared.min_filter_bed_count)
                }
                else {
                cell.countshowLabel.text =  String(Utility.shared.beds_count)
                }
                
                if cell.countshowLabel.text == String(Utility.shared.min_filter_bed_count){
                    cell.minusBtn.isEnabled = false
                    cell.minusBtn.alpha = 0.5
                }else{
                    cell.minusBtn.isEnabled = true
                    cell.minusBtn.alpha = 1.0
                }
                
                if cell.countshowLabel.text == String(RoomsFilterArray[5].listSettings![0]!.endValue!){
                    cell.plusBtn.isEnabled = false
                    cell.plusBtn.alpha = 0.5
                }else{
                    cell.plusBtn.isEnabled = true
                    cell.plusBtn.alpha = 1.0
                }
                
                cell.roomsTitleLabel.text = RoomsFilterArray[5].typeLabel
               // cell.countshowLabel.text = String(Utility.shared.beds_count)
            }
            else{
               
                cell.roomsTitleLabel.text = RoomsFilterArray[7].typeLabel
                cell.countshowLabel.text =  String(Utility.shared.bathroom_count)
                
                if(!Utility.shared.showbathCount) {
                    //Utility.shared.showbathCount = true
                    
                    Utility.shared.bathroom_count = Utility.shared.min_filter_bath_count
                    cell.countshowLabel.text =  String(Utility.shared.min_filter_bath_count)
                }
                else {
                cell.countshowLabel.text =  String(Utility.shared.bathroom_count)
                }
                
                if cell.countshowLabel.text == String(Utility.shared.min_filter_bath_count){
                    cell.minusBtn.isEnabled = false
                    cell.minusBtn.alpha = 0.5
                }else{
                    cell.minusBtn.isEnabled = true
                    cell.minusBtn.alpha = 1.0
                }
                
                if cell.countshowLabel.text == String(RoomsFilterArray[7].listSettings![0]!.endValue!){
                    cell.plusBtn.isEnabled = false
                    cell.plusBtn.alpha = 0.5
                }else{
                    cell.plusBtn.isEnabled = true
                    cell.plusBtn.alpha = 1.0
                }
            }
            
            
            cell.plusBtn.layer.cornerRadius = cell.plusBtn.frame.size.width/2
            cell.plusBtn.layer.borderWidth = 1.0
            cell.plusBtn.tag = indexPath.row
            cell.minusBtn.tag = indexPath.row
            
            cell.plusBtn.removeTarget(self, action: #selector(plusBtnTapped), for: .touchUpInside)
            cell.plusBtn.addTarget(self, action: #selector(plusBtnTapped), for: .touchUpInside)
            cell.plusBtn.layer.borderColor = Theme.PRIMARY_COLOR.cgColor
            cell.minusBtn.layer.cornerRadius = cell.minusBtn.frame.size.width/2
            cell.minusBtn.layer.borderWidth = 1.0
            cell.minusBtn.layer.borderColor = Theme.PRIMARY_COLOR.cgColor
            cell.minusBtn.removeTarget(self, action: #selector(minusBtnTapped), for: .touchUpInside)
            cell.minusBtn.addTarget(self, action: #selector(minusBtnTapped), for: .touchUpInside)
            cell.tag = indexPath.row+6000
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            
            return cell

        }
        else if(indexPath.section == 6){

            let cell = tableView.dequeueReusableCell(withIdentifier: "AmenitiesCell", for: indexPath)as! AmenitiesCell
            cell.amenitieslistTile.font = UIFont(name: APP_FONT, size: 14)
            cell.amenitieslistTile.textColor  =  UIColor(named: "searchPlaces_TextColor")
            cell.checkBtn.borderWidth = 1.5
            cell.amenitieslistTile.text = RoomsFilterArray[9].listSettings![indexPath.row]?.itemName
            cell.tag = indexPath.row+3000
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.lineView.isHidden = true
            if(cell.amenitieslistTile.text!.count > 25)
            {
                cell.amenitieslistTile.frame = CGRect(x: 20, y: 5, width:250, height:70)
                cell.amenitieslistTile.numberOfLines = 2
                
            }
            else {
                cell.amenitieslistTile.frame = CGRect(x: 20, y:25, width:250, height:26)
                cell.amenitieslistTile.numberOfLines = 2
            }
            
            if let image = RoomsFilterArray[9].listSettings![indexPath.row]?.image{
                cell.amenitiesImgIcon.sd_setImage(with: URL(string:"\(amenitiesIcons)\(String(describing: image))"),placeholderImage: UIImage(named: "amenitiesImage"))
            }else{
                cell.amenitiesImgIcon.image = UIImage(named: "amenitiesImage")
            }
            if(amenitiesArray.contains(RoomsFilterArray[9].listSettings![indexPath.row]?.id as Any))
            {
                
                cell.checkBtn.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
                cell.checkBtn.tintColor = Theme.PRIMARY_COLOR
            }
            else{
                cell.checkBtn.setImage(#imageLiteral(resourceName: "uncheck"), for: .normal)
            }
            cell.checkBtn.tag = indexPath.row
            cell.checkBtn.isUserInteractionEnabled = false
            cell.checkBtn.addTarget(self, action: #selector(amenitiescheckBtnTapped(_:)), for: .touchUpInside)
            return cell
            
        }
        else if(indexPath.section == 7){

            let cell = tableView.dequeueReusableCell(withIdentifier: "FacilitiesCell", for: indexPath)as! FacilitiesCell
            cell.amenitieslistTile.textColor  =  UIColor(named: "searchPlaces_TextColor")
            cell.amenitieslistTile.text = RoomsFilterArray[11].listSettings![indexPath.row]?.itemName
            cell.tag = indexPath.row+4000
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            if(cell.amenitieslistTile.text!.count > 25)
            {
                cell.amenitieslistTile.frame = CGRect(x: 20, y: 5, width:250, height:60)
                cell.amenitieslistTile.numberOfLines = 2
                
            }
            else {
                cell.amenitieslistTile.frame = CGRect(x: 20, y:25, width:250, height:26)
                cell.amenitieslistTile.numberOfLines = 2
            }
            if(facilitiesArray.contains(RoomsFilterArray[11].listSettings![indexPath.row]?.id as Any))
            {
                 cell.checkBtn.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
                    cell.checkBtn.tintColor = Theme.PRIMARY_COLOR
            }
            else{
                cell.checkBtn.setImage(#imageLiteral(resourceName: "uncheck"), for: .normal)
            }
            cell.checkBtn.tag = indexPath.row
            cell.checkBtn.isUserInteractionEnabled = false
            cell.checkBtn.addTarget(self, action: #selector(facilitiescheckBtnTapped(_:)), for: .touchUpInside)
            return cell
        }
  
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HouseRulesCell", for: indexPath)as! HouseRulesCell
            cell.amenitieslistTile.textColor  =  UIColor(named: "searchPlaces_TextColor")
            cell.amenitieslistTile.text = RoomsFilterArray[13].listSettings![indexPath.row]?.itemName
            cell.tag = indexPath.row+5000
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            if(cell.amenitieslistTile.text!.count > 25)
            {
                cell.amenitieslistTile.frame = CGRect(x: 20, y: 5, width:250, height:60)
                cell.amenitieslistTile.numberOfLines = 2
                
            }
            else {
                cell.amenitieslistTile.frame = CGRect(x: 20, y:25, width:250, height:26)
                cell.amenitieslistTile.numberOfLines = 2
            }
            if(housingRulesArray.contains(RoomsFilterArray[13].listSettings![indexPath.row]?.id as Any))
            {
                 cell.checkBtn.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
                 cell.checkBtn.tintColor = Theme.PRIMARY_COLOR
            }
            else{
                 cell.checkBtn.setImage(#imageLiteral(resourceName: "uncheck"), for: .normal)
            }
            cell.checkBtn.tag = indexPath.row
            cell.checkBtn.isUserInteractionEnabled = false
            cell.checkBtn.addTarget(self, action: #selector(houseRulescheckBtnTapped(_:)), for: .touchUpInside)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if (indexPath.section == 0) {
            Utility.shared.isfromcheckingPage = false
            let datePickerViewController = AirbnbDatePickerViewController(dateFrom: selectedStartDate, dateTo: selectedEndDate)
            datePickerViewController.isFromFilter = true
            datePickerViewController.delegate = self
            let navigationController = UINavigationController(rootViewController: datePickerViewController)
            navigationController.modalPresentationStyle = .fullScreen
            self.present(navigationController, animated: true, completion: nil)
        }
        
        else if((indexPath.section == 1) || (indexPath.section == 2) || (indexPath.section == 3) || (indexPath.section == 5))
        {
            print("clicked")
        }
        else if(indexPath.section == 4)
        {
            let cell = view.viewWithTag(indexPath.row + 2000) as? HometypeCell
           // if(cell?.checkBtn.currentImage == #imageLiteral(resourceName: "checked")){
                
                if(roomtypeArray.contains(RoomsFilterArray[0].listSettings![indexPath.row]?.id as Any))
                {
                     roomtypeArray.remove(RoomsFilterArray[0].listSettings![indexPath.row]?.id as Any)
               // }
                cell?.checkBtn.setImage(#imageLiteral(resourceName: "uncheck"), for: .normal)
            }
            else{

                    roomtypeArray.add(RoomsFilterArray[0].listSettings![indexPath.row]?.id as Any)
           
               cell?.checkBtn.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
                          cell?.checkBtn.tintColor = Theme.PRIMARY_COLOR
            }
            let indexPath = IndexPath(row:indexPath.row, section: 4)
            filterTV.reloadRows(at: [indexPath], with: .none)
            
        }
        else if(indexPath.section == 6){
           let cell = view.viewWithTag(indexPath.row + 3000) as? AmenitiesCell
            //if(cell?.checkBtn.currentImage == #imageLiteral(resourceName: "checked")){
                if(amenitiesArray.contains(RoomsFilterArray[9].listSettings![indexPath.row]?.id as Any))
                {
                   amenitiesArray.remove(RoomsFilterArray[9].listSettings![indexPath.row]?.id as Any)
               // }
                cell?.checkBtn.setImage(#imageLiteral(resourceName: "uncheck"), for: .normal)
            }
            else{
                
                
                  amenitiesArray.add(RoomsFilterArray[9].listSettings![indexPath.row]?.id as Any)
               
                 cell?.checkBtn.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
                cell?.checkBtn.tintColor = Theme.PRIMARY_COLOR
            }
            let indexPath = IndexPath(row:indexPath.row, section: 6)
            filterTV.reloadRows(at: [indexPath], with: .none)
        }
        else if(indexPath.section == 7){
            let cell = view.viewWithTag(indexPath.row + 4000) as? FacilitiesCell
            //if(cell?.checkBtn.currentImage == #imageLiteral(resourceName: "checked")){
                if(facilitiesArray.contains(RoomsFilterArray[11].listSettings![indexPath.row]?.id as Any))
                {
                    facilitiesArray.remove(RoomsFilterArray[11].listSettings![indexPath.row]?.id as Any)
              //  }
                cell?.checkBtn.setImage(#imageLiteral(resourceName: "uncheck"), for: .normal)
            }
            else{
                
                
                    facilitiesArray.add(RoomsFilterArray[11].listSettings![indexPath.row]?.id as Any)
                
                cell?.checkBtn.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
                cell?.checkBtn.tintColor = Theme.PRIMARY_COLOR
            }
            let indexPath = IndexPath(row:indexPath.row, section: 7)
            filterTV.reloadRows(at: [indexPath], with: .none)
        }
        else {
            
            let cell = view.viewWithTag(indexPath.row + 5000) as? HouseRulesCell
           // if(cell?.checkBtn.currentImage == #imageLiteral(resourceName: "checked")){
                if(housingRulesArray.contains(RoomsFilterArray[13].listSettings![indexPath.row]?.id as Any))
                {
                    housingRulesArray.remove(RoomsFilterArray[13].listSettings![indexPath.row]?.id as Any)
               // }
                cell?.checkBtn.setImage(#imageLiteral(resourceName: "uncheck"), for: .normal)
            }
            else{
                
                
                    housingRulesArray.add(RoomsFilterArray[13].listSettings![indexPath.row]?.id as Any)
                
                 cell?.checkBtn.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
                    cell?.checkBtn.tintColor = Theme.PRIMARY_COLOR
            }
            let indexPath = IndexPath(row:indexPath.row, section: indexPath.section)
            filterTV.reloadRows(at: [indexPath], with: .none)
        }
    }
    
    @objc func showDatePicker() {
        Utility.shared.isfromcheckingPage = false
        let datePickerViewController = AirbnbDatePickerViewController(dateFrom: selectedStartDate, dateTo: selectedEndDate)
        datePickerViewController.isFromFilter = true

        datePickerViewController.delegate = self
        let navigationController = UINavigationController(rootViewController: datePickerViewController)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
    
    
    func datePickerController(_ datePickerController: AirbnbDatePickerViewController, didSaveStartDate startDate: Date?, endDate: Date?) {
       
        
        selectedStartDate = startDate
        selectedEndDate = endDate
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
       
        if(startDate != nil && endDate != nil){
         Utility.shared.selectedstartDate = (dateFormatterGet.string(from: startDate!))
        Utility.shared.selectedEndDate = (dateFormatterGet.string(from: endDate!))
        }
        else
        {
             Utility.shared.selectedstartDate = ""
            Utility.shared.selectedEndDate = ""
        }
        
        if selectedStartDate == nil && selectedEndDate == nil {
            
        } else {
            
                
            }
            
        self.filterTV.reloadData()
        }
    
    
    
    @objc func checkBtnTapped(_ sender: UIButton)
    {
        
        let cell = view.viewWithTag(sender.tag + 2000) as? HometypeCell
      //  if(cell?.checkBtn.currentImage == #imageLiteral(resourceName: "checked")){
            if(roomtypeArray.contains(RoomsFilterArray[0].listSettings![sender.tag]?.id as Any))
            {
                roomtypeArray.remove(RoomsFilterArray[0].listSettings![sender.tag]?.id as Any)
                cell?.checkBtn.setImage(#imageLiteral(resourceName: "uncheck"), for: .normal)
            }
            
        //}
        else{
            
                roomtypeArray.add(RoomsFilterArray[0].listSettings![sender.tag]?.id as Any)
            
           cell?.checkBtn.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            cell?.checkBtn.tintColor = Theme.PRIMARY_COLOR
        }
    }
    
    @objc func amenitiescheckBtnTapped(_ sender: UIButton)
    {
        
        let cell = view.viewWithTag(sender.tag + 3000) as? AmenitiesCell
       // if(cell?.checkBtn.currentImage == #imageLiteral(resourceName: "checked")){
            if(amenitiesArray.contains(RoomsFilterArray[9].listSettings![sender.tag]?.id as Any))
            {
                amenitiesArray.remove(RoomsFilterArray[9].listSettings![sender.tag]?.id as Any)
           // }
            cell?.checkBtn.setImage(#imageLiteral(resourceName: "uncheck"), for: .normal)
        }
        else{
            
            amenitiesArray.add(RoomsFilterArray[9].listSettings![sender.tag]?.id as Any)
            
             cell?.checkBtn.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
                       cell?.checkBtn.tintColor = Theme.PRIMARY_COLOR
        }
        let indexPath = IndexPath(row:sender.tag, section: 6)
        filterTV.reloadRows(at: [indexPath], with: .none)
    }
    
    @objc func facilitiescheckBtnTapped(_ sender: UIButton)
    {
        let cell = view.viewWithTag(sender.tag + 4000) as? FacilitiesCell
       // if(cell?.checkBtn.currentImage == #imageLiteral(resourceName: "checked")){
            if(facilitiesArray.contains(RoomsFilterArray[11].listSettings![sender.tag]?.id as Any))
            {
                facilitiesArray.remove(RoomsFilterArray[11].listSettings![sender.tag]?.id as Any)
            //}
            cell?.checkBtn.setImage(#imageLiteral(resourceName: "uncheck"), for: .normal)
        }
        else{
            
               facilitiesArray.add(RoomsFilterArray[11].listSettings![sender.tag]?.id as Any)
            
             cell?.checkBtn.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
                       cell?.checkBtn.tintColor = Theme.PRIMARY_COLOR
        }
        
    }
    
    @objc func houseRulescheckBtnTapped(_ sender: UIButton)
    {
        let cell = view.viewWithTag(sender.tag + 5000) as? HouseRulesCell
      //  if(cell?.checkBtn.currentImage == #imageLiteral(resourceName: "checked")){
            if(housingRulesArray.contains(RoomsFilterArray[13].listSettings![sender.tag]?.id as Any))
            {
                housingRulesArray.remove(RoomsFilterArray[13].listSettings![sender.tag]?.id as Any)
           // }
            cell?.checkBtn.setImage(#imageLiteral(resourceName: "uncheck"), for: .normal)
        }
        else{
            
            
           housingRulesArray.add(RoomsFilterArray[13].listSettings![sender.tag]?.id as Any)
           cell?.checkBtn.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
                       cell?.checkBtn.tintColor = Theme.PRIMARY_COLOR
        }
        
    }
    @objc func addBtnTapped(_ sender: UIButton){
         let btnsendtag: UIButton = sender
        
        if(btnsendtag.tag == 6){
        if(isShowmoreClicked){
            isShowmoreClicked = false
        }
        else {
            isShowmoreClicked = true
            
        }
        }
        else if(btnsendtag.tag == 4){
        if(isHomeTypeClicked){
            isHomeTypeClicked = false
        }
        else {
            isHomeTypeClicked = true
            
        }
        }
        else if(btnsendtag.tag == 7){
            if(isfacilitiesmoreClicked){
                isfacilitiesmoreClicked = false
            }
            else {
                isfacilitiesmoreClicked = true
                
            }
        }
        else if(btnsendtag.tag == 8)
        {
            if(ishousemoreClicked){
                ishousemoreClicked = false
            }
            else {
                ishousemoreClicked = true
                
            }
        }
  
        
//        filterTV.reloadData()
        filterTV.reloadSections([btnsendtag.tag], with: .fade)
       //  isShowmoreClicked = !isShowmoreClicked
        
    }
    
    @objc func switchToggled(_ sender:UISwitch) {
        
        
        let cell = view.viewWithTag(sender.tag + 8000) as! InstantBookCell
        
        cell.lotSwitch.setOn(!sender.isOn, animated: false)
        if(cell.lotSwitch.isOn){
            cell.lotSwitch.isOn = false
            isSwitchEnable = false
        }
        else{
            cell.lotSwitch.isOn = true
            isSwitchEnable = true
        }
        
      //  self.lotSwitch.setOn(!value.isOn, animated: false)
        
        
    }
    
    @objc func plusBtnTapped(_ sender: UIButton){
        
        if(sender.tag == (sender.tag + 6001)) {
            let cell = view.viewWithTag(sender.tag + 6000) as! RoomsCell
            count = Int(cell.countshowLabel.text!)!
            count += 1
            if(sender.tag == 0){
                Utility.shared.showbedRoomCount = true
                maxCount = RoomsFilterArray[4].listSettings![0]!.endValue!
            }
            else if(sender.tag == 1)
            {
                Utility.shared.showbedCount = true
                maxCount = RoomsFilterArray[5].listSettings![0]!.endValue!
            }
            else if(sender.tag == (sender.tag + 6001)){
                maxCount = Utility.shared.maximum_guest_count
            }
            else{
                Utility.shared.showbathCount = true
                maxCount = RoomsFilterArray[7].listSettings![0]!.endValue!
            }
            
            if count < maxCount {
                if((count >= minCount) && (count <= maxCount)){
                    cell.minusBtn.isEnabled = true
                    cell.minusBtn.alpha = 1
                    cell.countshowLabel.text = String(count)
                    if(sender.tag == 0){
                    Utility.shared.bedrooms_count = count
                    }
                    else if(sender.tag == 1)
                    {
                        Utility.shared.beds_count = count
                    }
                    else if(sender.tag == (sender.tag + 6001)) {
                        Utility.shared.filterCount = count
                    }
                    else{
                      Utility.shared.bathroom_count = count
                    }
                    
                }
                cell.plusBtn.isEnabled = true
                cell.plusBtn.alpha = 1
                cell.countshowLabel.text = String(count)
                if(sender.tag == 0){
                    Utility.shared.bedrooms_count = count
                }
                else if(sender.tag == 1)
                {
                    Utility.shared.beds_count = count
                }
                else if(sender.tag == (sender.tag + 6001)) {
                    Utility.shared.filterCount = count
                }
                else{
                    Utility.shared.bathroom_count = count
                }
                
               
            }
          else {
          if((count >= minCount) && (count <= maxCount)){
          cell.minusBtn.isEnabled = true
          cell.minusBtn.alpha = 1
          cell.countshowLabel.text = String(count)
            
            if(sender.tag == 0){
                Utility.shared.bedrooms_count = count
            }
            else if(sender.tag == 1)
            {
                Utility.shared.beds_count = count
            }
              else if(sender.tag == (sender.tag + 6001)) {
                  Utility.shared.filterCount = count
              }
            else{
                Utility.shared.bathroom_count = count
            }
             }
        
                cell.plusBtn.isEnabled = false
                cell.plusBtn.alpha = 0.5
            }
            
        }
        
        else {
        let cell = view.viewWithTag(sender.tag + 6000) as! RoomsCell
        count = Int(cell.countshowLabel.text!)!
        count += 1
        if(sender.tag == 0){
            Utility.shared.showbedRoomCount = true
            maxCount = RoomsFilterArray[4].listSettings![0]!.endValue!
        }
        else if(sender.tag == 1)
        {
            Utility.shared.showbedCount = true
            maxCount = RoomsFilterArray[5].listSettings![0]!.endValue!
        }
        else if(sender.tag == (sender.tag + 6001)){
            maxCount = Utility.shared.maximum_guest_count
        }
        else{
            Utility.shared.showbathCount = true
            maxCount = RoomsFilterArray[7].listSettings![0]!.endValue!
        }
        
        if count < maxCount {
            if((count >= minCount) && (count <= maxCount)){
                cell.minusBtn.isEnabled = true
                cell.minusBtn.alpha = 1
                cell.countshowLabel.text = String(count)
                if(sender.tag == 0){
                Utility.shared.bedrooms_count = count
                }
                else if(sender.tag == 1)
                {
                    Utility.shared.beds_count = count
                }
                else if(sender.tag == (sender.tag + 6001)) {
                    Utility.shared.filterCount = count
                }
                else{
                  Utility.shared.bathroom_count = count
                }
                
            }
            cell.plusBtn.isEnabled = true
            cell.plusBtn.alpha = 1
            cell.countshowLabel.text = String(count)
            if(sender.tag == 0){
                Utility.shared.bedrooms_count = count
            }
            else if(sender.tag == 1)
            {
                Utility.shared.beds_count = count
            }
            else if(sender.tag == (sender.tag + 6001)) {
                Utility.shared.filterCount = count
            }
            else{
                Utility.shared.bathroom_count = count
            }
            
           
        }
      else {
      if((count >= minCount) && (count <= maxCount)){
      cell.minusBtn.isEnabled = true
      cell.minusBtn.alpha = 1
      cell.countshowLabel.text = String(count)
        
        if(sender.tag == 0){
            Utility.shared.bedrooms_count = count
        }
        else if(sender.tag == 1)
        {
            Utility.shared.beds_count = count
        }
          else if(sender.tag == (sender.tag + 6001)) {
              Utility.shared.filterCount = count
          }
        else{
            Utility.shared.bathroom_count = count
        }
         }
    
            cell.plusBtn.isEnabled = false
            cell.plusBtn.alpha = 0.5
        }
        }
      //  filterTV.reloadData()
    }
    @objc func minusBtnTapped(_ sender: UIButton){
        if(sender.tag == (sender.tag + 6001)) {
            let cell = view.viewWithTag(sender.tag + 6000) as! RoomsCell
            count = Int(cell.countshowLabel.text!)!
             count -= 1
            cell.plusBtn.isEnabled = true
            cell.plusBtn.alpha = 1
            if(sender.tag == 0){
                maxCount = 0
            }
            else if(sender.tag == 1)
            {
                maxCount = 0
            }
//            else if(sender.tag == (sender.tag + 6001)) {
//                maxCount = Utility.shared.min_filter_guest_count
//            }
            else{
                maxCount = 0
            }
            
            if count > maxCount {
                if(count <= maxCount){
                    cell.minusBtn.isEnabled = true
                    cell.minusBtn.alpha = 1
                    cell.countshowLabel.text = String(count)
                    if(sender.tag == 0){
                        Utility.shared.bedrooms_count = count
                    }
                    else if(sender.tag == 1)
                    {
                        Utility.shared.beds_count = count
                    }
                    else if(sender.tag == (sender.tag + 6001)) {
                        Utility.shared.filterCount = count
                    }
                    else{
                        Utility.shared.bathroom_count = count
                    }
                }
                cell.minusBtn.isEnabled = true
                cell.minusBtn.alpha = 1
                cell.countshowLabel.text = String(count)
                if(sender.tag == 0){
                    Utility.shared.bedrooms_count = count
                }
                else if(sender.tag == 1)
                {
                    Utility.shared.beds_count = count
                }
                else if(sender.tag == (sender.tag + 6001)) {
                    Utility.shared.filterCount = count
                }
                else{
                    Utility.shared.bathroom_count = count
                }
            }
            
            else {

                cell.countshowLabel.text = String(count)
                if(sender.tag == 0){
                    Utility.shared.bedrooms_count = count
                }
                else if(sender.tag == 1)
                {
                    Utility.shared.beds_count = count
                }
                else if(sender.tag == (sender.tag + 6001)) {
                    Utility.shared.filterCount = count
                }
                else{
                    Utility.shared.bathroom_count = count
                }
                
                cell.minusBtn.isEnabled = false
                cell.minusBtn.alpha = 0.5
            }
        }
        
        else {
        let cell = view.viewWithTag(sender.tag + 6000) as! RoomsCell
        count = Int(cell.countshowLabel.text!)!
         count -= 1
        cell.plusBtn.isEnabled = true
        cell.plusBtn.alpha = 1
        if(sender.tag == 0){
            maxCount = 0
        }
        else if(sender.tag == 1)
        {
            maxCount = 0
        }
        else if(sender.tag == (sender.tag + 6001)) {
            maxCount = Utility.shared.min_filter_guest_count
        }
        else{
            maxCount = 0
        }
        
        if count > maxCount {
            if(count <= maxCount){
                cell.minusBtn.isEnabled = true
                cell.minusBtn.alpha = 1
                cell.countshowLabel.text = String(count)
                if(sender.tag == 0){
                    Utility.shared.bedrooms_count = count
                }
                else if(sender.tag == 1)
                {
                    Utility.shared.beds_count = count
                }
                else if(sender.tag == (sender.tag + 6001)) {
                    Utility.shared.filterCount = count
                }
                else{
                    Utility.shared.bathroom_count = count
                }
            }
            cell.minusBtn.isEnabled = true
            cell.minusBtn.alpha = 1
            cell.countshowLabel.text = String(count)
            if(sender.tag == 0){
                Utility.shared.bedrooms_count = count
            }
            else if(sender.tag == 1)
            {
                Utility.shared.beds_count = count
            }
            else if(sender.tag == (sender.tag + 6001)) {
                Utility.shared.filterCount = count
            }
            else{
                Utility.shared.bathroom_count = count
            }
        }
        
        else {
            cell.countshowLabel.text = String(count)
            if(sender.tag == 0){
                Utility.shared.bedrooms_count = count
            }
            else if(sender.tag == 1)
            {
                Utility.shared.beds_count = count
            }
            else if(sender.tag == (sender.tag + 6001)) {
                Utility.shared.filterCount = count
            }
            else{
                Utility.shared.bathroom_count = count
            }
            cell.minusBtn.isEnabled = false
            cell.minusBtn.alpha = 0.5
        }
        }
//filterTV.reloadData()
    }
    
    
    
    @objc func plusBtnTappedFilter(_ sender: UIButton){
        
        if(sender.tag == 1) {
            let cell = view.viewWithTag(sender.tag + 8000) as! RoomsCell
            count = Int(cell.countshowLabel.text!)!
            count += 1
            Utility.shared.showGuestCount = true
                maxCount = Utility.shared.maximum_guest_count
           
            if count < maxCount {
                if((count >= minCount) && (count <= maxCount)){
                    cell.minusBtn.isEnabled = true
                    cell.minusBtn.alpha = 1
                    cell.countshowLabel.text = String(count)
                   
                        Utility.shared.filterCount = count
                  
                }
                cell.plusBtn.isEnabled = true
                cell.plusBtn.alpha = 1
                cell.countshowLabel.text = String(count)
               
                    Utility.shared.filterCount = count
               
               
            }
          else {
          if((count >= minCount) && (count <= maxCount)){
          cell.minusBtn.isEnabled = true
          cell.minusBtn.alpha = 1
          cell.countshowLabel.text = String(count)
            
           
                  Utility.shared.filterCount = count
             
             }
        
                cell.plusBtn.isEnabled = false
                cell.plusBtn.alpha = 0.5
            }
            
        }
        
      
      //  filterTV.reloadData()
    }
    @objc func minusBtnTappedFilter(_ sender: UIButton){
        if(sender.tag == 1) {
            let cell = view.viewWithTag(sender.tag + 8000) as! RoomsCell
            count = Int(cell.countshowLabel.text!)!
             count -= 1
            cell.plusBtn.isEnabled = true
            cell.plusBtn.alpha = 1
            
                maxCount = Utility.shared.min_filter_guest_count
           
            
            if count > maxCount {
                if(count <= maxCount){
                    cell.minusBtn.isEnabled = true
                    cell.minusBtn.alpha = 1
                    cell.countshowLabel.text = String(count)
                   
                        Utility.shared.filterCount = count
                   
                }
                cell.minusBtn.isEnabled = true
                cell.minusBtn.alpha = 1
                cell.countshowLabel.text = String(count)
               
                    Utility.shared.filterCount = count
               
            }
            
            else {

                cell.countshowLabel.text = String(count)
                  
                 
                        Utility.shared.filterCount = count
                
                cell.minusBtn.isEnabled = false
                cell.minusBtn.alpha = 0.5
            }
        }
        
    
//filterTV.reloadData()
    }
    @objc func sliderValueChanged(_ sender: Any) {
//        let cell = view.viewWithTag((sender as AnyObject).tag + 9000) as! PriceRangeCell
//        let value = (sender as AnyObject).value
//        cell.priceLabel.text = "$\(value)"

    }
    
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        Utility.shared.priceRangeArray.removeAllObjects()
        let cell = view.viewWithTag(9000) as! PriceRangeCell
        var symbol = ""
        if(Utility.shared.getPreferredCurrency() != nil && Utility.shared.getPreferredCurrency() != "")
        {
            symbol = Utility.shared.getSymbol(forCurrencyCode: (Utility.shared.getPreferredCurrency()!))!
        }else{
            symbol = Utility.shared.getSymbol(forCurrencyCode: (Utility.shared.currencyvalue_from_API_base))!
        }
        let minimumvalue = Int(minValue)
        let maximumvalue = Int(maxValue)
        cell.priceshowLabel.text = "\(symbol)\(Int(minimumvalue)) - \(symbol)\(Int(maximumvalue))"
        
         if(minimumvalue > self.minvalue || maximumvalue < self.maxValue)
               {
               Utility.shared.priceRangeArray.add(minimumvalue)
               Utility.shared.priceRangeArray.add(maximumvalue)
               }
        
//        let indexPaths = IndexPath(item: 0, section: 3)
//              filterTV.reloadRows(at: [indexPaths], with: .none)
        
       // filterTV.reloadData()
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

@IBDesignable

class UISwitchCustom: UISwitch {
    @IBInspectable var OffTint: UIColor? {
        didSet {
            self.tintColor = OffTint
            self.layer.cornerRadius = 16
            self.backgroundColor = OffTint
        }
    }
    
    @IBInspectable var onthumbTintImage: UIImage? {
        didSet {
            self.layer.cornerRadius = 16
            self.thumbTintColor = UIColor(patternImage: onthumbTintImage!)
            self.onImage = onthumbTintImage
            self.layer.masksToBounds = true
            
            //self.backgroundColor = OffTint
        }
    }
    
    
}

