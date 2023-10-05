//
//  AffiliateRegistrationAccount.swift
//  App
//
//  Created by Phycom Mac Pro on 13/09/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit
import NKVPhonePicker
import GooglePlaces
import IQKeyboardManagerSwift
import GrowingTextView

class AffiliateRegistrationAccount: UIViewController, UITextFieldDelegate ,CountriesViewControllerDelegate, UITextViewDelegate{

    //MARK: - variable initialization
    @IBOutlet weak var lblPayeeName: UILabel!
    @IBOutlet weak var lblPayeeNote: UILabel!
    @IBOutlet weak var lblAddressLine1: UILabel!
    @IBOutlet weak var lblAddressLine2: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblState: UILabel!
    @IBOutlet weak var lblZipCode: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var txtPayeeName: CustomUITextField!
    
    @IBOutlet weak var txtCity: CustomUITextField!
    @IBOutlet weak var txtState: CustomUITextField!
    @IBOutlet weak var txtZipCode: CustomUITextField!
    @IBOutlet weak var txtCountry: CustomUITextField!
    @IBOutlet weak var txtPhoneNumber: NKVPhonePickerTextField!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var tblCity: UITableView!
    
    @IBOutlet weak var txtAddressLine1: GrowingTextView!
    @IBOutlet weak var txtAddressLine2: GrowingTextView!

    var returnKeyHandler:IQKeyboardReturnKeyHandler?

    private var tblCityDataSource: GMSAutocompleteTableDataSource!

