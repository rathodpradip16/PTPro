//
//  AddBathVC.swift
//  App
//
//  Created by Phycom on 21/10/24.
//  Copyright © 2024 RADICAL START. All rights reserved.
//

import UIKit

class AddBathVC: UIViewController {

    @IBOutlet weak var tblBathTypeList: UITableView!
    var selectedIndex = 0
    
    var arrBathroomammenities = [
        ["title":"Bathtub or Shower","selected":false],
        ["title":"Toilet","selected":false],
        ["title": "Shower only","selected":false],
        ["title":"Bathtub","selected":false],
        ["title":"Jetted bathtub","selected":false],
        ["title":"Bidet","selected":false],
        ["title":"Towels provided","selected":false],
        ["title":"Hair dryer","selected":false]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load the custom footer view from .xib
        let footerView = ViewAddMoreBed()
        // Set the custom view as the table footer
        tblBathTypeList.tableFooterView = footerView
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrBathroomammenities.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddMoreBathTVC", for: indexPath)as! AddMoreBathTVC
     //   cell.lblTitle.text = arrBathroomammenities[indexPath.row]
        return cell
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
