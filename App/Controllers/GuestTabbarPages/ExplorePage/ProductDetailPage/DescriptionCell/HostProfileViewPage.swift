//
//  HostProfileViewPage.swift
//  App
//
//  Created by RadicalStart on 28/11/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import Apollo
import Lottie

class HostProfileViewPage: UIViewController,UITableViewDelegate,UITableViewDataSource{

 
    @IBOutlet var lblHostName: UILabel!
    @IBOutlet var topView: UIView!
    @IBOutlet var backBtn: UIButton!
    var profileid = Int()
    var profilename = String()
    var verifiedInfoCount:Int = 0
    
    var lottieView: LottieAnimationView!
    var isfromreview: Bool = false
    
    @IBOutlet var hostprofileTable: UITableView!
    
    var apollo_headerClient: ApolloClient!
    var reiewListingArray = [PTProAPI.UserReviewsQuery.Data.UserReviews.Result]()
    var showuserprofileArray : PTProAPI.ShowUserProfileQuery.Data.ShowUserProfile.Results?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.checkApolloStatus()
        self.registerCell()
        hostprofileTable.separatorColor = .clear
        hostprofileTable.estimatedRowHeight = 200
        hostprofileTable.rowHeight = UITableView.automaticDimension
        
        
        lblHostName.textColor = UIColor(named: "Title_Header")
        
        self.view.backgroundColor = UIColor(named: "colorController")

