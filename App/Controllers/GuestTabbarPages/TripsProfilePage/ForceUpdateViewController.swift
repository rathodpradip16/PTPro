//
//  ForceUpdateViewController.swift
//  App
//
//  Created by RadicalStart on 28/09/22.
//  Copyright © 2022 RADICAL START. All rights reserved.
//

import UIKit
import SwiftMessages

class ForceUpdateViewController: UIViewController {

    @IBOutlet weak var BGView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var updateBtn: UIButton!
    
    var descriptionString = ""
    var appStoreURL = ""
    override func viewDidLoad() {
        super.viewDidLoad()

       
        BGView.backgroundColor =  UIColor(named: "becomeAHostStep_Color")
        titleLbl.text = "\(Utility.shared.getLanguage()?.value(forKey: "weimprove") ?? "" )"
        descriptionLbl.text = "\(Utility.shared.getLanguage()?.value(forKey: "versionInfo") ?? "versionInfo")"
        descriptionLbl.textColor = UIColor(named: "searchPlaces_TextColor")
        
        titleLbl.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
        updateBtn.titleLabel?.font = UIFont(name: APP_FONT_MEDIUM, size: 16)
        updateBtn.setTitle("\(Utility.shared.getLanguage()?.value(forKey:"Updatenow") ?? "Update")", for: .normal)
        updateBtn.setTitleColor(Theme.PRIMARY_COLOR, for: .normal)
        // Do any additional setup after loading the view.
    }


    @IBAction func onClickUpdateBtn(_ sender: UIButton) {
        guard let url = URL(string: appStoreURL) else {
          return
        }

        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
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
