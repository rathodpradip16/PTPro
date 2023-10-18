//
//  AffiliateOverviewVC.swift
//  App
//
//  Created by Phycom Mac Pro on 02/10/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit

class AffiliateOverviewVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var viewTotalConversions: UIView!
    @IBOutlet weak var viewTotalEarning: UIView!
    @IBOutlet weak var viewTotalClicks: UIView!

    @IBOutlet weak var lblTotalConversionsValue: UILabel!
    @IBOutlet weak var lblTotalConversionsTitle: UILabel!
    @IBOutlet weak var lblTotalEarningValue:UILabel!
    @IBOutlet weak var lblTotalEarningTitle:UILabel!
    @IBOutlet weak var lblTotalClicksValue:UILabel!
    @IBOutlet weak var lblTotalClicksTitle:UILabel!
    @IBOutlet weak var lblFilterConversionsValue: UILabel!
    @IBOutlet weak var lblFilterConversionsTitle: UILabel!
    @IBOutlet weak var lblFilterEarningValue:UILabel!
    @IBOutlet weak var lblFilterEarningTitle:UILabel!
    @IBOutlet weak var lblFilterClicksValue:UILabel!
    @IBOutlet weak var lblFilterClicksTitle:UILabel!
    
    @IBOutlet weak var lblStatisticsTitle: UILabel!
    @IBOutlet weak var lblStatisticsDesc: UILabel!
    @IBOutlet weak var viewStatisticsDot: UIView!
    
    @IBOutlet weak var lblFromDateTitle: UILabel!
    @IBOutlet weak var lblToDateTitle: UILabel!
    @IBOutlet weak var lblFromDateValue: UILabel!
    @IBOutlet weak var lblToDateValue: UILabel!
    
    @IBOutlet weak var dropDownFilter: DropDown!
    
    var affiliateDashboardData: PTProAPI.GetDashboardDataQuery.Data.GetDashboardData?

    override func viewDidLoad() {
        super.viewDidLoad()
        selectFilter()
        self.affiliateDashboardDataAPICall()
        intialSetup()
        // Do any additional setup after loading the view.
    }
    
    func intialSetup(){
        let glConversion = CAGradientLayer()
        let colorRight = UIColor(red: 244.0 / 255.0, green: 151.0 / 255.0, blue: 13.0 / 255.0, alpha: 1.0).cgColor
        let colorCenter = UIColor(red: 237.0 / 255.0, green: 179.0 / 255.0, blue: 93.0 / 255.0, alpha: 1.0).cgColor
        let colorEnd = UIColor(red: 239.0 / 255.0, green: 212.0 / 255.0, blue: 172.0 / 255.0, alpha: 1.0).cgColor
        glConversion.frame = viewTotalConversions.bounds
        glConversion.colors = [colorRight,colorCenter,colorEnd]
        glConversion.startPoint = CGPointMake(0.0, 0.5);
        glConversion.endPoint = CGPointMake(1.0, 0.5);
        glConversion.cornerRadius = 15.0
        viewTotalConversions.layer.insertSublayer(glConversion, at: 0)
        
        let glEarning = CAGradientLayer()
        let colorEarningRight = UIColor(red: 88.0 / 255.0, green: 182.0 / 255.0, blue: 5.0 / 255.0, alpha: 1.0).cgColor
        let colorEarningCenter = UIColor(red: 102.0 / 255.0, green: 189.0 / 255.0, blue: 96.0 / 255.0, alpha: 1.0).cgColor
        let colorEarningEnd = UIColor(red: 181.0 / 255.0, green: 243.0 / 255.0, blue: 176.0 / 255.0, alpha: 1.0).cgColor
        glEarning.frame = viewTotalConversions.bounds
        glEarning.colors = [colorEarningRight,colorEarningCenter,colorEarningEnd]
        glEarning.startPoint = CGPointMake(0.0, 0.5);
        glEarning.endPoint = CGPointMake(1.0, 0.5);
        glEarning.cornerRadius = 15.0
        viewTotalEarning.layer.insertSublayer(glEarning, at: 0)
        
        let glClicks = CAGradientLayer()
        let colorClicksRight = UIColor(red: 20.0 / 255.0, green: 137.0 / 255.0, blue: 228.0 / 255.0, alpha: 1.0).cgColor
        let colorClicksCenter = UIColor(red: 111.0 / 255.0, green: 185.0 / 255.0, blue: 240.0 / 255.0, alpha: 1.0).cgColor
        let colorClicksEnd = UIColor(red: 165.0 / 255.0, green: 206.0 / 255.0, blue: 237.0 / 255.0, alpha: 1.0).cgColor
        glClicks.frame = viewTotalConversions.bounds
        glClicks.colors = [colorClicksRight,colorClicksCenter,colorClicksEnd]
        glClicks.startPoint = CGPointMake(0.0, 0.5);
        glClicks.endPoint = CGPointMake(1.0, 0.5);
        glClicks.cornerRadius = 15.0
        viewTotalClicks.layer.insertSublayer(glClicks, at: 0)
    }
    
    func selectFilter(){
        // The list of array to display. Can be changed dynamically
        dropDownFilter.optionArray = ["Please Select","Last 7 Days","Week","Months"]
        dropDownFilter.rowHeight = 40
        dropDownFilter.listHeight = 200
        dropDownFilter.borderC = UIColor.lightGray
        dropDownFilter.didSelect{(selectedText , index ,id) in
            self.dropDownFilter.text = selectedText
        }
        dropDownFilter.delegate = self
    }
    
    func updateAffiliateData(){
        if let data = affiliateDashboardData{
            self.lblTotalConversionsValue.text = "\(data.conversionOverviewCount ?? 0)"
            self.lblTotalEarningValue.text = "\(data.earningOverviewCount ?? 0)"
            self.lblTotalClicksValue.text = "\(data.clickOverviewCount ?? 0)"
            self.lblFilterConversionsValue.text = "\(data.conversionFilterCount ?? 0)"
            self.lblFilterEarningValue.text = "\(data.earningFilterCount ?? 0)"
            self.lblFilterClicksValue.text = "\(data.clickFilterCount ?? 0)"
        }
    }
    
    //MARK: - API CALL
    func affiliateDashboardDataAPICall(){

        let getDashboardDataQuery = PTProAPI.GetDashboardDataQuery(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""), fromDate: .some("19-09-2023"), toDate: .some("19-10-2023"), filter: .some("Month"), graphType: .some("Earnings"))
        Network.shared.apollo_headerClient.fetch(query: getDashboardDataQuery, cachePolicy: .fetchIgnoringCacheData) { response in
            switch response{
            case .success(let result):
                if let data = result.data?.getDashboardData{
                    self.affiliateDashboardData = data
                    self.updateAffiliateData()
                } else {
                    self.view.makeToast(result.data?.getDashboardData?.errorMessage)
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
                break
            }
        }
    }
}

enum GraphType:String{
    case Conversions = "Conversions"
    case Earning = "Earnings"
    case Clicks = "Clicks"
}