        //set profile name
        if(profilename != "")
        {
            if(isfromreview){
                lblHostName.font = UIFont(name: APP_FONT_MEDIUM, size: 18)
                lblHostName.text = "\((Utility.shared.getLanguage()?.value(forKey:"user"))!)"
            }
            else {
           lblHostName.font = UIFont(name: APP_FONT_MEDIUM, size: 18)
           lblHostName.text = "\((Utility.shared.getLanguage()?.value(forKey:"host"))!)"
            }
        }
        lblHostName.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        
        if(Utility.shared.isRTLLanguage()){
            backBtn.rotateImageViewofBtn()
        }
        // Do any additional setup after loading the view.
    }
    
    func checkApolloStatus(){
        self.showprofileAPICall(profileid: self.profileid)
    }
  func registerCell()
  {
    hostprofileTable.register(UINib(nibName: "HostprofileviewCell", bundle: nil), forCellReuseIdentifier: "HostprofileviewCell")
    hostprofileTable.register(UINib(nibName: "AboutDynamicCell", bundle: nil), forCellReuseIdentifier: "AboutDynamicCell")
    hostprofileTable.register(UINib(nibName: "ReportuserCell", bundle: nil), forCellReuseIdentifier: "ReportuserCell")
    hostprofileTable.register(UINib(nibName: "HostVerifiedInfoCellTableViewCell", bundle: nil), forCellReuseIdentifier: "HostVerifiedInfoCellTableViewCell")
    hostprofileTable.register(UINib(nibName: "ReviewUserCell", bundle: nil), forCellReuseIdentifier: "ReviewUserCell")
      hostprofileTable.register(UINib(nibName: "VerifiedInfoCell", bundle: nil), forCellReuseIdentifier: "VerifiedInfoCell")
    }
    func lottieanimation()
    {
        
        lottieView = LottieAnimationView.init(name: "animation_white")
        
        self.lottieView.isHidden = false
        self.lottieView.frame = CGRect(x:FULLWIDTH/2-40, y:FULLHEIGHT/2-50, width:100, height:100)
        self.view.addSubview(self.lottieView)
        self.lottieView.backgroundColor = UIColor.clear
        self.lottieView.play()
        // animation_white.json
        Timer.scheduledTimer(timeInterval:0.3, target: self, selector: #selector(autoscroll), userInfo: nil, repeats: true)
    }
    @objc func autoscroll()
    {
        self.lottieView.play()
    }
    func showprofileAPICall(profileid:Int)
    {
        if Utility.shared.isConnectedToNetwork(){
            self.lottieanimation()
            let showprofileQuery = PTProAPI.ShowUserProfileQuery(profileId:.some(profileid), isUser:false)
            Network.shared.apollo_headerClient.fetch(query:showprofileQuery,cachePolicy:.fetchIgnoringCacheData){ response in
                switch response {
                case .success(let result):
                    guard (result.data?.showUserProfile?.results) != nil else
                    {
                        self.lottieView.isHidden = true
                        
                        self.view.makeToast(result.data?.showUserProfile?.errorMessage)
                        return
                    }
                    
                    self.lottieView.isHidden = true
                    self.showuserprofileArray = ((result.data?.showUserProfile?.results)!)
                    self.verifiedInfoCount = 0
                    self.hostprofileTable.reloadData()
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                }
            }
            
        }
        
        
    }
    
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if(showuserprofileArray?.userId != nil)
        {
           if(Utility.shared.unpublish_preview_check)
            {
        return 4
           } else if((Utility.shared.getCurrentUserID() != nil) && ("\(self.showuserprofileArray?.userId! ?? "")" == "\(String(describing: Utility.shared.getCurrentUserID()!))")) {

            return 5
           } else {

              return 5
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       if section == 3{
            return 50
        }
        return 0
    }
    
    func tableView( _ tableView : UITableView,  titleForHeaderInSection section: Int)->String?
    {
      
       if(section == 3)
        {
            return "\((Utility.shared.getLanguage()?.value(forKey:"verfiediinfo"))!)"
        }
        return ""
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(showuserprofileArray?.userId != nil)
        {
        
        if(section == 0)
        {
        
                return 1
            
        }
        if(section == 1)
        {
            if(showuserprofileArray?.info != nil && showuserprofileArray?.info != "")
            {
                return 1
            } else {
                return 0
            }
        }
            if(section == 2)
            {
                if(showuserprofileArray?.reviewsCount != nil && showuserprofileArray?.reviewsCount != 0)
                {
                    return 1
                } else {
                    return 0
                }
            }
        if(section == 3)
        {
            if ((showuserprofileArray?.userVerifiedInfo?.isEmailConfirmed) != false) {
                verifiedInfoCount = verifiedInfoCount + 1
            }
            if ((showuserprofileArray?.userVerifiedInfo?.isFacebookConnected) != false) {
                verifiedInfoCount = verifiedInfoCount + 1
            }
            if ((showuserprofileArray?.userVerifiedInfo?.isGoogleConnected) != false) {
                verifiedInfoCount = verifiedInfoCount + 1
            }
            if ((showuserprofileArray?.userVerifiedInfo?.isPhoneVerified) != false) {
                verifiedInfoCount = verifiedInfoCount + 1
            }
            return verifiedInfoCount
        }
            return 1
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = UILabel(frame: CGRect(x: 15, y: 0, width:FULLWIDTH - 30, height: 30))
        headerLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 18.0)
        headerLabel.textColor = UIColor(named: "Title_Header")
        headerLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
        headerLabel.numberOfLines = 0
        
        let headerView = UIView(frame: CGRect(x: 15, y: 0, width:FULLWIDTH - 30, height: 30))
        headerView.backgroundColor = UIColor.clear
        headerView.addSubview(headerLabel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HostprofileviewCell", for: indexPath)as! HostprofileviewCell
            
            if(profilename != "")
            {
                cell.nameLabel.text = "\(profilename)"
            }
            if showuserprofileArray?.picture != nil
            {
                let profImage = showuserprofileArray?.picture!
              cell.profileImage.sd_setImage(with: URL(string:"\(IMAGE_AVATAR_MEDIUM)\(profImage)"), completed: nil)
                
            } else {
               cell.profileImage.image  = #imageLiteral(resourceName: "unknown")
            }
            if (showuserprofileArray?.createdAt != nil){
                cell.memberLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"member"))!) \(getdayValue(timestamp: (showuserprofileArray?.createdAt!)!))"
            }
            
            if(showuserprofileArray?.location != nil)
            {
            cell.cityLbl.text = showuserprofileArray?.location!
            }else{
                cell.cityLbl.text = ""
            }
            cell.cityLbl.textColor = UIColor(named: "Title_Header")
            cell.selectionStyle = .none
            return cell

        } else if(indexPath.section == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AboutDynamicCell", for: indexPath)as! AboutDynamicCell
            if(showuserprofileArray?.info != nil)
            {
            cell.aboutLabel.text = showuserprofileArray?.info!
            }
            cell.selectionStyle = .none
            return cell
        } else if(indexPath.section == 2) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewUserCell", for: indexPath)as! ReviewUserCell
            if(showuserprofileArray?.reviewsCount != nil)
            {
//            if(showuserprofileArray?.reviewsCount! > 1)
//            {
                  cell.reviewBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"readall"))!) \((Utility.shared.getLanguage()?.value(forKey:"reviewssmall"))!)", for: .normal)
