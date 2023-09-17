//
//  PayoutAddressVC.swift
//  App
//
//  Created by RadicalStart on 19/08/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class PayoutAddressVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var retryBtn: UIButton!
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var offlineView: UIView!
    
    @IBOutlet weak var nextImage: UIImageView!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var payoutAddressTable: UITableView!
    var countryText = String()
    var payout_TF_Array = [String]()
    
    @IBOutlet var lblHeader: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialsetup()
        // Do any additional setup after loading the view.
    }
    
    func initialsetup()
    {
        offlineView.backgroundColor =  UIColor(named: "Button_Grey_Color")
        self.view.backgroundColor =   UIColor(named: "colorController")
        payoutAddressTable.register(UINib(nibName: "PayoutTextfieldCell", bundle: nil), forCellReuseIdentifier: "PayoutTextfieldCell")
        payout_TF_Array = ["\((Utility.shared.getLanguage()?.value(forKey:"country"))!)","\((Utility.shared.getLanguage()?.value(forKey:"addressline1"))!)","\((Utility.shared.getLanguage()?.value(forKey:"addressline2"))!)","\((Utility.shared.getLanguage()?.value(forKey:"city"))!)","\((Utility.shared.getLanguage()?.value(forKey:"stateprovince"))!)","\((Utility.shared.getLanguage()?.value(forKey:"zipcode"))!)"]
        self.continueBtn.layer.cornerRadius = continueBtn.frame.size.height / 2
        self.continueBtn.layer.masksToBounds = true
        

        continueBtn.backgroundColor = Theme.Button_BG
       
        payoutAddressTable.rowHeight = UITableView.automaticDimension
        payoutAddressTable.estimatedRowHeight = 70
       // NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        //NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        self.offlineView.isHidden = true
        Utility.shared.payout_Address_Dict["city"] = ""
        Utility.shared.payout_Address_Dict["state"] = ""
        Utility.shared.payout_Address_Dict["zipcode"] = ""
        IQKeyboardManager.shared.enableAutoToolbar = false
        continueBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"next"))!)", for:.normal)
    errorLabel.textColor =  UIColor(named: "Title_Header")
        retryBtn.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        errorLabel.text = "\((Utility.shared.getLanguage()?.value(forKey:"error_field"))!)"
    retryBtn.setTitle("\((Utility.shared.getLanguage()?.value(forKey:"retry"))!)", for:.normal)
        lblHeader.text = "\((Utility.shared.getLanguage()?.value(forKey:"address"))!)"
        lblHeader.font = UIFont(name:APP_FONT_MEDIUM, size: 18)
        continueBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 18)
        lblHeader.textColor = UIColor(named: "Title_Header")
        
        retryBtn.titleLabel?.font = UIFont(name: APP_FONT, size: 15)
        errorLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 15)
        if(Utility.shared.isRTLLanguage()) {
                   backBtn.imageView?.performRTLTransform()
            lblHeader.textAlignment = .right

             
               }
        
        payoutAddressTable.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
    }

    @IBAction func continuebtnTapped(_ sender: Any) {
          if Utility.shared.isConnectedToNetwork(){
            self.view.endEditing(true)
           
        if((Utility.shared.payout_Address_Dict["address1"]) == nil || ((Utility.shared.payout_Address_Dict["address1"]as! String) == ""))
        {
        self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"enteradd"))!)")
        }
