//
//  WhyhostVC.swift
//  Rent_All
//
//  Created by RadicalStart on 07/07/20.
//  Copyright © 2020 RADICAL START. All rights reserved.
//

import UIKit
import SCPageControl
import Apollo
import WebKit

class WhyhostVC: UIViewController,UIScrollViewDelegate {
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var mainView: UIView!

    @IBOutlet weak var hostWebView: WKWebView!


    @IBOutlet weak var litsBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        self.view.backgroundColor =   UIColor(named: "colorController")
        hostWebView.load(URLRequest(url: URL(string: whyHostURL)! ))
        // Do any additional setup after loading the view.
        self.view.bringSubviewToFront(litsBtn)
        litsBtn.setTitle("Become a Host", for: .normal)
        litsBtn.backgroundColor = Theme.Button_BG
        litsBtn.layer.cornerRadius = 20
        litsBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size:16)
        litsBtn.clipsToBounds = true
        
        backBtn.layer.cornerRadius = 20
    }
    
    
    func listingBtnTapped()
    {
        if Utility.shared.isConnectedToNetwork(){
            
            let getlistsettingsquery = PTProAPI.GetListingSettingQuery()
            Network.shared.apollo_headerClient.fetch(query: getlistsettingsquery,cachePolicy:.fetchIgnoringCacheData){ response in
                switch response {
                case .success(let result):
                    guard (result.data?.getListingSettings?.results) != nil else{
                        return
                    }
                    if let listingData = result.data,let getListingSettings = listingData.getListingSettings,let arrayListingSettings =  getListingSettings.results{
                        Utility.shared.getListSettingsArray = arrayListingSettings
                        if Utility.shared.getListSettingsArray?.personCapacity != nil{
                            self.GetPropertieCountAPICAll()
                        }
                    }
                    case .failure(let error):
                        self.view.makeToast(error.localizedDescription)
                    }
                
            }
            
        }
    }
    
    //MARK: - GetPropertieCountAPICAll Function
    func GetPropertieCountAPICAll()
    {
        let getPropertieCountQuery = PTProAPI.GetPropertieCountQuery(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""))
        Network.shared.apollo_headerClient.fetch(query: getPropertieCountQuery,cachePolicy:.fetchIgnoringCacheData){ response in
            switch response {
            case .success(let result):
                if let status = result.data?.getPropertieCount?.status, status == 200 {
                    if let arrResults = result.data?.getPropertieCount?.results,let propertycount = arrResults.propertieCount{
                        if Utility.shared.utManageListingArray.count < propertycount{
                            self.GoToBaseHostVC()
                        }else{
                            self.upgradeAlert()
                        }
                    }else{
                        self.GoToBaseHostVC()
                    }
                }else if let status = result.data?.getPropertieCount?.status, status == 401 {
                    self.subscriptionAlert()
                }else{
                    self.view.makeToast(result.data?.getPropertieCount?.errorMessage)
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }
    
    func GoToBaseHostVC(){
        let baseHost = BaseHostTableviewController()
        baseHost.getListSettingsArray = Utility.shared.getListSettingsArray
        Utility.shared.createId = Int()
        Utility.shared.createId = 0
            baseHost.showOverlay = true
        Utility.shared.host_basePrice = 0
        Utility.shared.step1_inactivestatus = ""
        Utility.shared.isfrombecomehoststep1Edit = false
        Utility.shared.selectedAmenityIdList.removeAllObjects()
        Utility.shared.selectedspaceAmenityIdList.removeAllObjects()
        Utility.shared.selectedsafetyAmenityIdList.removeAllObjects()
        Utility.shared.selectedRules.removeAllObjects()
        Utility.shared.step2_Description = ""
        Utility.shared.step2_Title = ""
        Utility.shared.currencyvalue = ""
        Utility.shared.step1ValuesInfo = [String : Any]()
        self.view.window?.backgroundColor = UIColor.white
       baseHost.modalPresentationStyle = .fullScreen
        self.present(baseHost, animated:false, completion: nil)
    }
    
    func subscriptionAlert(){
        let alert = UIAlertController(title: "Subscription Required", message: String(format: "\n To access this feature, please purchase a subscription \n") , preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler: { action in
               }))
               alert.addAction(UIAlertAction(title: "BUY NOW", style: .default, handler: { action in
                   let storyboard = UIStoryboard(name: "Main", bundle: nil)
                   let vc = storyboard.instantiateViewController(withIdentifier: "ViewSubscriptionsVC") as! ViewSubscriptionsVC
                   vc.modalPresentationStyle = .fullScreen
                   self.present(vc, animated: true, completion: nil)
               }))
               self.present(alert, animated: true, completion: nil)
    }
    
    func upgradeAlert(){
        let alert = UIAlertController(title: "Subscription Upgrade Required", message: String(format: "\n To access this feature, please upgrade your subscription\n") , preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler: { action in
               }))
               alert.addAction(UIAlertAction(title: "Upgrade NOW", style: .default, handler: { action in
                   let storyboard = UIStoryboard(name: "Main", bundle: nil)
                   let vc = storyboard.instantiateViewController(withIdentifier: "ViewSubscriptionsVC") as! ViewSubscriptionsVC
                   vc.modalPresentationStyle = .fullScreen
                   self.present(vc, animated: true, completion: nil)
               }))
               self.present(alert, animated: true, completion: nil)
    }
    
    @objc func backdismissBtnTapped()
          {
              
              self.dismiss(animated: false, completion: nil)
          }
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        

    }

    

  
    @IBAction func backBtnTapped(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func listBtnTapped(_ sender: Any) {
        self.listingBtnTapped()
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