//            } else {
//                  cell.reviewBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"read"))!) \((Utility.shared.getLanguage()?.value(forKey:"review"))!)", for: .normal)
//            }
            }
            cell.reviewBtn.addTarget(self, action: #selector(reviewpageTapped), for: .touchUpInside)

            cell.selectionStyle = .none
            return cell
            
        }
        else if(indexPath.section == 3) {
            
                let cell = tableView.dequeueReusableCell(withIdentifier: "VerifiedInfoCell", for: indexPath)as! VerifiedInfoCell
                cell.selectionStyle = .none
            cell.infoView.isHidden = true
                
                if(indexPath.row == 0)
                {
                    if ((showuserprofileArray?.userVerifiedInfo?.isEmailConfirmed) != false) {
                        cell.imgLeftIcon.image = UIImage(named: "Verify_email")
                        
                     
                            cell.titleLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"email") ?? "Email")"
                            cell.imgRightView.image = UIImage(named: "verify_green")
                            cell.verifyConnectLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"verified"))!)"
                            cell.verifyConnectLabel.textColor = Theme.PRIMARY_COLOR
                    }
                  else  if ((showuserprofileArray?.userVerifiedInfo?.isFacebookConnected) != false) {
                        cell.imgLeftIcon.image = UIImage(named: "Verify_Fb")
                        cell.titleLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"facebook") ?? "facebook")"
                        cell.imgRightView.image = UIImage(named: "verify_green")
                        cell.verifyConnectLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"verified"))!)"
                        cell.verifyConnectLabel.textColor = Theme.PRIMARY_COLOR
                        
                    }
                  else  if ((showuserprofileArray?.userVerifiedInfo?.isGoogleConnected) != false) {
                        cell.imgLeftIcon.image = UIImage(named: "Verify_Google")
                        cell.titleLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"google") ?? "Google")"
                        cell.imgRightView.image = UIImage(named: "verify_green")
                        cell.verifyConnectLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"verified"))!)"
                        cell.verifyConnectLabel.textColor = Theme.PRIMARY_COLOR
                        
                    }
                  else  if ((showuserprofileArray?.userVerifiedInfo?.isPhoneVerified) != false) {
                        cell.imgLeftIcon.image = UIImage(named: "Phone")
                        cell.titleLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"phone") ?? "Phone")"
                        cell.imgRightView.image = UIImage(named: "verify_green")
                        cell.verifyConnectLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"verified"))!)"
                        cell.verifyConnectLabel.textColor = Theme.PRIMARY_COLOR
                    }
                   
                   
                    }
                    
                
                else if(indexPath.row == 1)
                {
                   
                    if ((showuserprofileArray?.userVerifiedInfo?.isFacebookConnected) != false) {
                        cell.imgLeftIcon.image = UIImage(named: "Verify_Fb")
                        cell.titleLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"facebook") ?? "facebook")"
                        cell.imgRightView.image = UIImage(named: "verify_green")
                        cell.verifyConnectLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"verified"))!)"
                        cell.verifyConnectLabel.textColor = Theme.PRIMARY_COLOR
                        
                        
                    }
                  else  if ((showuserprofileArray?.userVerifiedInfo?.isGoogleConnected) != false) {
                      cell.imgLeftIcon.image = UIImage(named: "Verify_Google")
                      cell.titleLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"google") ?? "Google")"
                      cell.imgRightView.image = UIImage(named: "verify_green")
                      cell.verifyConnectLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"verified"))!)"
                      cell.verifyConnectLabel.textColor = Theme.PRIMARY_COLOR
                        
                    }
                   else if ((showuserprofileArray?.userVerifiedInfo?.isPhoneVerified) != false) {
                       cell.imgLeftIcon.image = UIImage(named: "Phone")
                       cell.titleLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"phone") ?? "Phone")"
                       cell.imgRightView.image = UIImage(named: "verify_green")
                       cell.verifyConnectLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"verified"))!)"
                       cell.verifyConnectLabel.textColor = Theme.PRIMARY_COLOR
                    }
                   
                   
                }
                else if(indexPath.row == 2)
                {
                    
                    if ((showuserprofileArray?.userVerifiedInfo?.isGoogleConnected) != false) {
                        cell.imgLeftIcon.image = UIImage(named: "Verify_Google")
                        cell.titleLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"google") ?? "Google")"
                        cell.imgRightView.image = UIImage(named: "verify_green")
                        cell.verifyConnectLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"verified"))!)"
                        cell.verifyConnectLabel.textColor = Theme.PRIMARY_COLOR
                        
                    }
                    else if ((showuserprofileArray?.userVerifiedInfo?.isPhoneVerified) != false) {
                        cell.imgLeftIcon.image = UIImage(named: "Phone")
                        cell.titleLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"phone") ?? "Phone")"
                        cell.imgRightView.image = UIImage(named: "verify_green")
                        cell.verifyConnectLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"verified"))!)"
                        cell.verifyConnectLabel.textColor = Theme.PRIMARY_COLOR
                    }
                   
                    
                }else{
                    cell.imgLeftIcon.image = UIImage(named: "Phone")
                    cell.titleLabel.text = "\(Utility.shared.getLanguage()?.value(forKey:"phone") ?? "Phone")"
                    cell.imgRightView.image = UIImage(named: "verify_green")
                    cell.verifyConnectLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"verified"))!)"
                    cell.verifyConnectLabel.textColor = Theme.PRIMARY_COLOR
                    
                }
            cell.borderView.layer.cornerRadius = 5.0
            cell.leadingConstraints.constant = 15
            cell.trailingConstraints.constant = 15
                 return cell
            }
            
            
