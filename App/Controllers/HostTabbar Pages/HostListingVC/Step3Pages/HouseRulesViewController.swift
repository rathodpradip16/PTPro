//
//  HouseRulesViewController.swift
//  App
//
//  Created by RadicalStart on 07/08/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import Lottie
import PTProAPI

class HouseRulesViewController: BaseHostTableviewController {
    @IBOutlet var progressViewWidth: NSLayoutConstraint!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var curvedView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var progressBGView: UIView!
    @IBOutlet weak var curvedProgressView: UIView!
    @IBOutlet weak var saveandExitBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var offlineUIView: UIView!
    @IBOutlet weak var retryButn: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
     var houserule = ""
    var houseRules = [[String : Any]]()
   // var selectedRules = [Int]()
    var lottieView1: LottieAnimationView!
    
    @IBOutlet weak var stepsTitleView: BecomeStepCollectionView!
    @IBOutlet weak var stepTitleHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var stepTitleTopConstraint: NSLayoutConstraint!
    //MARK: - View Controller Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "becomeAHostStep_Color")
        tableView.backgroundColor =  UIColor(named: "colorController")
        bottomView.backgroundColor =  UIColor(named: "colorController")
        curvedView.backgroundColor = UIColor(named: "colorController")
        
        nextBtn.backgroundColor = Theme.Button_BG
        saveandExitBtn.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
      
        self.backBtn.setImage(UIImage(named: "left_arrow"), for: .normal)
        self.backBtn.setTitle("", for: .normal)
        self.backBtn.backgroundColor = UIColor.white
        self.backBtn.layer.cornerRadius = self.backBtn.frame.size.height/2
        self.backBtn.clipsToBounds = true
        
        if Utility.shared.isRTLLanguage(){
            self.backBtn.rotateImageViewofBtn()
        }
        
        self.titleLabel.text = "\(Utility.shared.getLanguage()?.value(forKey: "house_rules") ?? "What are your house rules?")"
        self.titleLabel.textColor = UIColor(named: "Title_Header")
        self.titleLabel.font = UIFont(name: APP_FONT_SEMIBOLD, size: 24.0)
        self.titleLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        
        progressBGView.backgroundColor = Theme.becomeAHostProgressBG_Color
        curvedProgressView.backgroundColor = Theme.PRIMARY_COLOR
        
        self.curvedView.layer.borderColor = Theme.becomeAHostBorder_Color.cgColor
        self.curvedView.layer.borderWidth = 0.5
        self.curvedView.layer.cornerRadius = 20.0
        self.curvedView.clipsToBounds = true
        
        saveandExitBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"saveexit"))!)", for:.normal)
        errorLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"error_field"))!)"
        retryButn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"retry"))!)", for:.normal)
        saveandExitBtn.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        errorLabel.textColor =  UIColor(named: "Title_Header")
        retryButn.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        saveandExitBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 14)
        nextBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
        errorLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 15)
               retryButn.titleLabel?.font = UIFont(name: APP_FONT, size: 15)
        
        self.stepsTitleView.whichStep = 3
        self.stepsTitleView.selectedIndex = 0
        self.stepsTitleView.delegateSteps = self
    }
    
    override func setUpUI() {
        offlineUIView.isHidden = true
        callListingSettingsAPI(oflineView: offlineUIView, nextButton: nextBtn)
        tableView.isHidden = false
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 10))
        nextBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey: "next"))!)", for: .normal)
        nextBtn.layer.cornerRadius = nextBtn.frame.size.height/2
        nextBtn.clipsToBounds = true
        
        if(Utility.shared.step3_Edit)
        {
            self.saveandExitBtn.isHidden = false
            self.stepsTitleView.isHidden = false
            self.stepTitleHeightConstraint.constant = 50
            self.stepTitleTopConstraint.constant = 5
        }
        else{
            self.saveandExitBtn.isHidden = true
            self.stepsTitleView.isHidden = true
            self.stepTitleHeightConstraint.constant = 0
            self.stepTitleTopConstraint.constant = 0
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.stepsTitleView.toBeCheck()
        progressViewWidth.constant = ((self.view.frame.width/8) * CGFloat((self.stepsTitleView.selectedViewIndex + 1)))
    }
    override func setDropdownList() {
        // Utility.shared.selectedRules.removeAllObjects()
        let houseRule = Utility.shared.getListSettingsArray?.houseRules?.listSettings
        for i in 0..<(houseRule?.count ?? 0)
        {
            var amenityInfo = [String : Any]()
            amenityInfo.updateValue(houseRule?[i]!.itemName!, forKey: "itemName")
            amenityInfo.updateValue(houseRule?[i]!.id!, forKey: "id")
            houseRules.append(amenityInfo)
        }
        if Utility.shared.step3ValuesInfo.keys.contains("houseRules")
        {
            if let typeInfo = Utility.shared.step3ValuesInfo["houseRules"] as? [Any]
            {
                for i in 0..<typeInfo.count
                {
                    if let userhouseTypes = typeInfo[i] as? GetListingDetailsStep3Query.Data.GetListingDetails.Results.HouseRule
                    {
                        if houseRules.contains(where: { (item) -> Bool in
                            (item["id"] as? Int == (userhouseTypes.id))
                        }){
                           Utility.shared.selectedRules.add(userhouseTypes.id!)
                            
                        }
                        
                    }
                }
            }
            
        }
        else{
            houserule = (houseRules.first! is [String : Any]) ? houseRules.first!["itemName"] as! String : ""
            Utility.shared.selectedRules.removeAllObjects()
            
        }
        Utility.shared.step3ValuesInfo.updateValue(Utility.shared.selectedRules, forKey: "houseRules")
        tableView.reloadData()
    }
    
    override func registerCells() {
        tableView.register(UINib(nibName: "AmenitiesCell", bundle: nil), forCellReuseIdentifier: "AmenitiesCell")
        tableView.register(UINib(nibName: "ReviewInstantCells", bundle: nil), forCellReuseIdentifier: "reviewInstantCells")
    }
    
    //MARK: - Progress Indicator
    
    override func addLottieViewAsSubview()
    {
        self.view.addSubview(self.lottieView)
    }
    
    
    func lottieViewanimation()
    {
        saveandExitBtn.setTitle("", for:.normal)
        lottieView1 = LottieAnimationView.init(name: "animation")
        self.lottieView1.isHidden = false
        self.lottieView1.frame = CGRect(x:((self.saveandExitBtn.frame.size.width/2)-50), y:0, width:100, height:self.saveandExitBtn.frame.size.height)
        self.saveandExitBtn.addSubview(self.lottieView1)
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
        self.offlineUIView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.offlineUIView.layer.shadowOpacity = 0.3
        self.offlineUIView.layer.shadowPath = shadowPath2.cgPath
        if IS_IPHONE_X || IS_IPHONE_XR{
            offlineUIView.frame = CGRect.init(x: 0, y: FULLHEIGHT-130, width: FULLWIDTH, height: 55)
        }else{
            offlineUIView.frame = CGRect.init(x: 0, y: FULLHEIGHT-100, width: FULLWIDTH, height: 55)
        }
    }
    
    
    //IBActions
    
    @IBAction func retryBtnTapped(_ sender: Any) {
        if Utility.shared.isConnectedToNetwork(){
            self.offlineUIView.isHidden = true
        }
    }
    @IBAction func RedirectNextPage(_ sender: Any) {
        Utility.shared.step3ValuesInfo.updateValue(Utility.shared.selectedRules, forKey: "houseRules")

        let becomeHost = NoticeArrivalViewController()
        self.view.window?.backgroundColor = UIColor.white
        becomeHost.modalPresentationStyle = .fullScreen
        self.present(becomeHost, animated:false, completion: nil)
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        //self.view.layer.add(dismissrightAnimation()!, forKey: kCATransition)
        if(Utility.shared.step3_Edit)
        {
            
            let becomeHost = BecomeHostVC()
            becomeHost.listID = "\(Utility.shared.createId)"
            becomeHost.showListingStepsAPICall(listID:"\(Utility.shared.createId)")
          //  self.view.window!.layer.add(presentrightAnimation()!, forKey: kCATransition)
            becomeHost.modalPresentationStyle = .fullScreen
            self.present(becomeHost, animated:false, completion: nil)
           
//            let StepTwoObj = ReviewGuestViewController()
//            self.view.window?.backgroundColor = UIColor.white
//            StepTwoObj.modalPresentationStyle = .fullScreen
//            self.present(StepTwoObj, animated:false, completion: nil)
        }
        else{
            self.dismiss(animated: true, completion: nil)
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
    
    @IBAction func saveandExitAction(_ sender: Any) {
         if Utility.shared.isConnectedToNetwork(){
           
                 self.lottieViewanimation()
           Utility.shared.step3ValuesInfo.updateValue(Utility.shared.selectedRules, forKey: "houseRules")
           Utility.shared.step3ValuesInfo.updateValue(Utility.shared.createId, forKey: "id")
           super.updateStep3ListingAPICall{ (success) -> Void in
           if success {
           saveandExitBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"saveexit"))!)", for:.normal)
               
               self.lottieView1.isHidden = true
            }
               }
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
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = UILabel(frame: CGRect(x:15, y: 8, width: FULLWIDTH-40, height:75))
        headerLabel.font =  UIFont(name: APP_FONT_MEDIUM, size:25)
        headerLabel.addCharacterSpacing()
        headerLabel.textColor =  UIColor(named: "Title_Header")
        headerLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
        headerLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        headerLabel.numberOfLines = 0
        //headerLabel.sizeToFit()
        
        let headerView = UIView(frame: CGRect(x:15, y: 8, width: tableView.bounds.size.width - 20, height: 75))
        headerView.backgroundColor = UIColor.white
        headerView.addSubview(headerLabel)
        return headerView
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
        return houseRules.count 
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//
//        if indexPath.row == 0{
//            let cell = tableView
//                .dequeueReusableCell(withIdentifier: "reviewInstantCells", for: indexPath) as! ReviewInstantCells
//            cell.selectionStyle = .none
//
//            cell.contentLabel.text = "\(Utility.shared.getLanguage()?.value(forKey: "guest_must_agree") ?? "Guests must agree to your house rules before they book!")"
//            cell.contentLabel.textColor = UIColor(named: "searchPlaces_TextColor")
//            cell.contentLabel.font = UIFont(name: APP_FONT, size: 14)
//
//            cell.tickImgView.isHidden = true
//            cell.lineView.isHidden = true
//            cell.contentLeadingConstraint.constant = -12
//
//            return cell
//        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AmenitiesCell", for: indexPath) as? AmenitiesCell
            cell?.amenitieslistTile.text = houseRules[indexPath.row]["itemName"] as? String
            cell?.tag = ((indexPath.row)+300)
        cell?.iconWidthConstraint.constant = 0
        cell?.iconTrailingConstraint.constant = 0
        cell?.amenitiesImgIcon.isHidden = true
            
            if(Utility.shared.selectedRules.contains(houseRules[indexPath.row]["id"] as! Int))
            {
                cell?.checkBtn.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
                cell?.checkBtn.tintColor = Theme.PRIMARY_COLOR
            }
            
            else{
                cell?.checkBtn.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            }
            
            cell?.checkBtn.tag = indexPath.row
            cell?.checkBtn.addTarget(self, action: #selector(amenitiescheckBtnTapped(_:)), for: .touchUpInside)
            cell?.selectionStyle = .none
            return cell!
       // }
            
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? UITableView.automaticDimension : 65
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = view.viewWithTag((indexPath.row) + 300) as? AmenitiesCell
            if(Utility.shared.selectedRules.contains(houseRules[indexPath.row]["id"] as! Int))
            {
                Utility.shared.selectedRules.remove(houseRules[indexPath.row]["id"] as! Int)
                cell?.checkBtn.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            }
        else{
            if houseRules[indexPath.row]["itemName"] as? String == (cell?.amenitieslistTile.text)!
                {
                    Utility.shared.selectedRules.add(houseRules[indexPath.row]["id"] as! Int)
                    
                }
            cell?.checkBtn.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            cell?.checkBtn.tintColor = Theme.PRIMARY_COLOR
        }
    }
    
    @objc func amenitiescheckBtnTapped(_ sender: UIButton)
    {
        let cell = view.viewWithTag((sender.tag) + 300) as? AmenitiesCell
        
            if(Utility.shared.selectedRules.contains(houseRules[sender.tag]["id"] as! Int))
            {
                Utility.shared.selectedRules.remove(houseRules[sender.tag]["id"] as! Int)
                cell?.checkBtn.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            }
            
        else{
                if houseRules[sender.tag]["itemName"] as? String == (cell?.amenitieslistTile.text)!
                {
                    
                    Utility.shared.selectedRules.add(houseRules[sender.tag]["id"] as! Int)
                }
           
            cell?.checkBtn.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            cell?.checkBtn.tintColor = Theme.PRIMARY_COLOR
        }
    }
    
    
}

extension HouseRulesViewController: stepsUpdateProtocol{
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
                let amenities = BasePriceViewController()
                self.view.window?.backgroundColor = UIColor.white
                amenities.modalPresentationStyle = .fullScreen
                self.present(amenities, animated: false, completion: nil)
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
