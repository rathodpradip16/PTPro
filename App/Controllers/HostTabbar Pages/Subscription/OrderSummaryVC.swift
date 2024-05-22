//
//  OrderSummaryVC.swift
//  App
//
//  Created by Phycom Mac Pro on 23/11/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit
import Alamofire

class OrderSummaryVC: UIViewController {
    @IBOutlet weak var lblPlanName: UILabel!
    @IBOutlet weak var viewOrderSummary: UIView!
    
    @IBOutlet weak var lblPlanAmountTitle: UILabel!
    @IBOutlet weak var lblPlanAmountValue: UILabel!
    @IBOutlet weak var lblPlanTotalPaidTitle: UILabel!
    @IBOutlet weak var lblPlanTotalPaidValue: UILabel!
    @IBOutlet weak var lblPlanTransactionIdTitle: UILabel!
    @IBOutlet weak var lblPlanTransactionIdValue: UILabel!
    @IBOutlet weak var lblPlanPaymentMethodTitle: UILabel!
    @IBOutlet weak var lblPlanPurchaseDateTitle: UILabel!
    @IBOutlet weak var lblPlanPurchaseDateValue: UILabel!
    @IBOutlet weak var lblPlanExpiryTitle: UILabel!
    @IBOutlet weak var lblPlanExpiryValue: UILabel!
    
    @IBOutlet weak var btnDownloadReceipt: UIButton!
    
    @IBOutlet weak var imgPlanIcon: UIImageView!
    @IBOutlet weak var imgPaymentMethod: UIImageView!
    
    var selectedPlan = ""
    var selectedPaymentType = 0
    var isFromPayment = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.GetReceiptPaymentQueryAPICall()
        
        switch selectedPlan{
        case "Economy":
            imgPlanIcon.image = UIImage(named: "crownSmall")!.withTintColor(.black)
            break
        case "Recommended":
            imgPlanIcon.image = UIImage(named: "subDiamondSmall")!.tint(with: .black)
            break
        case "Gold":
            imgPlanIcon.image = UIImage(named: "crownSmall")!.tint(with: .black)
            break
        case "Platinum":
            imgPlanIcon.image = UIImage(named: "crownSmall")!.tint(with: .black)
            break
        case "CustomPlan":
            imgPlanIcon.image = UIImage(named: "crownSmall")!.tint(with: .black)
            break
        default:
            imgPlanIcon.image = UIImage(named: "crownSmall")!.withTintColor(.black)
        }
        
    }
    
    func GetReceiptPaymentQueryAPICall(){
        let getReceiptPaymentQuery = PTProAPI.GetReceiptPaymentQuery(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""))
        
        Network.shared.apollo_headerClient.fetch(query: getReceiptPaymentQuery, cachePolicy: .fetchIgnoringCacheData) { response in
            switch response{
            case .success(let result):
                if let status = result.data?.getReceiptPayment?.status,status == 200{
                    if let data = result.data?.getReceiptPayment?.data{
                        DispatchQueue.main.async {
                            self.lblPlanName.text = "\(self.selectedPlan): \((data.planType) == "monthly" ? "Monthly Plan" : "Yearly Plan")"
                            self.lblPlanAmountValue.text = "\(data.total ?? 0.0)"
                            self.lblPlanTotalPaidValue.text = "\(data.total ?? 0.0)"
                            self.lblPlanTransactionIdValue.text = data.transactionId
                            self.lblPlanPurchaseDateValue.text = data.createdAt
                            self.lblPlanExpiryValue.text = data.expiryDate
                            self.selectedPaymentType = Int(data.paymentType ?? "") ?? 0
                            self.updatePaymentType()
                        }
                    }
                } else {
                    self.view.makeToast(result.data?.getReceiptPayment?.errorMessage)
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
                break
            }
        }
    }
    
    func updatePaymentType(){
        switch selectedPaymentType{
        case 1:
            imgPaymentMethod.image = #imageLiteral(resourceName: "paypal")
            break
        case 2:
            imgPaymentMethod.image = #imageLiteral(resourceName: "stripe")
            break
        default:
            break
        }
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        if isFromPayment{
            self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
        }else{
            self.dismiss(animated: true)
        }
    }
    
    
    @IBAction func onClickDownloadReceipt(_ sender: Any) {
        let GetBaseUrl = URL(string: Download_Receipt_URL)!
        if Utility.shared.isConnectedToNetwork(){
            let parameters: Parameters = [
                "userId": "\(Utility.shared.ProfileAPIArray?.userId ?? "")"
            ]
            
            self.view.makeToast("Downloading...", duration: 1.0)
            
            AF.request(GetBaseUrl,method: .post,parameters:parameters,encoding: URLEncoding.default) .response { response in
                switch response.result {
                case .success(let data):
                    do {
                        let asJSON = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
                        if let jsonData = asJSON , let path = jsonData["path"] {
                            DispatchQueue.main.async {
                                let url = URL(string: "\(BASE_URL)\(path)")
                                let pdfData = try? Data.init(contentsOf: url!)
                                let resourceDocPath = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last! as URL
                                let strDate = Date().stringFromFormat("ddMMyyyhhmmss")
                                let pdfNameFromUrl = "subscription\(strDate).pdf"
                                let actualPath = resourceDocPath.appendingPathComponent(pdfNameFromUrl)
                                do {
                                    try pdfData?.write(to: actualPath, options: .atomic)
                                    self.view.makeToast("Pdf successfully saved! to Files")
                                } catch {
                                    print("Pdf could not be saved")
                                }
                            }
                        }
                    } catch {
                    }
                    break
                case .failure(let failure):
                    break
                }
            }
        }
    }
}
