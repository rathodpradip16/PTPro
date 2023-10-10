//
//  ProfilePageVC.swift
//  App
//
//  Created by RADICAL START on 22/03/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import Apollo
import  Lottie
import SwiftMessages

class ProfilePageVC: UIViewController,UITableViewDataSource,UITableViewDelegate,UITabBarControllerDelegate,UITabBarDelegate,userStepInfoUpdate{


    //***************************************IBOUTLET CONNECTIONS  & GLOBAL DECLARATIONS *********************************************************>
    @IBOutlet weak var profileTable: UITableView!
    
    @IBOutlet weak var retryBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var profileBackImage: UIImageView!
    @IBOutlet weak var offlineView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var profileName: UILabel!
    
    var ProfileArray = NSMutableArray()
    var ProfileTickImageArray = NSMutableArray()
    var lottieView: LottieAnimationView!
    
    var ProfileAPIArray : PTProAPI.GetProfileQuery.Data.UserAccount.Result?

    override func viewDidLoad() {
        super.viewDidLoad()
        offlineView.backgroundColor =  UIColor(named: "Button_Grey_Color")
        CustomTabbar().delegate = self
        
        self.initialSetup()
        // self.lottieAnimation()
        self.LanguageAPICall()
        self.currencyAPICall()
        self.getAffiliateUserStepAPICall()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.profileTable.reloadData()
        if((Utility.shared.getCurrentUserToken()) != nil || (Utility.shared.getCurrentUserToken()) != "")
        {
            self.profileAPICall()
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController)
    {
        print("Test")
    }
    
    
    func initialSetup()
    {
        self.offlineView.isHidden = true
        
        self.view.backgroundColor = UIColor(named: "colorController")
        profileTable.register(UINib(nibName: "HeaderProfileCell", bundle: nil), forCellReuseIdentifier: "HeaderProfileCell")
        profileTable.register(UINib(nibName: "SwitchtohostCell", bundle: nil), forCellReuseIdentifier: "SwitchtohostCell")
        profileTable.register(UINib(nibName: "FooterProfileCell", bundle: nil), forCellReuseIdentifier: "footerProfileCell")
        if(Utility.shared.ProfileAPIArray?.loginUserType == "Host" && !Utility.shared.getTabbar()!)
        {
            ProfileArray = ["\((Utility.shared.getLanguage()?.value(forKey:"Switchhosting"))!)","\(Utility.shared.getLanguage()?.value(forKey:"reviews") ?? "Reviews")","\((Utility.shared.getLanguage()?.value(forKey:"payoutpreference"))!)","\((Utility.shared.getLanguage()?.value(forKey:"about"))!)","\((Utility.shared.getLanguage()?.value(forKey:"givefeed"))!)","\((Utility.shared.getLanguage()?.value(forKey:"gethelp"))!)","\((Utility.shared.getLanguage()?.value(forKey:"logout"))!)","\((Utility.shared.getLanguage()?.value(forKey:"version"))!)"]
            ProfileTickImageArray = [#imageLiteral(resourceName: "profile_Verify_Tick"),#imageLiteral(resourceName: "profile_NotVerify_Tick"),#imageLiteral(resourceName: "profile_NotVerify_Tick"),#imageLiteral(resourceName: "profile_NotVerify_Tick"),#imageLiteral(resourceName: "profile_NotVerify_Tick")]
        }
        else {
            ProfileArray = ["\((Utility.shared.getLanguage()?.value(forKey:"Switchhosting"))!)","\(Utility.shared.getLanguage()?.value(forKey:"reviews") ?? "Reviews")","\((Utility.shared.getLanguage()?.value(forKey:"about"))!)","\((Utility.shared.getLanguage()?.value(forKey:"givefeed"))!)","\((Utility.shared.getLanguage()?.value(forKey:"gethelp"))!)","\((Utility.shared.getLanguage()?.value(forKey:"logout"))!)","\((Utility.shared.getLanguage()?.value(forKey:"version"))!)"]
            ProfileTickImageArray = [#imageLiteral(resourceName: "profile_Verify_Tick"),#imageLiteral(resourceName: "profile_NotVerify_Tick"),#imageLiteral(resourceName: "profile_NotVerify_Tick"),#imageLiteral(resourceName: "profile_NotVerify_Tick")]
        }
        errorLabel.textColor =  UIColor(named: "Title_Header")
        retryBtn.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        errorLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"error_field"))!)"
        retryBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"retry"))!)", for:.normal)
        errorLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 15)
        retryBtn.titleLabel?.font = UIFont(name: APP_FONT, size: 15)
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
        Timer.scheduledTimer(timeInterval:0.3, target: self, selector: #selector(autoscroll), userInfo: nil, repeats: true)
    }
    @objc func autoscroll()
    {
        self.lottieView.play()
    }
    func profileAPICall()
    {
        if Utility.shared.isConnectedToNetwork(){
            let profileQuery = PTProAPI.GetProfileQuery()
            
            Network.shared.apollo_headerClient.fetch(query:profileQuery,cachePolicy:.fetchIgnoringCacheData){ [self] response in
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
                            print("Missing Data")
                            //  self.logoutCall()
                            //   Utility.shared.userLogout()
                            Utility.shared.setUserToken(userID: "")
                            self.view.makeToast(result.data?.userAccount?.errorMessage)
                            return
                        }
                    }
                    Utility.shared.ProfileAPIArray = ((result.data?.userAccount?.result)!)
                    ProfileAPIArray = ((result.data?.userAccount?.result)!)
                    
                    
                    Utility.shared.userName  = "\(ProfileAPIArray?.firstName != nil ? ProfileAPIArray?.firstName! : "User")!"
                    
                    
                    if let profImage = ProfileAPIArray?.picture{
                        Utility.shared.pickedimageString = "\(IMAGE_AVATAR_MEDIUM)\(profImage)"
                    }
                    else {
                        Utility.shared.pickedimageString = "avatar"
                    }
                    
                    
                    Utility.shared.setEmail(email:(result.data?.userAccount?.result?.email as AnyObject)as! NSString)
                    
                    if(Utility.shared.getCurrentUserID() == nil){
                        Utility.shared.setUserID(userid:(result.data?.userAccount?.result?.userId as AnyObject)as! NSString)
                        getAffiliateUserStepAPICall()
                    }
                    self.profileTable.reloadData()
                    //  self.lottieView.isHidden = true
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                }
            }
            
            //            else
            //            {
            //                UserDefaults.standard.removeObject(forKey: "user_token")
            //                UserDefaults.standard.removeObject(forKey: "user_id")
            //                UserDefaults.standard.removeObject(forKey: "password")
            //                UserDefaults.standard.removeObject(forKey: "currency_rate")
            //                let welcomeObj = WelcomePageVC()
            //                self.present(welcomeObj, animated:false, completion: nil)
            //                //  self.logoutCall()
            //                // Utility.shared.userLogout()
            //            }
            
        }
    
    
    else{
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
        if IS_IPHONE_X || IS_IPHONE_XR {
            offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-150, width: FULLWIDTH, height: 55)
        }else{
            offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-100, width: FULLWIDTH, height: 55)
        }
    }
    
    
}

