//
//  PhonekitVC.swift
//  App
//
//  Created by RadicalStart on 09/05/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import Apollo
import Lottie

class PhonekitVC: UIViewController,UITextFieldDelegate,CountryDelegate{
    func setSelectedCountry(selectedCountry: String, selectedcountryCode: String, selectdialcode: String) {
        countryBtn.setTitle(selectdialcode, for: .normal)
    }
    

    @IBOutlet var phoneContainerView: UIView!
    @IBOutlet weak var closeBtn: UIButton!
    
    @IBOutlet weak var phonedescLabel: UILabel!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var phoneView: UIView!
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var confirmphoneLabel: UILabel!
    @IBOutlet weak var countryBtn: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var phoneTF: CustomUITextField!
    var userphonekitArray : PTProAPI.GetProfileQuery.Data.UserAccount.Result?
     
    var lottieView1: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "colorController")
        
        phoneContainerView.layer.borderWidth = 1
        phoneContainerView.layer.borderColor = UIColor(named: "text_borderColor")?.cgColor
        phoneContainerView.layer.masksToBounds = true
        phoneContainerView.layer.cornerRadius = 5
        
        phoneTF.placeholder = "\((Utility.shared.getLanguage()?.value(forKey:"PhonePlaceholder"))!)"
        phoneTF.textColor = UIColor(named: "Title_Header")
        countryBtn.setTitleColor(UIColor(named: "Title_Header"), for: .normal)
        if(Utility.shared.selectedphoneNumber != "")
        {
        phoneTF.text = Utility.shared.selectedphoneNumber
        Utility.shared.isfromPhonePage = true
        }
        else {
        
            phoneTF.text = userphonekitArray?.phoneNumber != nil ? userphonekitArray?.phoneNumber! : ""
        Utility.shared.isfromPhonePage = true
        
        }
        countryBtn.setTitle(userphonekitArray?.countryCode != nil ? userphonekitArray?.countryCode! : "+1", for: .normal)
        
        let toolBar = UIToolbar().ToolbarPikerSelect(mySelect: #selector(dismissPicker))
        toolBar.barTintColor = UIColor(named: "Button_Grey_Color")
        phoneTF.inputAccessoryView = toolBar
        phoneTF.delegate = self
        phoneTF.keyboardType = .numberPad
        phoneTF.becomeFirstResponder()
        confirmphoneLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"confirmphone"))!)"
         phonedescLabel.text = String(format:"\((Utility.shared.getLanguage()?.value(forKey:"confirmtext"))!)",appName)
         phoneLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"phone"))!)"
        
        phoneLabel.textColor = UIColor(named: "Title_Header")
        phoneTF.tintColor = UIColor(named: "Title_Header")
        phonedescLabel.textColor = UIColor(named: "searchPlaces_TextColor")
        nextBtn.layer.cornerRadius = (nextBtn.frame.size.height / 2 )
        lottieView1 = LottieAnimationView.init(name: "animation_white")
        nextBtn.layer.masksToBounds = true
        // Do any additional setup after loading the view.
        countryBtn.titleLabel?.font = UIFont(name: APP_FONT, size: 12)
        phoneTF.font = UIFont(name: APP_FONT, size: 12)
         phoneLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 14)
         phonedescLabel.font = UIFont(name: APP_FONT, size: 14)
        confirmphoneLabel.font = UIFont(name: APP_FONT_SEMIBOLD, size: 24)
               nextBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
        if(Utility.shared.isRTLLanguage()){
            phoneTF.textAlignment = .right
            confirmphoneLabel.textAlignment = .right
            phonedescLabel.textAlignment = .right
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.lottieView1.isHidden = true
        if (Utility.shared.phoneNumberStatus == "1"){
            self.nextBtn.setTitle("\(Utility.shared.getLanguage()?.value(forKey:"next") ?? "Next")", for: .normal)
        }else{
            self.nextBtn.setTitle("\(Utility.shared.getLanguage()?.value(forKey:"Update") ?? "Update")", for: .normal)
        }
    }
    @objc func dismissPicker()
    {
        
            view.endEditing(true)
        
        
    }
    func lottienextanimation()
      {
         
          nextBtn.setTitle("", for:.normal)
          lottieView1 = LottieAnimationView.init(name: "animation_white")
          self.lottieView1.isHidden = false
          self.lottieView1.frame = CGRect(x:self.nextBtn.frame.width/2-50, y:-25, width:100, height:100)
          self.nextBtn.addSubview(self.lottieView1)
          self.view.bringSubviewToFront(self.lottieView1)
          self.lottieView1.backgroundColor = UIColor.clear
          self.lottieView1.play()
          Timer.scheduledTimer(timeInterval:0.3, target: self, selector: #selector(autoscroll1), userInfo: nil, repeats: true)
      }
    @objc func autoscroll1()
    {
        self.lottieView1.play()
    }
    
    
   
    func initialSetup()
    {
        self.topView.frame = CGRect(x: 0, y: 0, width: FULLWIDTH, height: 70)
        self.closeBtn.frame = CGRect(x: 8, y: 32, width: 45, height: 45)
    
        self.phoneView.frame = CGRect(x: 0, y:70, width: FULLWIDTH, height: FULLHEIGHT-70)
      
        nextBtn.layer.masksToBounds = true
       
       
    }

    @IBAction func nextBtnTapped(_ sender: Any) {
         if Utility.shared.isConnectedToNetwork(){
          self.lottienextanimation()
          self.addPhonenumberCall()
        }
        else
         {
          self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"error_field"))!)")
        }
        
    
        
    }
    func addPhonenumberCall()
    {
        let addphonenumberMutation = PTProAPI.AddPhoneNumberMutation(countryCode:(countryBtn.titleLabel?.text!)!, phoneNumber: phoneTF.text!)
        Network.shared.apollo_headerClient.perform(mutation: addphonenumberMutation){ response in
            switch response {
            case .success(let result):
                if let data = result.data?.addPhoneNumber?.status,data == 200 {
                    if result.data?.addPhoneNumber?.phoneNumberStatus == "1"{
                        self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"sentOTP"))!)")
                        DispatchQueue.main.asyncAfter(deadline:.now() + 1) {
                            let otpPageObj = VerifyOTPPage()
                            otpPageObj.EditProfileArray = self.userphonekitArray
                            otpPageObj.countrycode = self.countryBtn.titleLabel!.text!
                            otpPageObj.phoneno = self.phoneTF.text!
                            otpPageObj.modalPresentationStyle = .fullScreen
                            self.present(otpPageObj, animated: false, completion: nil)
                        }
                    }else{
                        self.dismiss(animated: true, completion: nil)
                    }
                } else {
                    self.lottieView1.isHidden = true
                    if (Utility.shared.phoneNumberStatus == "1"){
                        self.nextBtn.setTitle("\(Utility.shared.getLanguage()?.value(forKey:"next") ?? "Next")", for: .normal)
                    }else{
                        self.nextBtn.setTitle("\(Utility.shared.getLanguage()?.value(forKey:"Update") ?? "Update")", for: .normal)
                    }
                    self.view.makeToast("\((result.data?.addPhoneNumber?.errorMessage!)!)")
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }
    func EditProfileAPICall(fieldName:String,fieldValue:String)
    {
        Utility.shared.isfromPhonePage = true
        let editprofileMutation = PTProAPI.EditProfileMutation(userId: (Utility.shared.getCurrentUserID()! as String), fieldName: fieldName, fieldValue: .some(fieldValue), deviceType: "iOS", deviceId:Utility.shared.pushnotification_devicetoken)
        Network.shared.apollo_headerClient.perform(mutation: editprofileMutation){  response in
            switch response {
            case .success(let result):
                if let data = result.data?.userUpdate?.status,data == 200 {
                } else {
            self.view.makeToast(result.data?.userUpdate?.errorMessage!)
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }
    
    @IBAction func closeBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func phoneBtnTapped(_ sender: Any) {
        let countrycodeObj = CountrycodeVC()
        Utility.shared.isPhonenumberCountrycode = true
        countrycodeObj.delegate = self
         countrycodeObj.modalPresentationStyle = .fullScreen
        self.present(countrycodeObj, animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    
//    func textFieldDidBeginEditing(_ textField: UITextField)
//    {
//       phoneTF.isUserInteractionEnabled = true
//    }
//
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let charsLimit = 10
        
        let startingLength = textField.text?.count ?? 0
        let lengthToAdd = string.count
        let lengthToReplace =  range.length
        let newLength = startingLength + lengthToAdd - lengthToReplace
        
        return newLength <= charsLimit
    }
    func textFieldDidEndEditing(_ textField: UITextField){
 
    }
}
extension String {
    
    var isPhoneNumber: Bool {
        
        let charcter  = NSCharacterSet(charactersIn: "+0123456789").inverted
        var filtered:NSString!
        let inputString:NSArray = self.components(separatedBy: charcter) as NSArray
        filtered = inputString.componentsJoined(by: "") as NSString
        return (filtered != nil)
        
    }
}