//            let cell = tableView.dequeueReusableCell(withIdentifier: "HostVerifiedInfoCellTableViewCell", for: indexPath)as! HostVerifiedInfoCellTableViewCell
//            if(showuserprofileArray?.userVerifiedInfo != nil)
//            {
//                var verifiedInfo: String = ""
//                if ((showuserprofileArray?.userVerifiedInfo?.isEmailConfirmed) != nil) {
//                    verifiedInfo =   "\((Utility.shared.getLanguage()?.value(forKey:"Email Confirmed"))!)  ,"
//                }
//                if ((showuserprofileArray?.userVerifiedInfo?.isGoogleConnected) != nil) {
//                    verifiedInfo = verifiedInfo + "\((Utility.shared.getLanguage()?.value(forKey:"Google Confirmed"))!)  ,"
//
//
//                }
//                if ((showuserprofileArray?.userVerifiedInfo?.isIdVerification) != nil){
//                    verifiedInfo = verifiedInfo + "\((Utility.shared.getLanguage()?.value(forKey:"Document Verification Done."))!)"
//
//
//
//                }
//                cell.lblDescription.text = verifiedInfo
//            }
//            cell.selectionStyle = .none
//            return cell
    
        
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReportuserCell", for: indexPath)as! ReportuserCell
            
            cell.btnReport.addTarget(self, action: #selector(reprtBtnTapped), for: .touchUpInside)
            cell.reportuserLAbel.textColor = UIColor(named: "Title_Header")
            if(isfromreview){
                cell.btnReport.setTitle("Report this user", for: .normal)
            }
            else {
                cell.btnReport.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"Report this host"))!)", for: .normal)
            }
            
//            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
            return cell
        }
        
    }
    @objc func reprtBtnTapped(){
        if Utility.shared.isConnectedToNetwork(){
            if((Utility.shared.getCurrentUserToken()) == nil || (Utility.shared.getCurrentUserToken()) == "")
            {
                let welcomeObj = WelcomePageVC()
                welcomeObj.modalPresentationStyle = .fullScreen
                self.present(welcomeObj, animated:false, completion: nil)
            }
            else
            {
                let reportPageObj = ReportuserPage()
                reportPageObj.profileid = profileid
                if(isfromreview){
                reportPageObj.isfromreview = true
                }
                else {
                    reportPageObj.isfromreview = false
                }
                 reportPageObj.modalPresentationStyle = .fullScreen
                self.present(reportPageObj, animated: false, completion: nil)
            }
        } else {
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"error_field"))!)")
            
        }
    }
    
    
    
    @objc func reviewpageTapped(){
        
//        if((Utility.shared.getCurrentUserToken()) == nil || (Utility.shared.getCurrentUserToken()) == "")
//        {
//            let welcomeObj = WelcomePageVC()
//            welcomeObj.modalPresentationStyle = .fullScreen
//            self.present(welcomeObj, animated:false, completion: nil)
//        }
//        else {
        
        let reviewpageObj = ReviewShowVC()
        reviewpageObj.profileID = profileid
        reviewpageObj.isForProfileReviews = true
        reviewpageObj.reviewcount = (showuserprofileArray?.reviewsCount != nil ? (showuserprofileArray?.reviewsCount!)! : 0)
        reviewpageObj.modalPresentationStyle = .fullScreen
        self.present(reviewpageObj, animated: false, completion: nil)
//        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 4)
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
                    let reportPageObj = ReportuserPage()
                    reportPageObj.profileid = profileid
                     reportPageObj.modalPresentationStyle = .fullScreen
                    self.present(reportPageObj, animated: false, completion: nil)
                }
            } else {
                self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"error_field"))!)")
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     if(indexPath.section == 3)
        {
            return 70
        }
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    @objc func reviewBtnTapped() {
           let reviewPageObj = ShowReviewPageVC()
           reviewPageObj.profilename = profilename
           reviewPageObj.profileid = profileid
           reviewPageObj.modalPresentationStyle = .fullScreen
           self.present(reviewPageObj, animated: false, completion: nil)
       }
    func getdayValue(timestamp:String) -> String
    {
         if(Int(timestamp) != nil ) {
        let timestamValue = Int(timestamp)!/1000
        let showDate = Date(timeIntervalSince1970:TimeInterval(timestamValue))
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "MMMM YYYY"
             if(Utility.shared.isRTLLanguage()) {
                 dateFormatter1.locale = NSLocale(localeIdentifier:"en") as Locale
             }
             else {
                 dateFormatter1.locale = NSLocale(localeIdentifier:Utility.shared.getAppLanguageCode()!) as Locale
             }
        let day = dateFormatter1.string(from: showDate)
            return day } else {
           return Utility.shared.getdateformatter1(date: timestamp)
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