    //MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeLocalization()
        self.initializeView()
        self.initializeText()
     }

    //MARK: - custom methods
    func initializeText(){
        if let stepDetails = Utility.shared.GetAffiliateUserStep?.stepDetails?.first{
            self.txtPayeeName.text = stepDetails?.payeeName ?? ""
            if let arr = stepDetails?.address?.components(separatedBy: ";;;"),arr.count != 0{
                if arr.count == 2{
                    self.txtAddressLine1.text = arr[0]
                    self.txtAddressLine2.text = arr[1]
                }else if arr.count == 1{
                    self.txtAddressLine1.text = arr[0]
                }else{
                    self.txtAddressLine1.text = stepDetails?.address ?? ""
                    self.txtAddressLine2.text = stepDetails?.address ?? ""
                }
            }else{
                self.txtAddressLine1.text = stepDetails?.address ?? ""
                self.txtAddressLine2.text = stepDetails?.address ?? ""
            }
            self.txtAddressLine2.text = stepDetails?.address ?? ""
            self.txtCity.text = stepDetails?.city ?? ""
            self.txtState.text = stepDetails?.state ?? ""
            self.txtZipCode.text = stepDetails?.zipcode ?? ""
            self.txtCountry.text = stepDetails?.country ?? ""
            self.txtPhoneNumber.text = stepDetails?.phoneNumber ?? ""
        }
    }
    
    func initializeView(){
        tblCityDataSource = GMSAutocompleteTableDataSource()
        tblCityDataSource.delegate = self
        tblCityDataSource.placeFields = [.name , .addressComponents]
        let autocompleteFilter = GMSAutocompleteFilter()
        autocompleteFilter.types = ["(cities)"]
        tblCityDataSource.autocompleteFilter = autocompleteFilter // "(cities)" , "address"]
        tblCity.delegate = tblCityDataSource
        tblCity.dataSource = tblCityDataSource
        txtCity.delegate = self
        tblCity.isHidden = true
        
        txtState.delegate = self
        txtCountry.delegate = self
        txtPayeeName.delegate = self
        txtAddressLine1.delegate = self
        txtAddressLine2.delegate = self
        txtZipCode.delegate = self
        txtState.inputAccessoryView = UIView()
        //txtCountry.isUserInteractionEnabled = false
        txtCountry.inputAccessoryView = UIView()
        returnKeyHandler = IQKeyboardReturnKeyHandler(controller: self)
        returnKeyHandler?.lastTextFieldReturnKeyType = .next
        
        txtAddressLine1.returnKeyType = .default
        txtAddressLine2.returnKeyType = .default

        txtPayeeName.keyboardToolbar.nextBarButton.tag = 0
        txtAddressLine1.keyboardToolbar.nextBarButton.tag = 1
        txtAddressLine2.keyboardToolbar.nextBarButton.tag = 2
        txtCity.keyboardToolbar.nextBarButton.tag = 3
        txtZipCode.keyboardToolbar.nextBarButton.tag = 4
        txtPhoneNumber.keyboardToolbar.nextBarButton.tag = 5
        
        txtPayeeName.keyboardToolbar.previousBarButton.tag = 0
        txtAddressLine1.keyboardToolbar.previousBarButton.tag = 1
        txtAddressLine2.keyboardToolbar.previousBarButton.tag = 2
        txtCity.keyboardToolbar.previousBarButton.tag = 3
        txtZipCode.keyboardToolbar.previousBarButton.tag = 4
        txtPhoneNumber.keyboardToolbar.previousBarButton.tag = 5
        
        txtPayeeName.addPreviousNextDoneOnKeyboardWithTarget(self, previousAction: #selector(previousAction(btn:)), nextAction: #selector(nextAction(btn:)), doneAction: #selector(doneAction(btn:)))

        txtAddressLine1.addPreviousNextDoneOnKeyboardWithTarget(self, previousAction: #selector(previousAction(btn:)), nextAction: #selector(nextAction(btn:)), doneAction: #selector(doneAction(btn:)))

        txtAddressLine2.addPreviousNextDoneOnKeyboardWithTarget(self, previousAction: #selector(previousAction(btn:)), nextAction: #selector(nextAction(btn:)), doneAction: #selector(doneAction(btn:)))

        txtCity.addPreviousNextDoneOnKeyboardWithTarget(self, previousAction: #selector(previousAction(btn:)), nextAction: #selector(nextAction(btn:)), doneAction: #selector(doneAction(btn:)))

        txtZipCode.addPreviousNextDoneOnKeyboardWithTarget(self, previousAction: #selector(previousAction(btn:)), nextAction: #selector(nextAction(btn:)), doneAction: #selector(doneAction(btn:)))
        
        txtPhoneNumber.addDoneOnKeyboardWithTarget(self, action: #selector(doneAction(btn:)))
    }

    @objc func previousAction(btn:Any){
        if let button = btn as? UIBarButtonItem {
         let tag = button.tag
            switch tag{
            case 0:
                txtPayeeName.resignFirstResponder()
                break
            case 1:
                txtPayeeName.becomeFirstResponder()
                txtAddressLine1.resignFirstResponder()
                break
            case 2:
                txtAddressLine1.becomeFirstResponder()
                txtAddressLine2.resignFirstResponder()
                break
            case 3: 
                txtAddressLine2.becomeFirstResponder()
                txtCity.resignFirstResponder()
                break
            case 4: 
                txtCity.becomeFirstResponder()
                txtZipCode.resignFirstResponder()
                break
            case 5: 
                txtZipCode.becomeFirstResponder()
                txtPhoneNumber.resignFirstResponder()
                break

            default: break
                
            }
        }
    }
    
    @objc func nextAction(btn:Any){
        if let button = btn as? UIBarButtonItem {
            let tag = button.tag
            switch tag{
            case 0:
                txtAddressLine1.becomeFirstResponder()
                txtPayeeName.resignFirstResponder()
                break
            case 1:
                txtAddressLine2.becomeFirstResponder()
                txtAddressLine1.resignFirstResponder()
                break
            case 2:
                txtCity.becomeFirstResponder()
                txtAddressLine2.resignFirstResponder()
                break
            case 3:
                txtZipCode.becomeFirstResponder()
                txtCity.resignFirstResponder()
                break
            case 4:
                txtPhoneNumber.becomeFirstResponder()
                txtZipCode.resignFirstResponder()
                break
            case 5:
                txtPhoneNumber.resignFirstResponder()
                break
                
            default: break
                
            }
        }
    }

    @objc func doneAction(btn:UIBarButtonItem){
        self.view.endEditing(true)
    }


    
    //MARK: - custom methods
    func initializePhoneNumberTextfiled(){
        txtPhoneNumber.phonePickerDelegate = self
        txtPhoneNumber.countryPickerDelegate = self
    }

    func initializeLocalization(){
        lblPayeeName.text = "\((Utility.shared.getLanguage()?.value(forKey:"PayeeName")) ?? "Payee Name")"
        lblAddressLine1.text = "\((Utility.shared.getLanguage()?.value(forKey:"addressline1")) ?? "Address Line 1")"
        lblAddressLine2.text = "\((Utility.shared.getLanguage()?.value(forKey:"addressline2")) ?? "Address line 2")"
        lblCity.text = "\((Utility.shared.getLanguage()?.value(forKey:"city")) ?? "City")"
        lblState.text = "\((Utility.shared.getLanguage()?.value(forKey:"stateprovince")) ?? "State / Province")"
        lblZipCode.text = "\((Utility.shared.getLanguage()?.value(forKey:"zipcode")) ?? "ZIP code / Postal code")"
        lblCountry.text = "\((Utility.shared.getLanguage()?.value(forKey:"country")) ?? "Country")"
        lblPhoneNumber.text = "\((Utility.shared.getLanguage()?.value(forKey:"PhoneNumber")) ?? "Phone number")"
    }

    //MARK: - CountriesViewControllerDelegate
    func countriesViewControllerDidCancel(_ sender: NKVPhonePicker.CountriesViewController) {
        
    }
    
    func countriesViewController(_ sender: NKVPhonePicker.CountriesViewController, didSelectCountry country: NKVPhonePicker.Country) {
        
    }
    
    //MARK: - actions
    @IBAction func onClickAccountBtnNext(_ sender: Any) {
        if Utility.shared.isConnectedToNetwork(){
            self.view.endEditing(true)
            if(txtPayeeName.isEmpty())
            {
                self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"enterPayeeName")) ?? "Please Enter Payee Name")")
            }else if(txtAddressLine1.text.isEmpty || txtAddressLine2.text.isEmpty)
            {
                self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"enterAddress")) ?? "Please Enter Address")")
            }
            else if(txtCity.isEmpty())
            {
                self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"enterCity")) ?? "Please Enter City")")
            }
            else if(txtState.isEmpty())
            {
                self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"enterState")) ?? "Please Enter State" )")
            }else if(txtZipCode.isEmpty())
            {
                self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"enterZipCode")) ?? "Please Enter Zip Code")")
            }
            else if(txtCountry.isEmpty())
            {
                self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"enterCountry")) ?? "Please Enter Country")")
            }
            else if(txtPhoneNumber.isEmpty())
            {
                self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"enterMobileNo")) ?? "Please Enter Mobile")")
            }else{
                self.apiCallAffiliateUserAccountInfo()
            }
        }
    }
    
    //MARK: - UITextField Delegate

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtCity{
            if let text = textField.text as NSString? {
                let txtAfterUpdate = text.replacingCharacters(in: range, with: string)
                tblCity.isHidden =  (txtAfterUpdate == "") ? true : false
                if(txtAfterUpdate == ""){
                    txtState.text = ""
                    txtCountry.text = ""
                }
                tblCityDataSource.sourceTextHasChanged(txtAfterUpdate)
            }
        }
        return true
    }
    
    //MARK: - textfiled delegate methods
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if(textField == txtState || textField == txtCountry){
            if textField.isEmpty(){
                self.view.endEditing(true)
                self.view.makeToast("\((Utility.shared.getLanguage()?.value(forKey:"selectCityFirst")) ?? "Please Select city first")")
            }
            return false
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        tblCityDataSource.sourceTextHasChanged(textField.text)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtCity{
            tblCity.isHidden = true
        }
        return true
    }
    
    //MARK: - API CALL
    func apiCallAffiliateUserAccountInfo(){
        let createAffiliateUserAccountInfo = PTProAPI.CreateAffiliateUserAccountInfoMutation(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""), payeeName: .some(txtPayeeName.text!), address: .some("\(txtAddressLine1.text!);;;\(txtAddressLine2.text!)") , city: .some(txtCity.text!), state: .some(txtState.text!), zipcode: .some(Int(txtZipCode.text!) ?? 0), country: .some(txtCountry.text!), phoneNumber: .some(txtPhoneNumber.text))
        Network.shared.apollo_headerClient.perform(mutation: createAffiliateUserAccountInfo){  response in
            switch response {
            case .success(let result):
                if let data = result.data?.createAffiliateUserAccountInfo?.status,data == 200 {
                    self.view.makeToast("success")
                    if let parent =  self.parent as? AffiliateRegistration{
                        parent.showWebsiteview()
                    }
                } else {
                    self.view.makeToast(result.data?.createAffiliateUserAccountInfo?.errorMessage)
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }

}


extension AffiliateRegistrationAccount: GMSAutocompleteTableDataSourceDelegate {
  func didUpdateAutocompletePredictions(for tableDataSource: GMSAutocompleteTableDataSource) {
    // Turn the network activity indicator off.
    // Reload table data.
    tblCity.reloadData()
  }

  func didRequestAutocompletePredictions(for tableDataSource: GMSAutocompleteTableDataSource) {
    // Turn the network activity indicator on.
    // Reload table data.
      tblCity.reloadData()
  }

  func tableDataSource(_ tableDataSource: GMSAutocompleteTableDataSource, didAutocompleteWith place: GMSPlace) {
      tblCity.isHidden = true
      txtCity.text = place.name
      txtState.text = place.addressComponents?.first(where: { $0.type == "administrative_area_level_1" })?.name
      txtCountry.text = place.addressComponents?.first(where: { $0.type == "country" })?.name
  }

  func tableDataSource(_ tableDataSource: GMSAutocompleteTableDataSource, didFailAutocompleteWithError error: Error) {
      tblCity.isHidden = true
    // Handle the error.
    print("Error: \(error.localizedDescription)")
  }

  func tableDataSource(_ tableDataSource: GMSAutocompleteTableDataSource, didSelect prediction: GMSAutocompletePrediction) -> Bool {
    return true
  }
}