@IBAction func backBtnTapped(_ sender: Any) {
}
@IBAction func editprofileTapped(_ sender: Any) {
}





//******************************************************** TABLEVIEW DELEGATE & DATASOURCE METHODS ********************************************>


func numberOfSections(in tableView: UITableView) -> Int {
    if(!Utility.shared.host_message_isfromHost && Utility.shared.GetAffiliateUserStep?.stepInfo == StepInfo.Success.rawValue){
        return 6
    }
    return 5
}
func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if section == 1 || section == 2 || section == 3{
        return 40
    }else if section == 4{
        if(!Utility.shared.host_message_isfromHost && Utility.shared.GetAffiliateUserStep?.stepInfo == StepInfo.Success.rawValue){
            return 40
        }
        return 0
    }else{
        return 0
    }
}

func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
    
    let headerView = UIView()
    headerView.backgroundColor = UIColor(named: "colorController")
    
    
    let headerLabel = UILabel()
    headerLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
    headerLabel.textColor = UIColor(named: "Title_Header")
    headerLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 16.0)
    headerLabel.numberOfLines = 1
    headerLabel.lineBreakMode = .byTruncatingTail
    
    if section == 1{
        
        if(Utility.shared.ProfileAPIArray?.loginUserType == "Host" && !Utility.shared.getTabbar()!)
        {
            if Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification || Utility.shared.isfromBackroundBooking || Utility.shared.isfromOfflineBooking
            {
                headerLabel.text =  "\(Utility.shared.getLanguage()?.value(forKey:"Travelling") ?? "Travelling")"
                
            }else if (Utility.shared.ProfileAPIArray?.isAddedList == true){
                headerLabel.text =  "\(Utility.shared.getLanguage()?.value(forKey:"Hosting") ?? "Hosting")"
            }
            else
            {
                headerLabel.text =  "\(Utility.shared.getLanguage()?.value(forKey:"Hosting") ?? "Hosting")"
            }
        }
        else{
            if(Utility.shared.ProfileAPIArray?.isAddedList == true && !Utility.shared.getTabbar()!)
            {
                headerLabel.text =  "\(Utility.shared.getLanguage()?.value(forKey:"Hosting") ?? "Hosting")"
            }
            else if(Utility.shared.ProfileAPIArray?.isAddedList == false && !Utility.shared.getTabbar()!)
            {
                headerLabel.text =  "\(Utility.shared.getLanguage()?.value(forKey:"Hosting") ?? "Hosting")"
            }
            else
            {
                headerLabel.text =  "\(Utility.shared.getLanguage()?.value(forKey:"Travelling") ?? "Travelling")"
            }
            
        }
    }else if section == 2{
        if(!Utility.shared.host_message_isfromHost && Utility.shared.GetAffiliateUserStep?.stepInfo == StepInfo.Success.rawValue){
            headerLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"AffiliateRegistrationDetails") ?? "Affiliate Registration Details")"
        }else{
            headerLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"Account") ?? "Account")"
        }
    }else if section == 3{
        if(!Utility.shared.host_message_isfromHost && Utility.shared.GetAffiliateUserStep?.stepInfo == StepInfo.Success.rawValue){
            headerLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"Account") ?? "Account")"
        }else{
            headerLabel.text =  "\(Utility.shared.getLanguage()?.value(forKey:"Support") ?? "Support")"
        }
    }else if section == 4{
        if(!Utility.shared.host_message_isfromHost && Utility.shared.GetAffiliateUserStep?.stepInfo == StepInfo.Success.rawValue){
            headerLabel.text =  "\(Utility.shared.getLanguage()?.value(forKey:"Support") ?? "Support")"
        }else{
            headerLabel.text = ""
        }
    }else{
        headerLabel.text = ""
    }
    headerLabel.frame = CGRect(x: 20, y: 10, width: tableView.frame.size.width-40, height: headerLabel.intrinsicContentSize.height)
    
    headerView.addSubview(headerLabel)
    return headerView
}
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section{
    case 0:
        return 1
    case 1:
        if(Utility.shared.host_message_isfromHost) {
            return 1
        }
        return 2
    case 2:
        if(Utility.shared.host_message_isfromHost)
        {
            return 5
        }
        if let stepInfo = Utility.shared.GetAffiliateUserStep?.stepInfo as? String,stepInfo == StepInfo.Success.rawValue{
            return 1
        }
        return 4
    case 3:
        if(Utility.shared.host_message_isfromHost){
            return 3
        }
        if let stepInfo = Utility.shared.GetAffiliateUserStep?.stepInfo as? String,stepInfo == StepInfo.Success.rawValue{
            return 4
        }
        return 3
    case 4:
        if(Utility.shared.host_message_isfromHost){
            return 1
        }
        if let stepInfo = Utility.shared.GetAffiliateUserStep?.stepInfo as? String,stepInfo == StepInfo.Success.rawValue{
            return 3
        }
        return 1
    case 5:
        return 1
    default:
        return 0
    }
}
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if(indexPath.section == 0)
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderProfileCell", for: indexPath) as! HeaderProfileCell
        cell.BGView.backgroundColor =  UIColor(named: "colorController")
        if let profilename = Utility.shared.ProfileAPIArray?.firstName{
            cell.profileName.text = profilename.uppercased()
        }else{
            cell.profileName.text = ""
        }
        if let profImage = Utility.shared.ProfileAPIArray?.picture{
            cell.profileImage.sd_setImage(with: URL(string:"\(IMAGE_AVATAR_MEDIUM)\(profImage)"), placeholderImage: #imageLiteral(resourceName: "unknown"))
        }
        else
        {
            cell.profileImage.image = #imageLiteral(resourceName: "unknown")
        }
        cell.profileImage.cornerViewRadius()
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }else if indexPath.section == 1{
        let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchtohostCell", for: indexPath) as! SwitchtohostCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        if indexPath.row == 0{
            if(Utility.shared.host_message_isfromHost && !Utility.shared.getTabbar()!)
            {
                if Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification || Utility.shared.isfromBackroundBooking || Utility.shared.isfromOfflineBooking
                {
                    cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"switchtraveling") ?? "Switch to Travelling")"
                    cell.iconImage.image = UIImage(named: "travelling")
                    
                }else if (Utility.shared.ProfileAPIArray?.isAddedList == true){
                    cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"Switchhosting") ?? "Switch to Hosting")"
                    cell.iconImage.image =  #imageLiteral(resourceName: "switch-to-travelling-25")
                }
                else
                {
                    cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"becomehost") ?? "Become a Host")"
                    cell.iconImage.image =  #imageLiteral(resourceName: "switch-to-travelling-25")
                }
            }
            else{
                if(Utility.shared.ProfileAPIArray?.isAddedList == true && !Utility.shared.getTabbar()!)
                {
                    cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"Switchhosting") ?? "Switch to Hosting")"
                    cell.iconImage.image =  #imageLiteral(resourceName: "switch-to-travelling-25")
                }
                else if(Utility.shared.ProfileAPIArray?.isAddedList == false && !Utility.shared.getTabbar()!)
                {
                    cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"becomehost") ?? "Become a Host")"
                    cell.iconImage.image =  #imageLiteral(resourceName: "switch-to-travelling-25")
                }
                else
                {
                    if( Utility.shared.host_message_isfromHost) {
                        cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"switchtraveling") ?? "Switch to Travelling")"
                        cell.iconImage.image = UIImage(named: "travelling")
                    }
                    else {
                        cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"Switchhosting") ?? "Switch to Hosting")"
                        cell.iconImage.image =  #imageLiteral(resourceName: "switch-to-travelling-25")
                    }
                }
                
            }
        }else if indexPath.row == 1 {
            if(Utility.shared.GetAffiliateUserStep?.stepInfo == StepInfo.Success.rawValue){
                cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"AffiliateManager") ?? "Affiliate Manager")"
            }else{
                cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"BecomeAffiliateMarketer") ?? "Become a Affiliate Marketer")"
            }
            cell.iconImage.image =  #imageLiteral(resourceName: "switch-to-travelling-25")
        }
        
        
        return cell
    }else if indexPath.section == 2{
        if(!Utility.shared.host_message_isfromHost && Utility.shared.GetAffiliateUserStep?.stepInfo == StepInfo.Success.rawValue){
            let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchtohostCell", for: indexPath) as! SwitchtohostCell
            cell.selectionStyle = .none
            cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"AffiliateRegistrationDetails") ?? "Affiliate Registration Details")"
            cell.iconImage.image =  #imageLiteral(resourceName: "switch-to-travelling-25")
            return cell
        }else{
           return self.accountSettingsCell(tableView: tableView, indexPath: indexPath)
        }
    }else if indexPath.section == 3{
        if(!Utility.shared.host_message_isfromHost && Utility.shared.GetAffiliateUserStep?.stepInfo == StepInfo.Success.rawValue){
            return self.accountSettingsCell(tableView: tableView, indexPath: indexPath)
        }else{
            return self.supportCell(tableView: tableView, indexPath: indexPath)
        }
    }else if indexPath.section == 4{
        if(!Utility.shared.host_message_isfromHost && Utility.shared.GetAffiliateUserStep?.stepInfo == StepInfo.Success.rawValue){
            return self.supportCell(tableView: tableView, indexPath: indexPath)
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "footerProfileCell", for: indexPath) as! FooterProfileCell
            cell.selectionStyle = .none
            cell.LogOutBtn.addTarget(self, action: #selector(onClickLogOutBtn), for: .touchUpInside)
            return cell
        }
    }else{
        let cell = tableView.dequeueReusableCell(withIdentifier: "footerProfileCell", for: indexPath) as! FooterProfileCell
        cell.selectionStyle = .none
        
        cell.LogOutBtn.addTarget(self, action: #selector(onClickLogOutBtn), for: .touchUpInside)
        return cell
    }
}

    func accountSettingsCell(tableView:UITableView, indexPath:IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchtohostCell", for: indexPath) as! SwitchtohostCell
        cell.selectionStyle = .none
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        if indexPath.row == 0{
            cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey: "reviews") ?? "Reviews")"
            cell.iconImage.image =  UIImage(named: "ReviewStar")
        }else if indexPath.row == 1{
            if(Utility.shared.host_message_isfromHost )
            {
                cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"payoutpreference") ?? "Payout preference")"
                cell.iconImage.image =  #imageLiteral(resourceName: "payment-25")
            }
            else {
                cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"settings") ?? "Settings")"
                cell.iconImage.image = UIImage(named: "profile_settings")
            }
        }else if indexPath.row == 2{
            if(Utility.shared.host_message_isfromHost )
            {
                cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"settings") ?? "Settings")"
                cell.iconImage.image = UIImage(named: "profile_settings")
            }
            else {
                cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"manage_acc") ?? "Manage your account")"
                cell.iconImage.image = UIImage(named: "Manageacc")
            }
        }else if indexPath.row == 3{
            if(Utility.shared.host_message_isfromHost)
            {
                cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"manage_acc") ?? "Manage your account")"
                cell.iconImage.image = UIImage(named: "Manageacc")
            }
            else {
                cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"about") ?? "About")"
                cell.iconImage.image = UIImage(named: "about")
            }
        }
        else{
            cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"about") ?? "About")"
            cell.iconImage.image = UIImage(named: "about")
        }
        return cell
    }
    
    
    func supportCell(tableView:UITableView, indexPath:IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchtohostCell", for: indexPath) as! SwitchtohostCell
        cell.selectionStyle = .none
        
        if indexPath.row == 1{
            cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"gethelp") ?? "Get help")"
            cell.iconImage.image =  UIImage(named: "ques-25")
        }
        else if indexPath.row == 0{
            cell.profileSettingLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"termsprivacy"))!)"
            cell.iconImage.image =  UIImage(named: "privacyicon")
        }
        else{
            cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"givefeed") ?? "Give us feedback")"
            cell.iconImage.image =  UIImage(named: "fedback")
            
            if Utility.shared.isRTLLanguage(){
                cell.iconImage.performRTLTransform()
            }
        }
        return cell
    }

    
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if(indexPath.section == 0)
    {
        if Utility.shared.isConnectedToNetwork(){
            let editprofileobj = EditProfileVC()
            editprofileobj.EditProfileArray = Utility.shared.ProfileAPIArray
            editprofileobj.modalPresentationStyle = .fullScreen
            self.present(editprofileobj, animated: true, completion: nil)
        }
        else{
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
            if IS_IPHONE_X || IS_IPHONE_XR {
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-150, width: FULLWIDTH, height: 55)
            }else{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-100, width: FULLWIDTH, height: 55)
            }
        }
    }else if indexPath.section == 1{
        if Utility.shared.isConnectedToNetwork(){
            if (indexPath.row == 0){
                
                if(!Utility.shared.getTabbar()!)
                {
                    
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    Utility.shared.isfromGuestProfile = true
                    
                    
                    Utility.shared.host_message_isfrommessage = true
                    Utility.shared.host_message_isfromHost = true
                    
                    let SplashObj = SwitchTravelAndHostVC()
                    
                    if Utility.shared.isfromNotificationHost || Utility.shared.isfromOfflineNotification || Utility.shared.isfromBackroundBooking || Utility.shared.isfromOfflineBooking{
                        Utility.shared.isfromHost = true
                        Utility.shared.isfromNotificationHost = false
                        Utility.shared.isfromOfflineNotification = false
                        Utility.shared.isfromBackroundBooking = false
                        Utility.shared.isfromOfflineBooking = false
                        Utility.shared.isfromGuestProfile = false
                    }else{
                        Utility.shared.isfromHost = false
                    }
                    SplashObj.modalPresentationStyle = .fullScreen
                    self.present(SplashObj, animated: false) {
                        // appDelegate.settingRootViewControllerFunction()
                    }
                    
                    
                    
                }
                else
                {
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    Utility.shared.setTab(index: 0)
                    Utility.shared.isfromGuestProfile = false
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
                    Utility.shared.isfromHost = true
                    let switchObj = SwitchTravelAndHostVC()
                    switchObj.modalPresentationStyle = .fullScreen
                    self.view.window?.rootViewController!.present(switchObj, animated: false) {
                    }
                    
                }
            }else{
                if(!Utility.shared.host_message_isfromHost && Utility.shared.GetAffiliateUserStep?.stepInfo == StepInfo.Success.rawValue){
                    if let tabbar = self.tabBarController as? CustomAffiliateTabbar{
                        tabbar.selectedIndex = 0
                    }else{
                        Utility.shared.setAffiliateTab(index: 0)
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: "CustomAffiliateTabbar") as! CustomAffiliateTabbar
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true, completion: nil)
                    }
                }else{
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "AffiliateRegistration") as! AffiliateRegistration
                    vc.delegate = self
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                }
            }
        } else{
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
            if IS_IPHONE_X || IS_IPHONE_XR {
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-150, width: FULLWIDTH, height: 55)
            }else{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-100, width: FULLWIDTH, height: 55)
            }
        }
    }else if indexPath.section == 2{
        if(!Utility.shared.host_message_isfromHost && Utility.shared.GetAffiliateUserStep?.stepInfo == StepInfo.Success.rawValue){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "AffiliateRegistration") as! AffiliateRegistration
            vc.delegate = self
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }else{
            self.didSelectAccountSetting(indexPath: indexPath)
        }
    }else if indexPath.section == 3{
        if(!Utility.shared.host_message_isfromHost && Utility.shared.GetAffiliateUserStep?.stepInfo == StepInfo.Success.rawValue){
            self.didSelectAccountSetting(indexPath: indexPath)
        }else{
            self.didSelectSupport(indexPath: indexPath)
        }
    }else if indexPath.section == 4{
        if(!Utility.shared.host_message_isfromHost && Utility.shared.GetAffiliateUserStep?.stepInfo == StepInfo.Success.rawValue){
            self.didSelectSupport(indexPath: indexPath)
        }
    }
}

    func didSelectAccountSetting(indexPath:IndexPath){
        if (indexPath.row == 0){
            let reviewsObj = ViewReviewPage()
            reviewsObj.modalPresentationStyle = .fullScreen
            self.present(reviewsObj, animated: true, completion: nil)
        }
        if(indexPath.row == 1)
        {
            if(Utility.shared.host_message_isfromHost )
            {
                let payoutObj = PayoutPreferenceVC()
                payoutObj.modalPresentationStyle = .fullScreen
                self.view.window?.rootViewController?.present(payoutObj, animated: true, completion: nil)
            }
            else {
                let settingsObj = SettingsPageVC()
                settingsObj.modalPresentationStyle = .fullScreen
                self.present(settingsObj, animated: true, completion: nil)
            }
            
        }
        if (indexPath.row == 2)
        {
            if(Utility.shared.host_message_isfromHost )
            {
                let settingsObj = SettingsPageVC()
                settingsObj.modalPresentationStyle = .fullScreen
                self.present(settingsObj, animated: true, completion: nil)
            }
            else {
                let settingsObj = ManageAccVC()
                settingsObj.modalPresentationStyle = .fullScreen
                self.present(settingsObj, animated: true, completion: nil)
            }
        }
        if (indexPath.row == 3)
        {
            if(Utility.shared.host_message_isfromHost )
            {
                let settingsObj = ManageAccVC()
                settingsObj.modalPresentationStyle = .fullScreen
                self.present(settingsObj, animated: true, completion: nil)
            }
            else {
                let webviewobj = AboutPageVC()
                webviewobj.modalPresentationStyle = .fullScreen
                self.present(webviewobj, animated: true, completion: nil)
            }
        }
        if(indexPath.row == 4)
        {
            let webviewobj = AboutPageVC()
            webviewobj.modalPresentationStyle = .fullScreen
            self.present(webviewobj, animated: true, completion: nil)
        }
    }
    
    func didSelectSupport(indexPath:IndexPath){
        if(indexPath.row == 1)
        {
            let webviewObj = WebviewVC()
            webviewObj.webstring = HELP_URL
            webviewObj.isFromStaticContent = true
            webviewObj.id = 5
            webviewObj.modalPresentationStyle = .fullScreen
            webviewObj.pageTitle = "\(Utility.shared.getLanguage()?.value(forKey: "gethelp") ?? "Get Help")"
            webviewObj.webviewRedirection(webviewString:HELP_URL)
            self.present(webviewObj, animated: true, completion: nil)
            
        }
        if(indexPath.row == 0)
        {
            let webviewObj = WebviewVC()
            webviewObj.isFromStaticContent = true
            webviewObj.id = 4
            webviewObj.webstring = TERMS_URL
            webviewObj.pageTitle = "\(Utility.shared.getLanguage()?.value(forKey: "termsprivacy") ?? "Privacy Policy")"
            webviewObj.modalPresentationStyle = .fullScreen
            webviewObj.webviewRedirection(webviewString:TERMS_URL)
            self.present(webviewObj, animated: true, completion: nil)
            
            
        }
        else{
            let webviewobj = FeedbackVC()
            webviewobj.modalPresentationStyle = .fullScreen
            self.present(webviewobj, animated: true, completion: nil)
        }
    }
    
