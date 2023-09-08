//
//  ContactusVC.swift
//  App
//
//  Created by RadicalStart on 08/06/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Apollo
import Lottie
import SwiftMessages

class ContactusVC: UIViewController,UITextViewDelegate {
    
    //MARK:************************************ IBOUTLET CONNECTIONS & VARIABLE DECLARATIONS **********************************************>
    
    @IBOutlet weak var contactTextView: UITextView!
    
    //@IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var retryBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var contactTitleLabel: UILabel!
    @IBOutlet weak var offlineView: UIView!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var contactView: UIView!
    @IBOutlet weak var topView: UIView!
    var Listid = Int()
    var reservationid = Int()
    var lottieWholeView = UIView()
    var lottieView: LottieAnimationView!
    var placeholderLabel : UILabel!
    var apollo_headerClient: ApolloClient = {
        let cache = InMemoryNormalizedCache()
        let store1 = ApolloStore(cache: cache)
        let configuration = URLSessionConfiguration.default
        // Add additional headers as needed
        configuration.httpAdditionalHeaders = ["auth": "\(Utility.shared.getCurrentUserToken()!)"] // Replace `<token>`
        let url = URL(string:graphQLEndpoint)!
        let client1 = URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil)
        let provider = DefaultInterceptorProvider(client: client1, shouldInvalidateClientOnDeinit: true, store: store1)
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url)
        return ApolloClient(networkTransport: requestChainTransport,
                            store: store1)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        offlineView.backgroundColor =  UIColor(named: "Button_Grey_Color")
        self.initialSetup()
        if(Utility.shared.isRTLLanguage()) {
                      //  backBtn.imageView?.performRTLTransform()
            contactTextView.textAlignment = .right
                                
                                        }
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true

        // Do any additional setup after loading the view.
    }
    
    func lottieanimation()
    {
        sendBtn.setTitle("", for:.normal)
        lottieView = LottieAnimationView.init(name: "animation_white")
        self.lottieWholeView.isHidden = false
      //  self.lottieWholeView.frame = CGRect(x: 0, y: 0, width: FULLWIDTH, height: FULLHEIGHT)
      //  self.lottieWholeView.backgroundColor =  UIColor(named: "Title_Header").withAlphaComponent(0.5)
      //  self.view.addSubview(lottieWholeView)
        self.lottieView.isHidden = false
        self.lottieView.frame = CGRect(x:20, y:-25, width:100, height:100)
        self.sendBtn.addSubview(self.lottieView)
        self.lottieView.backgroundColor = UIColor.white
        self.lottieView.play()
       // animation_white.json
        Timer.scheduledTimer(timeInterval:0.3, target: self, selector: #selector(autoscroll), userInfo: nil, repeats: true)
    }
    @objc func autoscroll()
    {
        self.lottieView.play()
    }
    func initialSetup()
    {
        contactTextView.layer.borderWidth = 1.0;
        contactTextView.layer.borderColor = UIColor(named: "Review_Page_Line_Color")?.cgColor
        contactTextView.layer.cornerRadius = 5.0
    
//    sendBtn.backgroundColor = Theme.PRIMARY_COLOR
//    cancelBtn.layer.masksToBounds = true
//    sendBtn.layer.cornerRadius = 6.0
//    sendBtn.layer.masksToBounds = true
   
    contactTextView.isScrollEnabled = true
   // contactTextView.layer.borderWidth = 1.0
   // contactTextView.layer.borderColor = TextBorderColor.cgColor
   
        
      
        IQKeyboardManager.shared.enable = false
        IQKeyboardManager.shared.enableAutoToolbar = true
        contactTextView.font = UIFont(name: APP_FONT, size: 14)
        lottieView = LottieAnimationView.init(name: "animation_white")
        contactTextView.delegate = self
        contactTextView.returnKeyType = .default
        contactTextView.isEditable = true
        contactTextView.text = ""
        contactTextView.isScrollEnabled = true
        placeholderLabel = UILabel()
        placeholderLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"writemessage"))!)"
        placeholderLabel.font = contactTextView.font
        placeholderLabel.numberOfLines = 0
        placeholderLabel.sizeToFit()
        contactTextView.addSubview(placeholderLabel)
        placeholderLabel.frame = CGRect(x:9, y:3, width:contactTextView.frame.size.width-20, height:30)
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.isHidden = !contactTextView.text.isEmpty
        
      
         contactTitleLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"contactus"))!)"
        let cancel = "\((Utility.shared.getLanguage()?.value(forKey:"cancel"))!)"
        let send = "\((Utility.shared.getLanguage()?.value(forKey:"send"))!)"
      
        cancelBtn.setTitle(cancel.capitalized, for: .normal)
        sendBtn.setTitle(send.capitalized, for: .normal)
     
        cancelBtn.titleLabel?.textColor = Theme.PRIMARY_COLOR
        
        contactTitleLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 14)
               sendBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 14)
        cancelBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 14)
        //keyboardFrame.origin.y
    }
    
  
   
    @IBAction func backBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtnTapped(_ sender: Any) {
          if Utility().isConnectedToNetwork(){
            if(contactTextView.text == "")
            {
                self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"messagealert"))!)")
            }
            else{
                self.lottieanimation()
            self.contactSupportAPICall(message: contactTextView.text, listId: Listid, reservationId: reservationid, userType:GUEST)
            }
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
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-95, width: FULLWIDTH, height: 55)
            }else{
                offlineView.frame = CGRect.init(x: 0, y: FULLHEIGHT-55, width: FULLWIDTH, height: 55)
            }
            
        }
    }
    
    @IBAction func retryBtnTapped(_ sender: Any) {
        if Utility().isConnectedToNetwork(){
            self.offlineView.isHidden = true
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
            self.contactSupportAPICall(message: contactTextView.text, listId: Listid, reservationId: reservationid, userType:GUEST)
        }
    }
    func contactSupportAPICall(message:String,listId:Int,reservationId:Int,userType:String)
    {
        let contactsupportQuery = ContactSupportQuery(message: message, listId: listId, reservationId: reservationId, userType: userType)
        apollo_headerClient.fetch(query: contactsupportQuery){(result,error) in
            if(result?.data?.contactSupport?.status) != 200 {
                self.view.makeToast(result?.data?.contactSupport?.errorMessage)
                return
            }
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"contacthost_alert"))!)")
            self.lottieView.isHidden = true
            self.sendBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"send_uppercase"))!)", for:.normal)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                // code to remove your view
                self.dismiss(animated: true, completion: nil)
            }
            
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
   
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.count
        return numberOfChars < 250  // 10 Limit Value
    }
}
