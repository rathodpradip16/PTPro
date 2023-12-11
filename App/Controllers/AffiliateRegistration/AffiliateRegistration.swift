//
//  AffiliateRegistration.swift
//  App
//
//  Created by Phycom Mac Pro on 20/09/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit
import StepIndicator
import Apollo
import NKVPhonePicker

protocol userStepInfoUpdate{
  func userStepInfoUpdate()
}

class AffiliateRegistration: UIViewController {

    @IBOutlet weak var viewAccount: UIView!
    @IBOutlet weak var viewWebsite: UIView!
    @IBOutlet weak var viewDocumnet: UIView!
    @IBOutlet weak var stepIndicator: StepIndicatorView!
    
    @IBOutlet weak var lblAccount: UILabel!
    @IBOutlet weak var lblWebsite: UILabel!
    @IBOutlet weak var lblDocument: UILabel!
    
    @IBOutlet weak var btnBack: UIButton!
    
    var viewAccountvc:AffiliateRegistrationAccount?
    var viewWebsitevc:AffiliateRegistrationWebsite?
    var viewDocumentvc:AffiliateRegistrationDocument?
    
    var delegate: userStepInfoUpdate?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let stepInfo = Utility.shared.GetAffiliateUserStep?.stepInfo{
            switch stepInfo{
            case StepInfo.None.rawValue:
                self.showAccountView()
                break
            case StepInfo.Account.rawValue:
                self.showWebsiteview()
                break
            case StepInfo.Website.rawValue:
                self.showDocumentview()
                break
            case StepInfo.Documents.rawValue:
                self.showDocumentview()
                break
            case StepInfo.Success.rawValue:
                self.showAccountView()
                break
            default:
                self.showAccountView()
                break
            }
        }else{
            self.showAccountView()
        }
        // Do any additional setup after loading the view.
    }
    
    func showAccountView(){
        self.lblAccount.alpha = 1.0
        self.lblWebsite.alpha = 1.0
        self.lblAccount.textColor = Theme.affiliatePurpleColor
        self.lblWebsite.textColor = Theme.TextLightColor
        self.lblDocument.textColor = Theme.TextLightColor
        self.stepIndicator.currentStep = 0
        self.viewAccount.isHidden = false
        self.viewWebsite.isHidden = true
        self.viewDocumnet.isHidden = true

    }
    
    func showWebsiteview(){
        self.lblAccount.alpha = 0.0
        self.lblWebsite.textColor = Theme.affiliatePurpleColor
        self.lblDocument.textColor = Theme.TextLightColor
        self.stepIndicator.currentStep = 1
        self.viewAccount.isHidden = true
        self.viewWebsite.isHidden = false
        self.viewDocumnet.isHidden = true
    }
    
    func showDocumentview(){
        self.lblAccount.alpha = 0.0
        self.lblWebsite.alpha = 0.0
        self.lblDocument.textColor = Theme.affiliatePurpleColor
        self.stepIndicator.currentStep = 2
        self.viewAccount.isHidden = true
        self.viewWebsite.isHidden = true
        self.viewDocumnet.isHidden = false
    }
    
    @IBAction func onClickBtnBack(_ sender: Any) {
        delegate?.userStepInfoUpdate()
        self.dismiss(animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller
    }
    
    enum Segues{
        static let viewAccount = "viewAccount"
        static let viewDocumnet = "viewDocumnet"
        static let viewWebsite = "viewWebsite"
    }
}