@objc func onClickLogOutBtn(){
    
    let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    
    
    // create an action
    let firstAction: UIAlertAction = UIAlertAction(title: "\((Utility.shared.getLanguage()?.value(forKey:"logout"))!)", style: .destructive) { action -> Void in
        Utility.shared.isfromGuestProfile = false
        Utility.shared.isaboutmechanged = false
        Utility.shared.selectedLanguage = ""
        Utility.shared.selectedphoneNumber = ""
        Utility.shared.selectedCurrency = ""
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
     //   Utility.shared.EditProfileArray?.picture = nil
        if(Utility.shared.isSwitchEnable)
        {
            Utility.shared.isSwitchEnable = false
        }
        Utility.shared.TotalFilterCount = 0
        
//        Utility.shared.ProfileAPIArray = PTProAPI.GetProfileQuery.Data.UserAccount.Result?
        
        Utility.shared.userName  =  ""
        Utility.shared.pickedimageString = ""
        self.userlogoutAPICall()
    }
    
    let cancelAction: UIAlertAction = UIAlertAction(title: "\((Utility.shared.getLanguage()?.value(forKey:"cancel"))!)", style: .cancel) { action -> Void in }
    
    // add actions
    actionSheetController.addAction(firstAction)
    actionSheetController.addAction(cancelAction)
    
    // present an actionSheet...
    present(actionSheetController, animated: true, completion: nil)
}
@IBAction func retryBtnTapped(_ sender: Any){
    if Utility.shared.isConnectedToNetwork(){
        self.offlineView.isHidden = true
    }
}