//        else if((Utility.shared.payout_Address_Dict["address2"]) == nil || ((Utility.shared.payout_Address_Dict["address2"]as! String) == ""))
//        {
//            self.view.makeToast("Please enter Address2")
//        }
        else if((Utility.shared.payout_Address_Dict["city"]) == nil || ((Utility.shared.payout_Address_Dict["city"]as! String) == ""))
        {
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"entercity"))!)")
        }
         else if((Utility.shared.payout_Address_Dict["state"]) == nil || ((Utility.shared.payout_Address_Dict["state"]as! String) == ""))
        {
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"enterstate"))!)")
        }
        else if((Utility.shared.payout_Address_Dict["zipcode"]) == nil || ((Utility.shared.payout_Address_Dict["zipcode"]as! String) == ""))
        {
            self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"enterzipcode"))!)")
        }
        else{
            
            let paymethodObj = PaymentMethodVC()
             paymethodObj.modalPresentationStyle = .fullScreen
            self.present(paymethodObj, animated: true, completion: nil)
        }
        }
        else
          {
            self.view.endEditing(true)
            self.continueBtn.isHidden = true
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
    @IBAction func backBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func retryBtnTapped(_ sender: Any) {
           if Utility.shared.isConnectedToNetwork(){
            self.continueBtn.isHidden = false
            self.offlineView.isHidden = true
        }
    }
    
   
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payout_TF_Array.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PayoutTextfieldCell", for: indexPath)as! PayoutTextfieldCell
        cell.selectionStyle = .none
        cell.payoutTF.placeholder = payout_TF_Array[indexPath.row]
        cell.payoutTF.autocorrectionType = UITextAutocorrectionType.no
        cell.payoutTF.delegate = self
        
        cell.payoutTF.tintColor = UIColor(named: "Title_Header")
        cell.payoutTF.tag = indexPath.row
        cell.tag = indexPath.row + 2000
        let toolBar = UIToolbar().ToolbarPikerSelect(mySelect: #selector(dismissgenderPicker))
        cell.payoutTF.inputAccessoryView = toolBar
        toolBar.barTintColor = UIColor(named: "Button_Grey_Color")
        cell.imgDownArrow.isHidden = true
        
        if(indexPath.row == 0)
        {
            cell.payoutTF.isUserInteractionEnabled = false
            
            cell.payoutTF.text = countryText
            cell.lblHeader.text = "\((Utility.shared.getLanguage()?.value(forKey:"country"))!)"
        }
        else if(indexPath.row == 1)
        {
            cell.lblHeader.text = "\((Utility.shared.getLanguage()?.value(forKey:"addressline1"))!)"
        }
        else if(indexPath.row == 2)
        {
            cell.lblHeader.text = "\((Utility.shared.getLanguage()?.value(forKey:"addressline2"))!)"
        }
        else if(indexPath.row == 3)
        {
            cell.lblHeader.text = "\((Utility.shared.getLanguage()?.value(forKey:"city"))!)"
        }
        else if(indexPath.row == 4)
        {
            cell.lblHeader.text = "\((Utility.shared.getLanguage()?.value(forKey:"stateprovince"))!)"
        }
        else if(indexPath.row == 5)
        {
            cell.lblHeader.text = "\((Utility.shared.getLanguage()?.value(forKey:"zipcode"))!)"
        //cell.payoutTF.keyboardType = .decimalPad
            
        }
        return cell
    }
    @objc func dismissgenderPicker() {
        view.endEditing(true)
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(textField.text!.contains(".") && string == ".")
        {
            return false
        }
        return true
    }
    @objc func keyboardWillShow(sender: NSNotification) {
        let info = sender.userInfo!
        let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        
        //  self.GoBtn.frame.origin.y -= keyboardFrame.height
          self.continueBtn.frame.origin.y = keyboardFrame.origin.y - 60
         self.nextImage.frame.origin.y = keyboardFrame.origin.y - 45
        
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        let info = sender.userInfo!
        let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        self.continueBtn.frame.origin.y = FULLHEIGHT - 70
        self.nextImage.frame.origin.y = FULLHEIGHT - 55
//
//        if ((emailTF.text?.isValidEmail())! && ((passwordTF.text?.count)! > 6)) {
//            self.configureNextBtn(enable: true)
//
//        }
//        else{
//            self.configureNextBtn(enable: false)
//        }
        
    }
    
    
    // MARK: - TextFieldDelegate Methods
    
    
    
    

    func textFieldDidEndEditing(_ textField: UITextField) {
         let textvalue = textField.text!.trimmingCharacters(in: .whitespaces)
        if(textField.tag == 0)
        {
            Utility.shared.payout_Address_Dict.updateValue(countryText, forKey: "country")
        }
        if(textField.tag == 1)
        {
           
            
            Utility.shared.payout_Address_Dict.updateValue(textvalue, forKey: "address1")
        }
        else if(textField.tag == 2)
        {
            Utility.shared.payout_Address_Dict.updateValue(textvalue, forKey: "address2")
            
        }
        else if(textField.tag == 3)
        {
            Utility.shared.payout_Address_Dict.updateValue(textvalue, forKey: "city")
            
        }
        else if(textField.tag == 4)
        {
            Utility.shared.payout_Address_Dict.updateValue(textvalue, forKey: "state")
            
        }
        else if(textField.tag == 5)
        {
            Utility.shared.payout_Address_Dict.updateValue(textvalue, forKey: "zipcode")
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
