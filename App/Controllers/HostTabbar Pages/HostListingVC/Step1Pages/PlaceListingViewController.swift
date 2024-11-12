//  PlaceListingViewController.swift
//  App

//  Created by RadicalStart on 26/07/19.
//  Copyright © 2019 RADICAL START. All rights reserved.


import UIKit
import Lottie
import SwiftMessages


protocol PlaceListingViewControllerDelegate {
    func total_guest_change(guestcount:String)
    func guestroom_detail(roomdetail:String)
}

class PlaceListingViewController: BaseHostTableviewController,GuestListingViewControllerDelegate {
    func toatalguests(guest: String) {
        total_guest_count = guest
    }
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var curvedView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var offlineUIView: UIView!
    @IBOutlet weak var saveAndExit: UIButton!
    @IBOutlet weak var retryButn: UIButton!
    
    @IBOutlet weak var viewBedAndBath: UIView!
    @IBOutlet weak var lblHowManyBedsCanGuestUse: UILabel!
    @IBOutlet weak var imgBath: UIImageView!
    @IBOutlet weak var imgBed: UIImageView!
    @IBOutlet weak var lblBath: UILabel!
    @IBOutlet weak var lblBed: UILabel!
    
    @IBOutlet weak var btnBathMinus: UIButton!
    @IBOutlet weak var btnBathPlus: UIButton!
    @IBOutlet weak var btnBedMinus: UIButton!
    @IBOutlet weak var btnBedPlus: UIButton!
    @IBOutlet weak var btnBBAdd: UIButton!
    @IBOutlet weak var btnBBCancel: UIButton!

    @IBOutlet weak var lblBathroomCount: UILabel!
    @IBOutlet weak var lblBedroomCount: UILabel!

    @IBOutlet weak var viewBedBathBG: UIView!
    
    var MaxBedCount:Int = 0
    
    @IBOutlet var bottomView: UIView!
    @IBOutlet var progressViewWidth: NSLayoutConstraint!
    
    @IBOutlet weak var progressBGView: UIView!
    @IBOutlet weak var currentProgressView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    //MARK: - This Property
    var houseLabel = String()
    var roomTypeLbl = String()
    var buildingSizeLbl = String()
    var personalType = String()
    var houseTypeArray = [String]()
    var roomTypeArray = [String]()
    var buildingSizeArray = [String]()
    var staticArray = [String]()
    var inputPickerView = UIView()
    var pickerView = UIPickerView()
    var lottieView1: LottieAnimationView!
    var total_guest_count = String()
    var buildidArray = [String]()
    
    var delegatePlaceListing:PlaceListingViewControllerDelegate!
    
    @IBOutlet weak var stepsTitleView: BecomeStepCollectionView!
    @IBOutlet weak var stepTitleheightConstaraint: NSLayoutConstraint!
    @IBOutlet weak var stepTitleTopConstraint: NSLayoutConstraint!
    //MARK: - Viewcontroller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "becomeAHostStep_Color")
        tableView.backgroundColor =  UIColor(named: "colorController")
        bottomView.backgroundColor =  UIColor(named: "colorController")
        curvedView.backgroundColor = UIColor(named: "colorController")
        nextBtn.backgroundColor = Theme.Button_BG
        saveAndExit.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
      
        self.backBtn.setImage(UIImage(named: "left_arrow"), for: .normal)
        self.backBtn.setTitle("", for: .normal)
        self.backBtn.backgroundColor = UIColor.white
        self.backBtn.layer.cornerRadius = self.backBtn.frame.size.height/2
        self.backBtn.clipsToBounds = true
        
        if Utility.shared.isRTLLanguage(){
            self.backBtn.rotateImageViewofBtn()
        }
        
        self.titleLabel.text = "\(Utility.shared.getLanguage()?.value(forKey: "Ready_Host") ?? "Hi! Lets get you ready to become a host.")"
        self.titleLabel.textColor = UIColor(named: "Title_Header")
        self.titleLabel.font = UIFont(name: APP_FONT_SEMIBOLD, size: 24.0)
        self.titleLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        
        progressBGView.backgroundColor = Theme.becomeAHostProgressBG_Color
        currentProgressView.backgroundColor = Theme.PRIMARY_COLOR
        
        self.curvedView.layer.borderColor = Theme.becomeAHostBorder_Color.cgColor
        self.curvedView.layer.borderWidth = 0.5
        self.curvedView.layer.cornerRadius = 20.0
        self.curvedView.clipsToBounds = true
        
