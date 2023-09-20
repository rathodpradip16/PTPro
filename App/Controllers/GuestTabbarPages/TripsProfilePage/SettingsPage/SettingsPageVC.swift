//
//  SettingsPageVC.swift
//  App
//
//  Created by RadicalStart on 26/04/22.
//  Copyright © 2022 RADICAL START. All rights reserved.
//

import UIKit
import SwiftMessages
import Apollo

class SettingsPageVC: UIViewController,LanguageVCDelegate {
    func getcurrencycode(code: String) {
        
    }
    
    func didupdateAppearanceStatus() {
        let indexPaths = IndexPath(item: 2, section: 0)
        self.tableView.reloadRows(at:[indexPaths] , with: .none)
    }
    
    

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var pageTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var apollo_headerClient:ApolloClient!
    var EditProfileArray : GetProfileQuery.Data.UserAccount.Result?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor =   UIColor(named: "colorController")
         
        self.backBtn.setImage(UIImage(named: "left_arrow"), for: .normal)
        self.backBtn.setTitle("", for: .normal)
        self.backBtn.backgroundColor = Theme.ButtonBack_BG
        self.backBtn.layer.cornerRadius = self.backBtn.frame.size.height/2
        self.backBtn.clipsToBounds = true
        
        if Utility.shared.isRTLLanguage(){
            self.backBtn.rotateImageViewofBtn()
        }
        
        self.pageTitleLabel.text = "\(Utility.shared.getLanguage()?.value(forKey: "settings") ?? "Settings")"
        self.pageTitleLabel.textColor =  UIColor(named: "Title_Header")
        self.pageTitleLabel.textAlignment = Utility.shared.isRTLLanguage() ? .right : .left
        self.pageTitleLabel.font = UIFont(name: APP_FONT_MEDIUM, size: 18)
        
        
        self.tableView.register(UINib(nibName: "SwitchtohostCell", bundle: nil), forCellReuseIdentifier: "SwitchtohostCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        
        // Do any additional setup after loading the view.
    }

    @IBAction func onClickBackBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
      
    }
    
    func EdiprofileAPICall()
    {
        let profileQuery = GetProfileQuery()
        Network.shared.apollo_headerClient.fetch(query:profileQuery,cachePolicy:.fetchIgnoringCacheData){ response in
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
                        self.view.makeToast(result.data?.userAccount?.errorMessage!)
                        return
                    }
                }
                
                print(result.data?.userAccount?.result as Any)
                Utility.shared.EditProfileArray  = ((result.data?.userAccount?.result)!)
                self.EditProfileArray = ((result.data?.userAccount?.result)!)
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
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




extension SettingsPageVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if #available(iOS 13.0, *) {
        return 3
        }
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchtohostCell", for: indexPath) as! SwitchtohostCell
        cell.selectionStyle = .none

        if indexPath.row == 0{
            cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey: "languages") ?? "Languages")"
            cell.profileSettingLabel.textColor  =  UIColor(named: "Title_Header")
            cell.iconImage.image =  UIImage(named: "LanguageIcon")
            cell.profileRightValueLabel.text = Utility.shared.getAppLanguage()
        }else if indexPath.row == 1{
            cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey: "currency") ?? "Currency")"
            cell.profileSettingLabel.textColor  =  UIColor(named: "Title_Header")
            cell.iconImage.image =  UIImage(named: "CurrencyIcon")
            
            if(Utility.shared.selectedCurrency != "")
            {
                let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
                cell.profileSettingLabel.textColor  =  UIColor(named: "Title_Header")
                
                if(currencysymbol == Utility.shared.selectedCurrency) {
                    cell.profileRightValueLabel.text =   "\(Utility.shared.selectedCurrency )"
                }
                else {
                cell.profileRightValueLabel.text =  "\(currencysymbol ?? "$") " + "\(Utility.shared.selectedCurrency )"
                }
                
            }else{
                let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency()!)
                Utility.shared.selectedCurrency = Utility.shared.ProfileAPIArray?.preferredCurrency ?? "USD"
                if(currencysymbol == Utility.shared.selectedCurrency) {
                    cell.profileRightValueLabel.text =   "\(Utility.shared.selectedCurrency )"
                }
                else {
                cell.profileRightValueLabel.text =  "\(currencysymbol ?? "$") " + "\(Utility.shared.getPreferredCurrency() ?? "USD")"
                }
               
            }
        }
        else if indexPath.row == 2{
            cell.profileSettingLabel.text = "\(Utility.shared.getLanguage()?.value(forKey: "theme") ?? "Theme")"
            cell.profileRightValueLabel.text =  Utility.shared.selectedAppearance != "" ? (Utility.shared.selectedAppearance).firstCapitalized : "\((Utility.shared.getLanguage()?.value(forKey:"auto"))!)"
            if Utility.shared.selectedAppearance == "auto" || Utility.shared.selectedAppearance == "Auto"{
                cell.profileRightValueLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"auto"))!)"
            }
            else if  Utility.shared.selectedAppearance == "light" || Utility.shared.selectedAppearance == "Light"{
                cell.profileRightValueLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"light"))!)"
            }
            else if  Utility.shared.selectedAppearance == "dark" || Utility.shared.selectedAppearance == "Dark"{
                cell.profileRightValueLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"dark"))!)"
            }
            else {
                cell.profileRightValueLabel.text =  "\((Utility.shared.getLanguage()?.value(forKey:"auto"))!)"
            }
            cell.profileSettingLabel.textColor  =  UIColor(named: "Title_Header")
            cell.iconImage.image =  UIImage(named: "appearance")
           
        }
        
        cell.profilesettingImage.isHidden = true
        cell.profileRightValueLabel.isHidden = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0)
        {
            let languageObj = LanguageVC()
            languageObj.userEditProfileArray = EditProfileArray
            Utility.shared.isfromLanguage = true
            languageObj.delegate = self
            Utility.shared.isfrom_payoutcurrency = false
            Utility.shared.isfromCurrency = false
            languageObj.modalPresentationStyle = .overFullScreen
            self.present(languageObj, animated: true, completion: nil)
        }
        else  if(indexPath.row == 1)
        {
            let languageObj = LanguageVC()
            languageObj.userEditProfileArray = EditProfileArray
            languageObj.delegate = self
            Utility.shared.isfromLanguage = false
            Utility.shared.isfrom_payoutcurrency = false
            Utility.shared.isfromCurrency = true
             languageObj.modalPresentationStyle = .overFullScreen
            self.present(languageObj, animated: true, completion: nil)
        }
        else {
            let languageObj = LanguageVC()
            languageObj.delegate = self
            languageObj.userEditProfileArray = EditProfileArray
            Utility.shared.isfromLanguage = false
            Utility.shared.isfrom_payoutcurrency = false
            Utility.shared.isfromCurrency = false
            languageObj.isFromAppearance = true
             languageObj.modalPresentationStyle = .overFullScreen
            self.present(languageObj, animated: true, completion: nil)
        }
    }
    
    
    
    
}

