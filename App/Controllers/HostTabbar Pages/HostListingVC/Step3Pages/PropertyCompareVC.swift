//
//  PropertyCompareVC.swift
//  App
//
//  Created by Phycom Mac Pro on 21/05/24.
//  Copyright © 2024 RADICAL START. All rights reserved.
//

import UIKit

class PropertyCompareVC: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var tblBasePriceQuickTip: UITableView!

    var arrPricingFilter = [[String:Any]]()
    var arrCurrentPricingFilter = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPricingFilter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyCompareTVC", for: indexPath)as! PropertyCompareTVC
        cell.selectionStyle = .none
        if let itemName = arrPricingFilter[indexPath.row]["itemName"]{
            cell.itemName.text = "\(itemName)"
        }else{
            cell.itemName.text = ""
        }
        
        if let resultScore = arrPricingFilter[indexPath.row]["score"]{
            cell.resultPropertyScore.text = "\(resultScore)"
        }else{
            cell.resultPropertyScore.text = "-"
        }

        if let currentScore = arrCurrentPricingFilter.filter({ ($0["itemName"] as? String ?? "") == arrPricingFilter[indexPath.row]["itemName"] as? String ?? ""}).first{
            cell.currentPropertyScore.text = "\(currentScore["score"] ?? "-")"
        }else{
            cell.currentPropertyScore.text = "-"
        }
        return cell
    }
    
}