        self.stepsTitleView.whichStep = 1
        
        self.stepsTitleView.selectedViewIndex = 0
       
        self.stepsTitleView.delegateSteps = self
       
        viewBedAndBath.isHidden = true
        viewBedBathBG.isHidden = true
        // Add tap gesture recognizer to dismiss when tapping outside of the pop-up
//  let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOutside))
//  self.viewBedBathBG.addGestureRecognizer(tapGesture)
        updateLabels()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.stepsTitleView.toBeCheck()
        progressViewWidth.constant = ((self.view.frame.width/7) * CGFloat((self.stepsTitleView.selectedViewIndex + 1)))
    }
    
    override func setUpUI() {
        if(Utility.shared.step1_inactivestatus == "inactive" || Utility.shared.step1_inactivestatus == "")
        {
            saveAndExit.isHidden = true
            self.stepsTitleView.isHidden = true
            self.stepTitleheightConstaraint.constant = 0
            self.stepTitleTopConstraint.constant = 0
        }
        else {
            saveAndExit.isHidden = false
            self.stepsTitleView.isHidden = false
            self.stepTitleheightConstaraint.constant = 50
            self.stepTitleTopConstraint.constant = 5
        }
        offlineUIView.isHidden = true
        callListingSettingsAPI(oflineView: offlineUIView, nextButton: nextBtn)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 10))
        nextBtn.setTitle("\(Utility.shared.getLanguage()?.value(forKey: "next")as! String)", for: .normal)
        nextBtn.setTitleColor(UIColor.white, for: .normal)
        nextBtn.layer.cornerRadius = nextBtn.frame.size.height/2
        nextBtn.clipsToBounds = true
        self.tableView.isHidden = false
        lottieView1 = LottieAnimationView.init(name: "animation")
        saveAndExit.setTitle("\(Utility.shared.getLanguage()?.value(forKey:"SaveExit") ?? "Save & Exit")", for:.normal)
        errorLabel.textColor =  UIColor(named: "Title_Header")
        retryButn.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        errorLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"error_field"))!)"
        retryButn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"retry"))!)", for:.normal)
        saveAndExit.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 14)
        saveAndExit.contentHorizontalAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        nextBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
        errorLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 15)
               retryButn.titleLabel?.font = UIFont(name: APP_FONT, size: 15)
    }
   
    override func setDropdownList() {
        
        setHouseType()
        setRoomType()
        setbuildingSize()
        setResidenceType()
        
        tableView.reloadData()
    }
    
    // Update the labels with current values
    func updateLabels() {
        btnBathMinus.setTitle("", for: .normal)
        btnBathPlus.setTitle("", for: .normal)
        btnBedMinus.setTitle("", for: .normal)
        btnBedPlus.setTitle("", for: .normal)
        lblBathroomCount.text = "\(Utility.shared.bathcount)"
        lblBedroomCount.text = "\(Utility.shared.bedcount)"
    }
    
