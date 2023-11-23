//
//  OrderSummaryVC.swift
//  App
//
//  Created by Phycom Mac Pro on 23/11/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit

class OrderSummaryVC: UIViewController {

    @IBOutlet weak var lblPlanName: UILabel!
    @IBOutlet weak var viewOrderSummary: UIView!
    
    @IBOutlet weak var lblPlanAmountTitle: UILabel!
    @IBOutlet weak var lblPlanAmountValue: UILabel!
    @IBOutlet weak var lblPlanTotalPaidTitle: UILabel!
    @IBOutlet weak var lblPlanTotalPaidValue: UILabel!
    @IBOutlet weak var lblPlanTransactionIdTitle: UILabel!
    @IBOutlet weak var lblPlanTransactionIdValue: UILabel!
//    @IBOutlet weak var lblPlanPaymentMethodValue: UILabel!
    @IBOutlet weak var lblPlanPaymentMethodTitle: UILabel!
    @IBOutlet weak var lblPlanPurchaseDateTitle: UILabel!
    @IBOutlet weak var lblPlanPurchaseDateValue: UILabel!
    @IBOutlet weak var lblPlanExpiryTitle: UILabel!
    @IBOutlet weak var lblPlanExpiryValue: UILabel!

    @IBOutlet weak var btnDownloadReceipt: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func GetReceiptPaymentQueryAPICall(){
        let getReceiptPaymentQuery = PTProAPI.GetReceiptPaymentQuery(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""))
        
        Network.shared.apollo_headerClient.fetch(query: getReceiptPaymentQuery, cachePolicy: .fetchIgnoringCacheData) { response in
            switch response{
            case .success(let result):
                if let status = result.data?.getReceiptPayment?.status,status == 200{
                    if let data = result.data?.getReceiptPayment?.data{
                        DispatchQueue.main.async {
                            self.lblPlanName.text = data.planType
                            self.lblPlanAmountValue.text = "\(data.total ?? 0.0)"
                            self.lblPlanTotalPaidValue.text = "\(data.total ?? 0.0)"
                            self.lblPlanTransactionIdValue.text = data.transactionId
                            //   self.lblPlanPaymentMethodValue.text =
                            self.lblPlanPurchaseDateValue.text = data.createdAt
                            self.lblPlanExpiryValue.text = data.expiryDate
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
    
    @IBAction func onClickBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func onClickDownloadReceipt(_ sender: Any) {
        DispatchQueue.main.async {
            let url = URL(string: Download_Receipt_URL)
            let pdfData = try? Data.init(contentsOf: url!)
            let resourceDocPath = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last! as URL
            let pdfNameFromUrl = "subscription.pdf"
            let actualPath = resourceDocPath.appendingPathComponent(pdfNameFromUrl)
            do {
                try pdfData?.write(to: actualPath, options: .atomic)
                print("pdf successfully saved!")
            } catch {
                print("Pdf could not be saved")
            }
        }
    }

}
