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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load the custom footer view from .xib
        let footerView = ViewAddMoreBed()
        // Set the custom view as the table footer
        tblBathTypeList.tableFooterView = footerView
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddMoreBathTVC", for: indexPath)as! AddMoreBathTVC
        
        return cell
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