//    // Function to dismiss the view when tapping outside the pop-up
//    @objc func didTapOutside(_ sender: UITapGestureRecognizer) {
//        let location = sender.location(in: self.view)
//        viewBedBathBG.isHidden = true
//        viewBedAndBath.isHidden = true
//    }

    func setHouseType()
    {
        let listSettings = (Utility.shared.getListSettingsArray?.houseType?.listSettings!)!
        for item in listSettings
        {
            houseTypeArray.append((item?.itemName)!)
        }
        if !Utility.shared.step1ValuesInfo.keys.contains("houseType")
        {
            houseLabel = houseTypeArray.first != nil ? houseTypeArray.first! : ""
            pickerView.selectRow(0, inComponent: 0, animated: true)
            Utility.shared.step1ValuesInfo.updateValue(listSettings.count > 0 ? ((listSettings[0]?.id)!) : 0, forKey: "houseType")
        }else {
            _ = listSettings.filter({ (item) -> Bool in
                if (Utility.shared.step1ValuesInfo["houseType"]! as? Int) == item?.id
                {
                    houseLabel = (item?.itemName!)!
                    return true
                }else{
                    return false
                }
            })
            if !houseLabel.isEmpty
            {
                let index = houseTypeArray.firstIndex(where: { (item) -> Bool in
                    item == houseLabel
                })
                pickerView.selectRow(index != nil ? index! : 0, inComponent: 0, animated: true)
            } else {
                houseLabel = houseTypeArray.first != nil ? houseTypeArray.first! : ""
                pickerView.selectRow(0, inComponent: 0, animated: true)
                
                Utility.shared.step1ValuesInfo.updateValue(listSettings.count > 0 ? ((listSettings[0]?.id)!) : 0, forKey: "houseType")
            }
        }
    }
    
    override func setRoomType() {
        let roomTypeListSettings = (Utility.shared.getListSettingsArray?.roomType?.listSettings!)!
        for item in roomTypeListSettings
        {
            roomTypeArray.append((item?.itemName)!)
        }
        if !Utility.shared.step1ValuesInfo.keys.contains("roomType")
        {
            roomTypeLbl = roomTypeArray.first != nil ? roomTypeArray.first! : ""
            pickerView.selectRow(0, inComponent: 0, animated: true)
            Utility.shared.step1ValuesInfo.updateValue(roomTypeListSettings.count > 0 ? (roomTypeListSettings[0]?.id)! : 0, forKey: "roomType")
        }else {
            for item in roomTypeListSettings{
                if let type = (Utility.shared.step1ValuesInfo["roomType"]! as? Int)
                {
                    if type == item?.id
                    {
                        roomTypeLbl = (item?.itemName!)!
                    }
                }
            }
            if !roomTypeLbl.isEmpty
            {
                let index = roomTypeArray.firstIndex(where: { (item) -> Bool in
                    item == roomTypeLbl
                })
                pickerView.selectRow(index != nil ? index! : 0, inComponent: 0, animated: true)
            } else {
                roomTypeLbl = roomTypeArray.first != nil ? roomTypeArray.first! : ""
                pickerView.selectRow(0, inComponent: 0, animated: true)
                Utility.shared.step1ValuesInfo.updateValue(roomTypeListSettings.count > 0 ? (roomTypeListSettings[0]?.id)! : 0, forKey: "roomType")
            }
        }
    }
    @IBAction func retryBtnTapped(_ sender: Any) {
        if Utility.shared.isConnectedToNetwork(){
            self.offlineUIView.isHidden = true
        }
    }
    
    func setbuildingSize()
    {
        let buildingSizeListings = (Utility.shared.getListSettingsArray?.buildingSize?.listSettings!)!
        
        for item in buildingSizeListings
        {
            buildingSizeArray.append((item?.itemName)!)
            buildidArray.append("\((item?.id)!)")
        }
        if !Utility.shared.step1ValuesInfo.keys.contains("buildingSize")
        {
            buildingSizeLbl = buildingSizeArray.first != nil ? buildingSizeArray.first! : ""
          //  let buildingSize = buildingSizeLbl.components(separatedBy: "-")
           // let buildingsizearr = buildingSize[1].components(separatedBy: " ")
            Utility.shared.step1ValuesInfo.updateValue(buildidArray.count > 0 ? buildidArray[0] : 0 , forKey: "buildingSize")
            pickerView.selectRow(0, inComponent: 0, animated: true)
        }else {
            for item in buildingSizeListings{
//                if let type = (Utility.shared.step1ValuesInfo["buildingSize"]! as? Int)!
//                {
                 let build = "\(Utility.shared.step1ValuesInfo["buildingSize"]!)"
                    if (item?.id == Int(build)!)
                    {
                        buildingSizeLbl = (item?.itemName!)!
                    }
                //}
            }
            if !buildingSizeLbl.isEmpty
            {
                let index = buildingSizeArray.firstIndex(where: { (item) -> Bool in
                    item == buildingSizeLbl
                })
                pickerView.selectRow(index != nil ? index! : 0, inComponent: 0, animated: true)
            } else {
                buildingSizeLbl = buildingSizeArray.first != nil ? buildingSizeArray.first! : ""
                  Utility.shared.step1ValuesInfo.updateValue(buildidArray.count > 0 ? buildidArray[0] : 0 , forKey: "buildingSize")
                  pickerView.selectRow(0, inComponent: 0, animated: true)
            }
            
        }
    }
    
    func setResidenceType()
    {
        staticArray.append("Yes")
        staticArray.append("No")
        if !Utility.shared.step1ValuesInfo.keys.contains("residenceType")
        {
            personalType = staticArray.first!
            pickerView.selectRow(0, inComponent: 0, animated: true)
            Utility.shared.step1ValuesInfo.updateValue("1", forKey: "residenceType")
        }else {
            personalType = (Utility.shared.step1ValuesInfo["residenceType"]! as? String) == "1" ? "Yes" : "No"
            if personalType == "Yes"
            {
                pickerView.selectRow(0, inComponent: 0, animated: true)
                Utility.shared.step1ValuesInfo.updateValue("1", forKey: "residenceType")
            }else if personalType == "No"
            {
                pickerView.selectRow(1, inComponent: 0, animated: true)
                Utility.shared.step1ValuesInfo.updateValue("0", forKey: "residenceType")
            }
        }
    }
    
    override func setdropdown()
    {
        inputPickerView.frame = CGRect(x: 0, y: FULLHEIGHT-200, width: FULLWIDTH, height: 200)
        pickerView.frame = CGRect(x: 0, y: 0, width: FULLWIDTH, height: 200)
        inputPickerView.addSubview(pickerView)
        pickerView.delegate = self
        pickerView.tintColor = Theme.PRIMARY_COLOR
        pickerView.backgroundColor = UIColor(named: "colorController")
        pickerView.reloadAllComponents()
    }
    
    override func registerCells() {
        tableView.register(UINib(nibName: "TextFieldCell", bundle: nil), forCellReuseIdentifier: "textfieldcell")
        tableView.register(UINib(nibName: "TipCell", bundle: nil), forCellReuseIdentifier: "TipCell")
    }
    
    //MARK: - Progress Indicator
    
    override func addLottieViewAsSubview()
    {
     //   self.view.addSubview(self.lottieView)
    }
    
    //IBActions
    
    @IBAction func RedirectNextPage(_ sender: Any) {
       
        if(Utility.shared.createId == 0){
                let arrCount = buildingSizeLbl.replacingOccurrences(of: "Rooms", with: "").trimmingCharacters(in: .whitespaces).components(separatedBy: "-")
                if arrCount.count == 2{
                    MaxBedCount = Int(arrCount[1]) ?? 6
                }else{
                    MaxBedCount = 6
                }
            viewBedAndBath.isHidden = false
            viewBedBathBG.isHidden = false
        }else{
            self.reDirectToNext()
        }
    }
    
    @IBAction func onClickBathMinus(_ sender: Any) {
        if Utility.shared.bathcount > 1 {
            Utility.shared.bathcount -= 1
            updateLabels()
        }
    }

    @IBAction func onClickPlusBath(_ sender: Any) {
        Utility.shared.bathcount += 1
        updateLabels()
    }
    
    @IBAction func onClickBedMinus(_ sender: Any) {
        if Utility.shared.bedcount > 1 {
            Utility.shared.bedcount -= 1
            updateLabels()
        }
    }
    
    @IBAction func onClickBedPlus(_ sender: Any) {
        if Utility.shared.bedcount < MaxBedCount{
            Utility.shared.bedcount += 1
            updateLabels()
        }
    }

    @IBAction func onClickCancel(_ sender: Any) {
        viewBedAndBath.isHidden = true
        viewBedBathBG.isHidden = true
    }
    
    @IBAction func onClickAdd(_ sender: Any) {
        viewBedAndBath.isHidden = true
        viewBedBathBG.isHidden = true
      //  self.reDirectToNext()
        self.redirectToBedBath()
    }
    
    func redirectToBedBath(){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let bedBathListVC = mainStoryboard.instantiateViewController(withIdentifier: "BedBathListVC") as! BedBathListVC
        bedBathListVC.modalPresentationStyle = .fullScreen
        self.present(bedBathListVC, animated: false, completion: nil)
    }

    func reDirectToNext(){
        if Utility.shared.isConnectedToNetwork(){
        let guestListing = GuestListingViewController()
        guestListing.delegateGuestListing = self
        self.view.window?.backgroundColor = UIColor.white
        guestListing.modalPresentationStyle = .fullScreen
        self.present(guestListing, animated: false, completion: nil)
        }
        else
        {
            self.offlineUIView.isHidden = false
            let shadowSize2 : CGFloat = 3.0
            let shadowPath2 = UIBezierPath(rect: CGRect(x: -shadowSize2 / 2,
                                                        y: -shadowSize2 / 2,
                                                        width: self.offlineUIView.frame.size.width + shadowSize2,
                                                        height: self.offlineUIView.frame.size.height + shadowSize2))
            
            self.offlineUIView.layer.masksToBounds = false
            self.offlineUIView.layer.shadowColor = Theme.TextLightColor.cgColor
            self.offlineUIView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            self.offlineUIView.layer.shadowOpacity = 0.3
            self.offlineUIView.layer.shadowPath = shadowPath2.cgPath
            if IS_IPHONE_X || IS_IPHONE_XR{
                offlineUIView.frame = CGRect.init(x: 0, y: FULLHEIGHT-130, width: FULLWIDTH, height: 55)
            }else{
                offlineUIView.frame = CGRect.init(x: 0, y: FULLHEIGHT-100, width: FULLWIDTH, height: 55)
            }
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        delegatePlaceListing?.guestroom_detail(roomdetail:"\(Utility.shared.step1ValuesInfo["roomType"]!)")
        delegatePlaceListing?.total_guest_change(guestcount:total_guest_count)
//        self.view.layer.add(dismissrightAnimation()!, forKey: kCATransition)
        if(Utility.shared.step1_inactivestatus == "inactive" || Utility.shared.step1_inactivestatus == "")
        {
            self.dismiss(animated: true, completion: nil)
        }else{
            self.goToBecomeHost()
        }
    }
    
    func goToBecomeHost(){
        let becomeHost = BecomeHostVC()
        becomeHost.listID = "\(Utility.shared.createId)"
        becomeHost.showListingStepsAPICall(listID:"\(Utility.shared.createId)")
        becomeHost.modalPresentationStyle = .fullScreen
        self.present(becomeHost, animated:false, completion: nil)
    }
    func lottieanimation()
    {
        saveAndExit.setTitle("", for:.normal)
        lottieView1 = LottieAnimationView.init(name: "animation")
        self.lottieView1.isHidden = false
        self.lottieView1.frame = CGRect(x:((self.saveAndExit.frame.size.width/2)-50), y:0, width:100, height:self.saveAndExit.frame.size.height)
        self.saveAndExit.addSubview(self.lottieView1)
        self.view.bringSubviewToFront(self.lottieView1)
        self.lottieView1.backgroundColor = UIColor.clear
        self.lottieView1.play()
        Timer.scheduledTimer(timeInterval:0.3, target: self, selector: #selector(autoscroll), userInfo: nil, repeats: true)
    }
    @objc func autoscroll()
    {
        self.lottieView1.play()
    }
    
   
    @IBAction func saveAndExitAction(_ sender: Any) {
        if Utility.shared.isConnectedToNetwork(){
            self.lottieanimation()
            super.updateListingAPICall{ (success) -> Void in
            if success {
            saveAndExit.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"saveexit"))!)", for:.normal)
                
                self.lottieView1.isHidden = true
             }
                }
        }
        else
        {
            self.offlineUIView.isHidden = false
            let shadowSize2 : CGFloat = 3.0
            let shadowPath2 = UIBezierPath(rect: CGRect(x: -shadowSize2 / 2,
                                                        y: -shadowSize2 / 2,
                                                        width: self.offlineUIView.frame.size.width + shadowSize2,
                                                        height: self.offlineUIView.frame.size.height + shadowSize2))
            
            self.offlineUIView.layer.masksToBounds = false
            self.offlineUIView.layer.shadowColor = Theme.TextLightColor.cgColor
            self.offlineUIView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            self.offlineUIView.layer.shadowOpacity = 0.3
            self.offlineUIView.layer.shadowPath = shadowPath2.cgPath
            if IS_IPHONE_X || IS_IPHONE_XR{
                offlineUIView.frame = CGRect.init(x: 0, y: FULLHEIGHT-130, width: FULLWIDTH, height: 55)
            }else{
                offlineUIView.frame = CGRect.init(x: 0, y: FULLHEIGHT-100, width: FULLWIDTH, height: 55)
            }
        }
    }
    
       //MARK: - UITAbleViewDatasource and UITableViewDelegates
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0
        {
            let cell = tableView
                .dequeueReusableCell(withIdentifier: "textfieldcell", for: indexPath) as? TextFieldCell
            
            cell?.stepNumberLblTopConstraint.constant = 0
                cell?.linebottomconstant.constant = 0
                cell?.linetopconstant.constant = 0
            if indexPath.row == 0
            {
                cell?.queryTitleLbl.text = "\(Utility.shared.getLanguage()?.value(forKey: "property_type")as! String)"
                
                cell?.txtField.attributedPlaceholder = NSAttributedString(string: houseLabel,
                                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "Title_Header")])
                cell?.txtField.tintColor = UIColor.clear
                cell?.txtField.tag = 0
                cell?.queryTitleLbl.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
                cell?.txtField.font = UIFont(name: APP_FONT, size: 14)
                cell?.queryTitleLbl.textColor =  UIColor(named: "Title_Header")
                

            }else if indexPath.row == 1
            {
                cell?.queryTitleLbl.text = "\(Utility.shared.getLanguage()?.value(forKey: "What_guest_have")as! String)"
                cell?.txtField.attributedPlaceholder = NSAttributedString(string: roomTypeLbl,
                                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "Title_Header")])
                cell?.txtField.tag = 1
                cell?.txtField.tintColor = UIColor.clear
                cell?.queryTitleLbl.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
                cell?.txtField.font = UIFont(name: APP_FONT, size: 14)
                cell?.queryTitleLbl.textColor =  UIColor(named: "Title_Header")

            }else if indexPath.row == 2
            {
                cell?.queryTitleLbl.text = "\(Utility.shared.getLanguage()?.value(forKey: "Rooms_in_property")as! String)"
                cell?.txtField.attributedPlaceholder = NSAttributedString(string: buildingSizeLbl,
                                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "Title_Header")])
                cell?.txtField.tag = 2
                cell?.txtField.tintColor = UIColor.clear
                cell?.queryTitleLbl.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
                cell?.txtField.font = UIFont(name: APP_FONT, size: 14)
                cell?.queryTitleLbl.textColor =  UIColor(named: "Title_Header")

            }else if indexPath.row == 3
            {
                cell?.queryTitleLbl.text = "\(Utility.shared.getLanguage()?.value(forKey: "Personal_Home")as! String)"
                cell?.txtField.attributedPlaceholder = NSAttributedString(string: personalType,
                                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "Title_Header")])
                cell?.txtField.tag = 3
                cell?.queryTitleLbl.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
                cell?.txtField.font = UIFont(name: APP_FONT, size: 14)
                cell?.queryTitleLbl.textColor =  UIColor(named: "Title_Header")

            }
            else if indexPath.row == 4 {
                let cells = tableView
                    .dequeueReusableCell(withIdentifier: "TipCell", for: indexPath) as? TipCell
                cells?.tipText.text = "\(Utility.shared.getLanguage()?.value(forKey: "guest_personal_belongings")as! String)"
                cells?.selectionStyle = .none
                return cells!
            }
