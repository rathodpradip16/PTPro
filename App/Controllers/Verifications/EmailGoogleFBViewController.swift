//
//  EmailGoogleFBViewController.swift
//  App
//
//  Created by RadicalStart on 08/11/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import GoogleSignIn
import Apollo
import FBSDKLoginKit
import Lottie

class EmailGoogleFBViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var VerificationTableView: UITableView!
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var titleLAbel: UILabel!
    var lottieViewbtn: LottieAnimationView!
    var google_btn_title = String()
    var facebook_btn_title = String()
    var email_btn_title = String()
    var is_fb_verify = Bool()
    var is_google_verify = Bool()
    var is_email_verify = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(Utility.shared.isRTLLanguage()) {
            backBtn.imageView?.performRTLTransform()
        }
        
        self.navigationController?.isNavigationBarHidden = true
        
        // Do any additional setup after loading the view.
        
        VerificationTableView.register(UINib(nibName: "EmailGoogleFBTableViewCell", bundle: nil), forCellReuseIdentifier: "EmailGoogleFBTableViewCell")
        VerificationTableView.estimatedRowHeight = 50
        VerificationTableView.rowHeight = UITableView.automaticDimension
        VerificationTableView.delegate = self
        VerificationTableView.dataSource = self
        topView.dropShadow(scale: true)
        titleLAbel.text = "\((Utility.shared.getLanguage()?.value(forKey:"trustverify"))!)"
        if(is_google_verify)
        {
            google_btn_title = "\((Utility.shared.getLanguage()?.value(forKey:"disconnect"))!)"
        } else {
            google_btn_title = "\((Utility.shared.getLanguage()?.value(forKey:"connect"))!)"
        }
        if(is_fb_verify)
        {
            facebook_btn_title = "\((Utility.shared.getLanguage()?.value(forKey:"disconnect"))!)"
        } else {
            facebook_btn_title = "\((Utility.shared.getLanguage()?.value(forKey:"connect"))!)"
        }
        if(is_email_verify)
        {
            email_btn_title = "\((Utility.shared.getLanguage()?.value(forKey:"verified"))!)"
        } else {
            email_btn_title = "\((Utility.shared.getLanguage()?.value(forKey:"verifyemail"))!)"
        }
        
        titleLAbel.font = UIFont(name: APP_FONT_MEDIUM, size: 17)
        
    }
    @objc func autoscrolling()
    {
        self.lottieViewbtn.play()
    }
    
    func lottienextAnimation(sender:UIButton)
    {
        lottieViewbtn = LottieAnimationView.init(name: "animation")
        self.lottieViewbtn.isHidden = false
        self.lottieViewbtn.frame = CGRect(x:sender.frame.size.width/2-50, y:-30, width:100, height:100)
        self.lottieViewbtn.backgroundColor = .red
        sender.addSubview(self.lottieViewbtn)
        self.lottieViewbtn.backgroundColor = UIColor.clear
        sender.setTitle("", for:.normal)
        self.lottieViewbtn.play()
        Timer.scheduledTimer(timeInterval:0.2, target: self, selector: #selector(autoscrolling), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func backBtnTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmailGoogleFBTableViewCell", for: indexPath)as! EmailGoogleFBTableViewCell
        cell.selectionStyle = .none
        cell.tag = indexPath.row + 2000
        cell.action_Button.tag = indexPath.row
        if indexPath.row == 0 {
            
            cell.title_label.text = "\((Utility.shared.getLanguage()?.value(forKey:"Emailaddresssmall"))!)"
            
            
            cell.logo_imageView.image = #imageLiteral(resourceName: "Verify_email")
            cell.action_Button.setTitle(email_btn_title, for: .normal)
            if(email_btn_title == "\((Utility.shared.getLanguage()?.value(forKey:"verified"))!)")
            {
                cell.action_Button.isHidden = true
                cell.action_Button.isUserInteractionEnabled = false
                cell.des_text_label.text = "\((Utility.shared.getLanguage()?.value(forKey:"verify_email"))!)"
            } else {
                cell.action_Button.isHidden = false
                cell.action_Button.isUserInteractionEnabled = true
                cell.des_text_label.text = "\((Utility.shared.getLanguage()?.value(forKey:"emailverify"))!)"
            }
            cell.action_Button.addTarget(self, action: #selector(emailBtnTapped), for: .touchUpInside)
            
        } else if indexPath.row == 1 {
            cell.title_label.text = "\((Utility.shared.getLanguage()?.value(forKey:"facebook"))!)"
            if(self.facebook_btn_title != "\((Utility.shared.getLanguage()?.value(forKey:"connect"))!)")
            {
                cell.des_text_label.text = "\(Utility.shared.getLanguage()?.value(forKey:"Facebook_Connected") ?? "Your Facebook account is connected successfully and you can now login simply using it.")"
            }else{
                cell.des_text_label.text = "\((Utility.shared.getLanguage()?.value(forKey:"connect_facebook"))!)"
            }
            cell.logo_imageView.image = #imageLiteral(resourceName: "Verify_Fb")
            cell.action_Button.setTitle(facebook_btn_title, for: .normal)
            cell.action_Button.isUserInteractionEnabled = true
            cell.action_Button.addTarget(self, action: #selector(fbBtnTapped), for: .touchUpInside)
            
        } else {
            cell.title_label.text = "\((Utility.shared.getLanguage()?.value(forKey:"google"))!)"
            if(self.google_btn_title != "\((Utility.shared.getLanguage()?.value(forKey:"connect"))!)")
            {
                cell.des_text_label.text = "\(Utility.shared.getLanguage()?.value(forKey:"Google_Connected") ?? "Your Google account is connected successfully and you can now login simply using it.")"
            }else{
                cell.des_text_label.text = "\((Utility.shared.getLanguage()?.value(forKey:"connect_google"))!)"
            }
            cell.logo_imageView.image = #imageLiteral(resourceName: "Verify_Google")
            cell.action_Button.setTitle(google_btn_title, for: .normal)
            cell.action_Button.isUserInteractionEnabled = true
            cell.action_Button.addTarget(self, action: #selector(googleBtnTapped), for: .touchUpInside)
            
        }
        cell.NewView.sizeToFit()
        return cell
    }
    @objc func emailBtnTapped(sender : UIButton)
    {
        if Utility.shared.isConnectedToNetwork(){
            if(sender.tag == 0)
            {
                self.lottienextAnimation(sender: sender)
                self.emailAPICall(sender: sender)
            }
        } else {
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"error_field"))!)")
        }
        
    }
    @objc func fbBtnTapped(sender : UIButton)
    {
        if Utility.shared.isConnectedToNetwork(){
            if(sender.tag == 1)
            {
                if(self.facebook_btn_title == "\((Utility.shared.getLanguage()?.value(forKey:"connect"))!)")
                {
                    
                    faceBookLogin(viewC: self,button: sender)
                } else {
                    self.facebookVerifyAPICall(sender: sender)
                }
            }
        } else {
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"error_field"))!)")
        }
        
    }
    @objc func googleBtnTapped(sender : UIButton)
    {
        if Utility.shared.isConnectedToNetwork(){
            if(sender.tag == 2)
            {
                if(self.google_btn_title == "\((Utility.shared.getLanguage()?.value(forKey:"connect"))!)")
                {
                    URLCache.shared.removeAllCachedResponses()
                    
                    if let cookies = HTTPCookieStorage.shared.cookies {
                        for cookie in cookies {
                            HTTPCookieStorage.shared.deleteCookie(cookie)
                        }
                    }
                    GIDSignIn.sharedInstance.signOut()
                    GIDSignIn.sharedInstance.signIn(withPresenting: self) { user, error in
                        guard error == nil else { return }
                        
                        self.googleAPICall()
                        // If sign in succeeded, display the app's main content View.
                        
                    }
                }
                else{
                    self.googleAPICall()
                }
            }
        } else {
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"error_field"))!)")
        }
    }
    func emailAPICall(sender : UIButton)
    {
        let resendAPIquery = PTProAPI.ResendConfirmEmailQuery()
        Network.shared.apollo_headerClient.fetch(query: resendAPIquery,cachePolicy: .fetchIgnoringCacheData){ response in
            switch response {
            case .success(let result):
                if let data = result.data?.resendConfirmEmail?.status,data == 200 {
                    sender.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"verifyemail"))!)", for: .normal)
                    self.view.makeToast(result.data?.resendConfirmEmail?.errorMessage)
                    self.lottieViewbtn.isHidden = true
                } else {
                    self.view.makeToast(result.data?.resendConfirmEmail?.errorMessage!)
                    self.lottieViewbtn.isHidden = true
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }
    
    func googleAPICall()
    {
        var actiontype = String()
        if(google_btn_title == "\((Utility.shared.getLanguage()?.value(forKey:"connect"))!)")
        {
            actiontype = "true"
        } else {
            actiontype = "false"
        }
        let socialloginverifyMutation = PTProAPI.SocialLoginVerifyMutation(verificationType:"google", actionType:actiontype)
        Network.shared.apollo_headerClient.perform(mutation:socialloginverifyMutation){ response in
            switch response {
            case .success(let result):
                if let data = result.data?.socialVerification?.status,data == 200 {
                    print("success")
                    if(self.google_btn_title == "\((Utility.shared.getLanguage()?.value(forKey:"connect"))!)")
                    {
                        self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"googleconnected"))!)")
                        self.google_btn_title = "\((Utility.shared.getLanguage()?.value(forKey:"disconnect"))!)"
                    } else {
                        self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"googledisconnected"))!)")
                        self.google_btn_title = "\((Utility.shared.getLanguage()?.value(forKey:"connect"))!)"
                    }
                    self.VerificationTableView.reloadData()
                } else {
                    self.view.makeToast(result.data?.socialVerification?.errorMessage!)
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if(error == nil)
        {
            self.googleAPICall()
        } else{
            
        }
        
    }
    func faceBookLogin(viewC: UIViewController ,button : UIButton)
    {
        URLCache.shared.removeAllCachedResponses()
        
        if let cookies = HTTPCookieStorage.shared.cookies {
            for cookie in cookies {
                HTTPCookieStorage.shared.deleteCookie(cookie)
            }
        }
        let fbLoginManager : LoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["public_profile", "email"], from: viewC) { (result, error) in
            if (error == nil){
                let fbloginresult : LoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email"))
                    {
                        
                        self.facebookVerifyAPICall(sender:button)
                        LoginManager().logOut()
                    }
                }
            }
        }
    }
    
    func facebookVerifyAPICall(sender : UIButton)
    {
        
        var actiontype = String()
        if(sender.currentTitle == "\((Utility.shared.getLanguage()?.value(forKey:"connect"))!)")
        {
            actiontype = "true"
        } else {
            
            actiontype = "false"
        }
        let socialloginverifyMutation = PTProAPI.SocialLoginVerifyMutation(verificationType:"facebook", actionType: actiontype)
        Network.shared.apollo_headerClient.perform(mutation:socialloginverifyMutation){ response in
            switch response {
            case .success(let result):
                if let data = result.data?.socialVerification?.status,data == 200 {
                    if(sender.currentTitle == "\((Utility.shared.getLanguage()?.value(forKey:"connect"))!)")
                    {
                        sender.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"disconnect"))!)", for:.normal)
                        self.facebook_btn_title = "\((Utility.shared.getLanguage()?.value(forKey:"disconnect"))!)"
                        self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"facebookconnected"))!)")
                        
                    } else {
                        
                        
                        sender.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"connect"))!)", for:.normal)
                        self.facebook_btn_title = "\((Utility.shared.getLanguage()?.value(forKey:"connect"))!)"
                        self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"facebookdisconnected"))!)")
                        
                    }
                    self.VerificationTableView.reloadData()
                    
                } else {
                    self.view.makeToast(result.data?.socialVerification?.errorMessage!)
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }
}

extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = Theme.TextLightColor.cgColor
        layer.shadowOpacity = 1.0
        layer.shadowOffset = .zero
        layer.shadowRadius = 1
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
