//
//  SocialSigninPage.swift
//  App
//
//  Created by RadicalStart on 8/1/2020.
//  Copyright © 2020 RADICAL START. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn
import Lottie
import AuthenticationServices

class SocialSigninPage: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var Close_Button: UIButton!
    @IBOutlet var appleView: UIView!
    @IBOutlet var facebookView: UIView!
    @IBOutlet var googleView: UIView!
    @IBOutlet var appleView_Label: UILabel!
    @IBOutlet var appleView_imageView: UIImageView!
    @IBOutlet var facebookView_Label: UILabel!
    @IBOutlet var facebookView_imageView: UIImageView!
    @IBOutlet var googleView_label: UILabel!
    @IBOutlet var googleView_imageView: UIImageView!
    
    @IBOutlet var ImageView: UIImageView!
    
    @IBOutlet var socialloginView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        GIDSignIn.sharedInstance().delegate = self
//        GIDSignIn.sharedInstance()?.presentingViewController = self
        welcomeLabel.text = String(format:"\((Utility.shared.getLanguage()?.value(forKey:"welcome_rent"))!)",appName)
        appleView_imageView.image = #imageLiteral(resourceName: "apple-black-shape-logo-with-a-bite-hole")
        appleView_Label.text = "\((Utility.shared.getLanguage()?.value(forKey: "appleSignin"))!)"
        appleView_Label.textColor = .white
        appleView.layer.cornerRadius = 28.0
        appleView.clipsToBounds = true
        socialloginView.frame = CGRect(x: 0, y: 0, width: FULLWIDTH, height: FULLHEIGHT)
        
        welcomeLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        welcomeLabel.font = UIFont(name: APP_FONT_BOLD, size: 30)
        appleView_Label.font = UIFont(name: APP_FONT_MEDIUM, size: 19)
        facebookView_Label.font = UIFont(name: APP_FONT_MEDIUM, size: 19)
        googleView_label.font = UIFont(name: APP_FONT_MEDIUM, size: 19)
        self.socialloginView.applyGradient(colours:Theme.LOGIN_GRADIENT_PRIMARY_COLOR)
        self.view.applyGradient(colours: Theme.LOGIN_GRADIENT_PRIMARY_COLOR)
       
        facebookView_Label.text = "\((Utility.shared.getLanguage()?.value(forKey: "facebook_login"))!)"
        facebookView.layer.cornerRadius = 28.0
        facebookView_Label.textColor = .white
        facebookView.clipsToBounds = true
         let facebookGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(faceBookLogin))
        facebookView.addGestureRecognizer(facebookGesture)
        googleView.backgroundColor = Theme.SECONDARY_COLOR
        facebookView_imageView.image = #imageLiteral(resourceName: "fb_logo").withRenderingMode(.alwaysTemplate)
        facebookView_imageView.tintColor = .white
        googleView_imageView.image = #imageLiteral(resourceName: "g_logo").withRenderingMode(.alwaysTemplate)
        googleView_imageView.tintColor = .white
        googleView_label.text = "\((Utility.shared.getLanguage()?.value(forKey: "google_login"))!)"
        googleView_label.textColor = .white
        googleView.layer.cornerRadius = 28.0
        googleView.clipsToBounds = true
        
        let GoogleGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(googleLogin))
        googleView.addGestureRecognizer(GoogleGesture)
        
        let AppleGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(applelogin))
        appleView.addGestureRecognizer(AppleGesture)
        if Utility.shared.isRTLLanguage() {
            Close_Button.imageView?.performRTLTransform()
            appleView_Label.textAlignment = .right
            facebookView_Label.textAlignment = .right
            googleView_label.textAlignment = .right
        }
    }
    @objc func applelogin(){
        if Utility.shared.isConnectedToNetwork(){
        if #available(iOS 13.0, *) {
        let authorizationProvider = ASAuthorizationAppleIDProvider()
                let request = authorizationProvider.createRequest()
                request.requestedScopes = [.fullName, .email]
              let authorizationController = ASAuthorizationController(authorizationRequests: [request])
               authorizationController.delegate = self // ASAuthorizationControllerDelegate
               authorizationController.presentationContextProvider = self // ASAuthorizationControllerPresentationContextProviding
               authorizationController.performRequests()
        }
        else
        {
            
            
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey: "appleloginalert"))!)")
        }
        }
        else
        {
           self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey: "error_field"))!)")
        }
    }

    @objc func faceBookLogin(){
        
        let fbLoginManager : LoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["public_profile", "email"], from: self) { (result, error) in

            if (error == nil){
                let fbloginresult : LoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email"))
                    {   self.facebookSignup()
                        LoginManager().logOut()
                    }
                }
            }
        }
        
    }

    func facebookSignup(){
        let graphRequest : GraphRequest = GraphRequest(graphPath: "me", parameters:["fields": "id, name, first_name, last_name, picture.type(large), email"])
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
            }
            else
            {
                let userName  = result as! NSDictionary
                
                let name = userName.value(forKey: "name") as! NSString
                
                let profile = userName.value(forKey: "picture") as! NSDictionary
                
                let data = profile.value(forKey: "data")as! NSDictionary
                let url = data.value(forKey: "url") as! String
                if let userEmail = userName.value(forKey: "email") as? NSString{
                    
                    
                    
                    let params = [
                        
                        "first_name": "\(name)",
                        "email": "\(userEmail)",
                        
                    ]
                    let signupMutation = PTProAPI.SocialLoginQuery(firstName: .some("\(name)"), lastName: "", email: "\(userEmail)", dateOfBirth: "", deviceType: "iOS", deviceDetail: "", deviceId:Utility.shared.pushnotification_devicetoken, registerType: "facebook", gender: "", profilePicture:.some("\(url)"))
                    
                    Network.shared.apollo_headerClient.fetch(query: signupMutation,cachePolicy:.fetchIgnoringCacheData){  response in
                        switch response {
                        case .success(let result):
                            if let data = result.data?.userSocialLogin?.status,data == 200 {
                                Utility.shared.signupArray.removeAllObjects()
                                Utility.shared.signupdataArray.removeAll()
                                Utility.shared.setopenTabbar(iswhichtabbar:false)
                                if let token = result.data?.userSocialLogin?.result?.userToken {
                                    Utility.shared.setUserToken(userID:token as NSString)
                                }
                                //Utility.shared.setUserToken(userID: (result.data?.userSocialLogin?.result?.userToken as AnyObject) as! NSString)
                                if let userid = result.data?.userSocialLogin?.result?.userId {
                                    Utility.shared.setUserID(userid:userid as NSString)
                                }
                                //Utility.shared.setUserID(userid: (result.data?.userSocialLogin?.result?.userId as AnyObject)as! NSString)
                                if(result.data?.userSocialLogin?.result?.user?.preferredCurrency != nil)
                                {
                                    Utility.shared.setPreferredCurrency(currency_rate: (result.data?.userSocialLogin?.result?.user?.preferredCurrency as AnyObject) as! String)
                                }
                                else
                                {
                                    Utility.shared.setPreferredCurrency(currency_rate:"USD")
                                    Utility.shared.selectedCurrency = "USD"
                                }
                                if let firstName = result.data?.userSocialLogin?.result?.user?.firstName {
                                    Utility.shared.signupdataArray.append(firstName as AnyObject)
                                }
                                if let createdAt = result.data?.userSocialLogin?.result?.user?.createdAt {
                                    Utility.shared.signupdataArray.append(createdAt as AnyObject)
                                }
                                if let picture = result.data?.userSocialLogin?.result?.user?.picture {
                                    Utility.shared.signupdataArray.append(picture as AnyObject)
                                }
                                if let isEmailConfirmed = result.data?.userSocialLogin?.result?.user?.verification?.isEmailConfirmed {
                                    Utility.shared.signupdataArray.append(isEmailConfirmed as AnyObject)
                                }
                                if let isIdVerification = result.data?.userSocialLogin?.result?.user?.verification?.isIdVerification {
                                    Utility.shared.signupdataArray.append(isIdVerification as AnyObject)
                                }
                                if let isFacebookConnected = result.data?.userSocialLogin?.result?.user?.verification?.isFacebookConnected {
                                    Utility.shared.signupdataArray.append(isFacebookConnected as AnyObject)
                                }
                                if let isPhoneVerified = result.data?.userSocialLogin?.result?.user?.verification?.isPhoneVerified {
                                    Utility.shared.signupdataArray.append(isPhoneVerified as AnyObject)
                                }
                                if let isGoogleConnected = result.data?.userSocialLogin?.result?.user?.verification?.isGoogleConnected {
                                    Utility.shared.signupdataArray.append(isGoogleConnected as AnyObject)
                                }
                                if let userToken = result.data?.userSocialLogin?.result?.userToken {
                                    Utility.shared.user_token = userToken
                                }
                                //Utility.shared.user_token  = (result.data?.userSocialLogin?.result?.userToken)! //usertoken
                                Utility.shared.setTab(index: 0)
                                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                                
                                self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
                                
                                appDelegate.GuestTabbarInitialize(initialView: CustomTabbar())
                                
                                
                            } else {
                                Utility.shared.showAlert(msg:((result.data?.userSocialLogin?.errorMessage)!))
                            }
                        case .failure(let error):
                            Utility.shared.showAlert(msg:error.localizedDescription)
                        }
                        
                    }
                }else{
                    self.view.makeToast("\(Utility.shared.getLanguage()?.value(forKey: "Email_Not_Received") ?? "Email not exist in your FB account, please use another one to sign in.")")
                }
            }
        })
        
    }

    @objc func googleLogin(){
        
        URLCache.shared.removeAllCachedResponses()
        
        if let cookies = HTTPCookieStorage.shared.cookies {
            for cookie in cookies {
                HTTPCookieStorage.shared.deleteCookie(cookie)
            }
        }
        GIDSignIn.sharedInstance.signOut()
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { result, error in
            guard error == nil else { return }
            
            
            let name = result?.user.profile?.name
            let email = result?.user.profile?.email
            let userImageURL = result?.user.profile?.imageURL(withDimension: 200)!
            
            
            
            let params = [
                "name": "\(name ?? "")",
                "email": "\(email ?? "")",
                "image": "\(userImageURL)"
            ]
            
            let signupMutation = PTProAPI.SocialLoginQuery(firstName: .some("\(name ?? "")"), lastName: "", email: "\(email ?? "")", dateOfBirth: "", deviceType: "iOS", deviceDetail: "", deviceId:Utility.shared.pushnotification_devicetoken, registerType: "google", gender: "", profilePicture:.some("\(userImageURL)"))
            
            Network.shared.apollo_headerClient.fetch(query: signupMutation,cachePolicy:.fetchIgnoringCacheData){  response in
                switch response {
                case .success(let result):
                    if let data = result.data?.userSocialLogin?.status,data == 200 {
                        Utility.shared.setopenTabbar(iswhichtabbar:false)
                        Utility.shared.signupArray.removeAllObjects()
                        Utility.shared.signupdataArray.removeAll()
                        if let token = result.data?.userSocialLogin?.result?.userToken {
                            Utility.shared.setUserToken(userID:token as NSString)
                        }
                        if let userid = result.data?.userSocialLogin?.result?.userId {
                            Utility.shared.setUserID(userid:userid as NSString)
                        }
                        
                        if(result.data?.userSocialLogin?.result?.user?.preferredCurrency != nil)
                        {
                            Utility.shared.setPreferredCurrency(currency_rate: (result.data?.userSocialLogin?.result?.user?.preferredCurrency as AnyObject) as! String)
                        }
                        else
                        {
                            Utility.shared.setPreferredCurrency(currency_rate:"USD")
                            Utility.shared.selectedCurrency = "USD"
                        }
                        if let firstName = result.data?.userSocialLogin?.result?.user?.firstName {
                            Utility.shared.signupdataArray.append(firstName as AnyObject)
                        }
                        if let createdAt = result.data?.userSocialLogin?.result?.user?.createdAt {
                            Utility.shared.signupdataArray.append(createdAt as AnyObject)
                        }
                        if let picture = result.data?.userSocialLogin?.result?.user?.picture {
                            Utility.shared.signupdataArray.append(picture as AnyObject)
                        }
                        if let isEmailConfirmed = result.data?.userSocialLogin?.result?.user?.verification?.isEmailConfirmed {
                            Utility.shared.signupdataArray.append(isEmailConfirmed as AnyObject)
                        }
                        if let isIdVerification = result.data?.userSocialLogin?.result?.user?.verification?.isIdVerification {
                            Utility.shared.signupdataArray.append(isIdVerification as AnyObject)
                        }
                        if let isFacebookConnected = result.data?.userSocialLogin?.result?.user?.verification?.isFacebookConnected {
                            Utility.shared.signupdataArray.append(isFacebookConnected as AnyObject)
                        }
                        if let isPhoneVerified = result.data?.userSocialLogin?.result?.user?.verification?.isPhoneVerified {
                            Utility.shared.signupdataArray.append(isPhoneVerified as AnyObject)
                        }
                        if let isGoogleConnected = result.data?.userSocialLogin?.result?.user?.verification?.isGoogleConnected {
                            Utility.shared.signupdataArray.append(isGoogleConnected as AnyObject)
                        }
                        if let userToken = result.data?.userSocialLogin?.result?.userToken {
                            Utility.shared.user_token = userToken
                        }
                        
                        Utility.shared.setTab(index: 0)
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        
                        self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
                        
                        
                        appDelegate.GuestTabbarInitialize(initialView: CustomTabbar())
                        
                        
                    } else {
                        Utility.shared.showAlert(msg:((result.data?.userSocialLogin?.errorMessage) != nil ? ((result.data?.userSocialLogin?.errorMessage)!) : ""))
                    }
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                }
                
                
            }
            // If sign in succeeded, display the app's main content View.
        }
        
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if(error == nil)
        {
            
            let name = user.profile?.name
            let email = user.profile?.email
            let userImageURL = user.profile?.imageURL(withDimension: 200)!
            
            
            
            let params = [
                "name": "\(name ?? "")",
                "email": "\(email ?? "")",
                "image": "\(userImageURL)"
            ]
            
            let signupMutation = PTProAPI.SocialLoginQuery(firstName: .some("\(name ?? "")"), lastName: .some(""), email: "\(email ?? "")", dateOfBirth: .some(""), deviceType: "iOS", deviceDetail: "", deviceId:Utility.shared.pushnotification_devicetoken, registerType: .some("google"), gender: .some(""), profilePicture:.some("\(userImageURL)"))
            
            Network.shared.apollo_headerClient.fetch(query: signupMutation,cachePolicy:.fetchIgnoringCacheData){  response in
                switch response {
                case .success(let result):
                    if let data = result.data?.userSocialLogin?.status,data == 200 {
                        Utility.shared.setopenTabbar(iswhichtabbar:false)
                        Utility.shared.signupArray.removeAllObjects()
                        Utility.shared.signupdataArray.removeAll()
                        if let token = result.data?.userSocialLogin?.result?.userToken {
                            Utility.shared.setUserToken(userID:token as NSString)
                        }
                        //Utility.shared.setUserToken(userID: (result.data?.userSocialLogin?.result?.userToken as AnyObject) as! NSString)
                        if let userid = result.data?.userSocialLogin?.result?.userId {
                            Utility.shared.setUserID(userid:userid as NSString)
                        }
                        //Utility.shared.setUserID(userid: (result.data?.userSocialLogin?.result?.userId as AnyObject)as! NSString)
                        if(result.data?.userSocialLogin?.result?.user?.preferredCurrency != nil)
                        {
                            Utility.shared.setPreferredCurrency(currency_rate: (result.data?.userSocialLogin?.result?.user?.preferredCurrency as AnyObject) as! String)
                        }
                        else
                        {
                            Utility.shared.setPreferredCurrency(currency_rate:"USD")
                            Utility.shared.selectedCurrency = "USD"
                        }
                        if let firstName = result.data?.userSocialLogin?.result?.user?.firstName {
                            Utility.shared.signupdataArray.append(firstName as AnyObject)
                        }
                        if let createdAt = result.data?.userSocialLogin?.result?.user?.createdAt {
                            Utility.shared.signupdataArray.append(createdAt as AnyObject)
                        }
                        if let picture = result.data?.userSocialLogin?.result?.user?.picture {
                            Utility.shared.signupdataArray.append(picture as AnyObject)
                        }
                        if let isEmailConfirmed = result.data?.userSocialLogin?.result?.user?.verification?.isEmailConfirmed {
                            Utility.shared.signupdataArray.append(isEmailConfirmed as AnyObject)
                        }
                        if let isIdVerification = result.data?.userSocialLogin?.result?.user?.verification?.isIdVerification {
                            Utility.shared.signupdataArray.append(isIdVerification as AnyObject)
                        }
                        if let isFacebookConnected = result.data?.userSocialLogin?.result?.user?.verification?.isFacebookConnected {
                            Utility.shared.signupdataArray.append(isFacebookConnected as AnyObject)
                        }
                        if let isPhoneVerified = result.data?.userSocialLogin?.result?.user?.verification?.isPhoneVerified {
                            Utility.shared.signupdataArray.append(isPhoneVerified as AnyObject)
                        }
                        if let isGoogleConnected = result.data?.userSocialLogin?.result?.user?.verification?.isGoogleConnected {
                            Utility.shared.signupdataArray.append(isGoogleConnected as AnyObject)
                        }
                        if let userToken = result.data?.userSocialLogin?.result?.userToken {
                            Utility.shared.user_token = userToken
                        }
                        Utility.shared.setTab(index: 0)
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        
                        self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
                        
                        
                        appDelegate.GuestTabbarInitialize(initialView: CustomTabbar())
                        
                        
                    } else {
                        Utility.shared.showAlert(msg:((result.data?.userSocialLogin?.errorMessage) != nil ? ((result.data?.userSocialLogin?.errorMessage)!) : ""))
                    }
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                }
                
            }
            
            
        }
    }
    
    @IBAction func close_tapped(_ sender: Any) {
        
        self.dismiss(animated: false, completion: nil)
    }
    
}
extension SocialSigninPage: ASAuthorizationControllerDelegate {
    
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential else {
            return
        
        }
        