//            {
//                let hintcell = UITableViewCell()
//                hintcell.selectionStyle = .none
//                hintcell.textLabel?.frame.origin.x = 40
//                hintcell.textLabel?.textColor = UIColor.lightGray
//                hintcell.textLabel?.text = "\(Utility.shared.getLanguage()?.value(forKey: "guest_personal_belongings")as! String)"
//                hintcell.textLabel?.numberOfLines = 0
//                hintcell.textLabel?.font = UIFont(name: APP_FONT, size:14)
//                return hintcell
//            }
            cell?.txtField.tintColor = UIColor.clear
            cell?.txtField.textColor = UIColor(named: "Title_Header")
            cell?.stepnumberLbl.isHidden = true
            cell?.selectionStyle = .none
            let toolBar = UIToolbar().ToolbarPikerSelect(mySelect: #selector(dismissgenderPicker))
            cell?.txtField.inputAccessoryView = toolBar
            toolBar.barTintColor = UIColor(named: "Button_Grey_Color")
            cell?.txtField.inputView = pickerView
            cell?.txtField.delegate = self
            cell?.queryTitleLbl.textColor =  UIColor(named: "Title_Header")
            
            cell?.queryTitleLbl.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
            cell?.txtField.font = UIFont(name: APP_FONT, size: 14)
            
            cell?.stepnumberLbl.text = ""
            cell?.stepNumberLblTopConstraint.constant = 0
            
            cell?.imgDownArrow.isHidden = false
            
//            let downArrowIconView = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: (cell?.txtField.frame.size.height)!))
//            let downArrowIcon = UIImageView()
//            if Utility.shared.isRTLLanguage(){
//                downArrowIcon.frame = CGRect(x: 20, y:((cell?.txtField.rightView?.frame.size.height)! / 2)-3 , width: 10, height: 10)
//            }else{
//                downArrowIcon.frame = CGRect(x: 0, y: ((cell?.txtField.rightView?.frame.size.height)! / 2)-3, width: 10, height: 10)
//            }
//
//            downArrowIcon.image = UIImage(named: "downArrow")
//            downArrowIcon.contentMode = .scaleAspectFit
//            downArrowIconView.tag = indexPath.row
//            downArrowIconView.addTarget(self, action: #selector(onClickedDownArrow), for: .touchUpInside)
//            downArrowIconView.addSubview(downArrowIcon)
//
//            let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
//            cell?.txtField.leftView = paddingView
//            cell?.txtField.leftViewMode = .always
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
          //  }
            
           
            
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0
        {
            selectedTextfield = 0
            if !houseLabel.isEmpty
            {
                let index = houseTypeArray.firstIndex(where: { (item) -> Bool in
                    item == houseLabel
                })
                pickerView.selectRow(index != nil ? index! : 0, inComponent: 0, animated: true)
            }
        }else if indexPath.row == 1
        {
            selectedTextfield = 1
            if !roomTypeLbl.isEmpty
            {
                let index = roomTypeArray.firstIndex(where: { (item) -> Bool in
                    item == roomTypeLbl
                })
                pickerView.selectRow(index != nil ? index! : 0, inComponent: 0, animated: true)
            }
        }else if indexPath.row == 2
        {
            selectedTextfield = 2
            if !buildingSizeLbl.isEmpty
            {
                let index = buildingSizeArray.firstIndex(where: { (item) -> Bool in
                    item == buildingSizeLbl
                })
                pickerView.selectRow(index != nil ? index! : 0, inComponent: 0, animated: true)
            }
        }else if indexPath.row == 3 {
            selectedTextfield = 3
            if personalType == "Yes"
            {
                pickerView.selectRow(0, inComponent: 0, animated: true)
            }else if personalType == "No"
            {
                pickerView.selectRow(1, inComponent: 0, animated: true)
            }
        }
        listValuePicker.reloadAllComponents()
        
    }
    
    //MARK: - UIPickerViewDelegate and Datasource
    
    override func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (selectedTextfield == 0)
        {
            return houseTypeArray.count
        }else if selectedTextfield == 1
        {
            return roomTypeArray.count
        }else if selectedTextfield == 2
        {
            return buildingSizeArray.count
        }
        else if selectedTextfield == 3{
            return staticArray.count
        }
        return 0
    }
    
    override func pickerView( _ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var titleData = ""
        
        if (selectedTextfield == 0)
        {
            if(houseTypeArray.count > row)
            {
            titleData = houseTypeArray[row]
            }
        }else if selectedTextfield == 1
        {
            if(roomTypeArray.count > row)
            {
            titleData = roomTypeArray[row]
            }
        }else if selectedTextfield == 2
        {
            if(buildingSizeArray.count > row)
            {
            titleData = buildingSizeArray[row]

            }
        }
        else if selectedTextfield == 3 {
            if(staticArray.count > row)
            {
            titleData = staticArray[row]
            }
        }
        
        let myTitle = NSAttributedString(string: titleData , attributes: [NSAttributedString.Key.font:UIFont(name: APP_FONT, size: 15.0)!,NSAttributedString.Key.foregroundColor:Theme.PRIMARY_COLOR])
        return myTitle
    }
    
    override func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent  component: Int) {
        
        if (selectedTextfield == 0)
        {
            houseLabel = houseTypeArray[row]
            pickerView.selectRow(row, inComponent: component, animated: true)
            Utility.shared.step1ValuesInfo.updateValue((Utility.shared.getListSettingsArray?.houseType?.listSettings![row]?.id!)!, forKey: "houseType")
        }else if selectedTextfield == 1
        {
            roomTypeLbl = roomTypeArray[row]
            pickerView.selectRow(row, inComponent: component, animated: true)
            Utility.shared.step1ValuesInfo.updateValue((Utility.shared.getListSettingsArray?.roomType?.listSettings![row]?.id!)!, forKey: "roomType")
        }else if selectedTextfield == 2
        {
            buildingSizeLbl = buildingSizeArray[row]
            pickerView.selectRow(row, inComponent: component, animated: true)
            Utility.shared.step1ValuesInfo.updateValue(buildidArray[row], forKey: "buildingSize")
        }
        else if selectedTextfield == 3{
            personalType = staticArray[row]
            pickerView.selectRow(row, inComponent: component, animated: true)
            Utility.shared.step1ValuesInfo.updateValue(personalType == "Yes" ? "1" : "0", forKey: "residenceType")
        }
//        tableView.reloadData()
       
    }
    
    @objc func onClickedDownArrow(sender: UIButton){
        let cell = tableView.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as! TextFieldCell
        cell.txtField.becomeFirstResponder()
    }
    
    //MARK: - UITextFieldDelegates
    
    override func textFieldDidBeginEditing(_ textField: UITextField) {
        
        selectedTextfield = textField.tag
        if selectedTextfield == 0
        {
            if !houseLabel.isEmpty
            {
                let index = houseTypeArray.firstIndex(where: { (item) -> Bool in
                    item == houseLabel
                })
                pickerView.selectRow(index != nil ? index! : 0, inComponent: 0, animated: true)
            }
        }else if selectedTextfield == 1
        {
            if !roomTypeLbl.isEmpty
            {
                let index = roomTypeArray.firstIndex(where: { (item) -> Bool in
                    item == roomTypeLbl
                })
                pickerView.selectRow(index != nil ? index! : 0, inComponent: 0, animated: true)
            }
        }else if selectedTextfield == 2
        {
            if !buildingSizeLbl.isEmpty
            {
                let index = buildingSizeArray.firstIndex(where: { (item) -> Bool in
                    item == buildingSizeLbl
                })
                pickerView.selectRow(index != nil ? index! : 0, inComponent: 0, animated: true)
            }
        }else if selectedTextfield == 3{
            if personalType == "Yes"
            {
                pickerView.selectRow(0, inComponent: 0, animated: true)
            }else if personalType == "No"
            {
                pickerView.selectRow(1, inComponent: 0, animated: true)
            }
        }
        pickerView.reloadAllComponents()
    }
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        tableView.reloadData()
        view.endEditing(true)
    }
    
}