// MARK: LanguageAPI Calling Function

func LanguageAPICall()
{
    if Utility.shared.isConnectedToNetwork(){
        let languageQuery = PTProAPI.UserLanguageQuery()
        Network.shared.apollo_headerClient.fetch(query: languageQuery){ response in
            switch response {
            case .success(let result):
                
                guard (result.data?.userLanguages?.result) != nil else{
                    self.view.makeToast(result.data?.userLanguages?.errorMessage)
                    return
                }
                
                Utility.shared.LanguageDataArray.removeAll()
                Utility.shared.LanguageDataArray = ((result.data?.userLanguages?.result)!) as! [PTProAPI.UserLanguageQuery.Data.UserLanguages.Result]
                // self.languageTable.reloadData()
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }
    else
    {
        self.offlineView.isHidden = false
        // self.doneBtn.isHidden = true
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
            offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-150, width: FULLWIDTH, height: 55)
        }else{
            offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-55, width: FULLWIDTH, height: 55)
        }
    }
}
func logoutCall()
{
    UserDefaults.standard.removeObject(forKey: "user_token")
    UserDefaults.standard.removeObject(forKey: "user_id")
    UserDefaults.standard.removeObject(forKey: "password")
    UserDefaults.standard.removeObject(forKey: "currency_rate")
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let welcomeObj = WelcomePageVC()
    appDelegate.setInitialViewController(initialView: welcomeObj)
}