        if(appleIDCredential.email != nil)
        {
            KeychainService.saveEmail(email: "\(appleIDCredential.email!)" as NSString)
            KeychainService.saveUsername(name: "\((appleIDCredential.fullName?.givenName!)!)\((appleIDCredential.fullName?.familyName)!)" as NSString)
        Utility.shared.setappleAccountname(name: "\((appleIDCredential.fullName?.givenName!)!)\((appleIDCredential.fullName?.familyName)!)")
        Utility.shared.setappleAccountEmail(email: "\(appleIDCredential.email!)")
        }
       
       
        let email = KeychainService.loadEmail() != nil ? KeychainService.loadEmail()! : ""
          
        let name = KeychainService.loadUsername() != nil ? KeychainService.loadUsername()! : ""
       
        
        let signupMutation = PTProAPI.SocialLoginQuery(firstName: .some(name as String), lastName: "", email:email as String, dateOfBirth: "", deviceType: "iOS", deviceDetail: "", deviceId:Utility.shared.pushnotification_devicetoken, registerType: "apple", gender: "", profilePicture:"")
        
        Network.shared.apollo_headerClient.fetch(query: signupMutation,cachePolicy:.fetchIgnoringCacheData){  response in
            switch response {
            case .success(let result):
                if let data = result.data?.userSocialLogin?.status,data == 200 {
                    Utility.shared.setopenTabbar(iswhichtabbar:false)
                    Utility.shared.signupArray.removeAllObjects()
                    Utility.shared.signupdataArray.removeAll()
                     if let token = result.data?.userSocialLogin?.result?.userToken {
                                                       Utility.shared.setUserToken(userID:token as NSString)
                                                   }
                                                   //Utility.shared.setUserToken(userID: (result.data?.userSocialLogin?.result?.userToken as AnyObject) as! NSString)
                                                   if let userid = result.data?.userSocialLogin?.result?.userId {
                                                       Utility.shared.setUserID(userid:userid as NSString)
                                                                      }
                                                   //Utility.shared.setUserID(userid: (result.data?.userSocialLogin?.result?.userId as AnyObject)as! NSString)
                                                   if(result.data?.userSocialLogin?.result?.user?.preferredCurrency != nil)
                                                   {
                                                   Utility.shared.setPreferredCurrency(currency_rate: (result.data?.userSocialLogin?.result?.user?.preferredCurrency as AnyObject) as! String)
                                                   }
                                                   else
                                                   {
                                                       Utility.shared.setPreferredCurrency(currency_rate:"USD")
                                                       Utility.shared.selectedCurrency = "USD"
                                                   }
                                                   if let firstName = result.data?.userSocialLogin?.result?.user?.firstName {
                                                      Utility.shared.signupdataArray.append(firstName as AnyObject)
                                                   }
                                                   if let createdAt = result.data?.userSocialLogin?.result?.user?.createdAt {
                                                       Utility.shared.signupdataArray.append(createdAt as AnyObject)
                                                   }
                                                   if let picture = result.data?.userSocialLogin?.result?.user?.picture {
                                                       Utility.shared.signupdataArray.append(picture as AnyObject)
                                                   }
                                                   if let isEmailConfirmed = result.data?.userSocialLogin?.result?.user?.verification?.isEmailConfirmed {
                                                       Utility.shared.signupdataArray.append(isEmailConfirmed as AnyObject)
                                                   }
                                                   if let isIdVerification = result.data?.userSocialLogin?.result?.user?.verification?.isIdVerification {
                                                       Utility.shared.signupdataArray.append(isIdVerification as AnyObject)
                                                   }
                                                   if let isFacebookConnected = result.data?.userSocialLogin?.result?.user?.verification?.isFacebookConnected {
                                                       Utility.shared.signupdataArray.append(isFacebookConnected as AnyObject)
                                                   }
                                                   if let isPhoneVerified = result.data?.userSocialLogin?.result?.user?.verification?.isPhoneVerified {
                                                       Utility.shared.signupdataArray.append(isPhoneVerified as AnyObject)
                                                   }
                                                   if let isGoogleConnected = result.data?.userSocialLogin?.result?.user?.verification?.isGoogleConnected {
                                                       Utility.shared.signupdataArray.append(isGoogleConnected as AnyObject)
                                                   }
                                                    if let userToken = result.data?.userSocialLogin?.result?.userToken {
                                                                          Utility.shared.user_token = userToken
                                                                      }//usertoken
                    Utility.shared.setTab(index: 0)
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate

                    self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)


                    appDelegate.GuestTabbarInitialize(initialView: CustomTabbar())


                } else {
                    Utility.shared.showAlert(msg:((result.data?.userSocialLogin?.errorMessage)!))
               }
            case .failure(let error):
                Utility.shared.showAlert(msg:error.localizedDescription)
            }
        }
        print("AppleID Credential Authorization: userId: \(appleIDCredential.user), email: \(String(describing: appleIDCredential.email))")
        
    }
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("AppleID Credential failed with error: \(error.localizedDescription)")
    }
}
extension SocialSigninPage: ASAuthorizationControllerPresentationContextProviding {
    @available(iOS 13.0, *)
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