extension PlaceListingViewController: stepsUpdateProtocol{
    func selectedPage(step: Int, selectedPageIndex: Int) {
        if step == 1{
            switch selectedPageIndex{
            case 0:
                let StepOne = PlaceListingViewController()
                StepOne.modalPresentationStyle = .fullScreen
                self.present(StepOne, animated:false, completion: nil)
                break
            case 1:
                let guestListing = GuestListingViewController()
                guestListing.delegateGuestListing = self
                self.view.window?.backgroundColor = UIColor.white
                guestListing.modalPresentationStyle = .fullScreen
                self.present(guestListing, animated: false, completion: nil)
                break
//            case 2:
//                let bedsListing = BedsListingViewController()
//                self.view.window?.backgroundColor = UIColor.white
//                bedsListing.modalPresentationStyle = .fullScreen
//                self.present(bedsListing, animated: false, completion: nil)
//                break
//            case 3:
//                let bathroomsListing = BathroomsListingViewController()
//                self.view.window?.backgroundColor = UIColor.white
//              // self.view.layer.add(dismissrightAnimation()!, forKey: kCATransition)
//                bathroomsListing.modalPresentationStyle = .fullScreen
//                self.present(bathroomsListing, animated: false, completion: nil)
//                break
            case 2:
                let location = AddressListingViewController()
                self.view.window?.backgroundColor = UIColor.white
              // self.view.layer.add(dismissrightAnimation()!, forKey: kCATransition)
                 location.modalPresentationStyle = .fullScreen
                self.present(location, animated: false, completion: nil)
                break
            case 3:
                let becomeHostObj = MapLocateVC()
                self.view.window?.backgroundColor = UIColor.white
                becomeHostObj.modalPresentationStyle = .fullScreen
                self.present(becomeHostObj, animated:false, completion: nil)
                break
            case 4:
                let nextpageObj = AmenitiesViewController()
                self.view.window?.backgroundColor = UIColor.white
                 nextpageObj.modalPresentationStyle = .fullScreen
                self.present(nextpageObj, animated: false, completion: nil)
                break
            case 5:
                let amenities = SafeAmenitiesViewController()
                self.view.window?.backgroundColor = UIColor.white
                amenities.modalPresentationStyle = .fullScreen
                self.present(amenities, animated: false, completion: nil)
                break
            case 6:
                let spaces = SpaceListViewController()
                self.view.window?.backgroundColor = UIColor.white
                spaces.modalPresentationStyle = .fullScreen
                self.present(spaces, animated: false, completion: nil)
                break
            default:
                break
            }
        }
    }
}