func userlogoutAPICall(){
    if Utility.shared.isConnectedToNetwork(){
        let logoutMutation = PTProAPI.LogoutMutation(deviceType: "iOS", deviceId:Utility.shared.pushnotification_devicetoken)
        Network.shared.apollo_headerClient.perform(mutation:logoutMutation){ response in
            switch response {
            case .success(let result):
                if let data = result.data?.userLogout?.status,data == 200         {
                    self.logoutCall()
                    print("loggedout")
                }
                else if(result.data?.userLogout?.errorMessage ==  "You haven\'t logged in.")
                {
                    self.logoutCall()
                }
                else {
                    self.view.makeToast(result.data?.userLogout?.errorMessage)
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }else {
        self.offlineView.isHidden = false
        // self.doneBtn.isHidden = true
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
            offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-85, width: FULLWIDTH, height: 55)
        }else{
            offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-55, width: FULLWIDTH, height: 55)
        }
    }
}

// MARK: Currency API Call

func currencyAPICall()
{
    if Utility.shared.isConnectedToNetwork(){
        let currencyQuery = PTProAPI.GetCurrenciesListQuery()
        Network.shared.apollo_headerClient.fetch(query: currencyQuery){ response in
            switch response {
            case .success(let result):
                guard (result.data?.getCurrencies?.results) != nil else{
                    self.view.makeToast(result.data?.getCurrencies?.errorMessage)
                    return
                }
                Utility.shared.currencyDataArray = ((result.data?.getCurrencies?.results)!) as! [PTProAPI.GetCurrenciesListQuery.Data.GetCurrencies.Result]
                Utility.shared.currencyvalue = Utility.shared.currencyDataArray.first!.symbol != nil ?
                Utility.shared.currencyDataArray.first!.symbol! : ""
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
            offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-85, width: FULLWIDTH, height: 55)
        }else{
            offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-55, width: FULLWIDTH, height: 55)
        }
    }
}
    
    // MARK: Get API Call
    func userStepInfoUpdate() {
        self.getAffiliateUserStepAPICall()
    }

    func getAffiliateUserStepAPICall()
    {
        if Utility.shared.isConnectedToNetwork() {
            if (Utility.shared.getCurrentUserID() != nil){
                self.lottieAnimation()
                let affiliateUserQuery = PTProAPI.GetAffiliateUserStepQuery(userId: .some((Utility.shared.getCurrentUserID() ?? "") as String))
                Network.shared.apollo_headerClient.fetch(query: affiliateUserQuery){ response in
                    switch response {
                    case .success(let result):
                        if let status = result.data?.getAffiliateUserStep?.status,status == 200{
                            if let GetAffiliateUserStep = result.data?.getAffiliateUserStep{
                                Utility.shared.GetAffiliateUserStep = GetAffiliateUserStep
                            }
                            self.intializeAffiliateRegistration()
                        }else{
                            self.view.makeToast(result.data?.getAffiliateUserStep?.errorMessage)
                        }
                        self.lottieView.isHidden = true
                        break
                    case .failure(let error):
                        self.view.makeToast(error.localizedDescription)
                        self.lottieView.isHidden = true
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
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-85, width: FULLWIDTH, height: 55)
            }else{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-55, width: FULLWIDTH, height: 55)
            }
        }
    }
    
    func intializeAffiliateRegistration(){
        self.profileTable.reloadData()
    }
}

enum StepInfo: String{
    case None = "None"
    case Account = "Account"
    case Website = "Website"
    case Documents = "Documents"
    case Success = "Success"
}

extension StringProtocol {
    var firstUppercased: String {
        return prefix(1).uppercased() + dropFirst()
    }
    var firstCapitalized: String {
        return String(prefix(1)).capitalized + dropFirst()
    }
}
