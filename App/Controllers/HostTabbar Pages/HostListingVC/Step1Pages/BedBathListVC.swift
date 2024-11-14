//
//  BedBathListVC.swift
//  App
//
//  Created by Phycom on 16/10/24.
//  Copyright © 2024 RADICAL START. All rights reserved.
//

import UIKit

class BedBathListVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var bedTypeValue = ""
    var bedType = [String]()
    
    var bedtypeInfoArr = [[String : Any]]()
    var bed_id = [Int]()
    var bed_type_id = [Int]()
    var array_Count = [Int]()
    
    @IBOutlet weak var tblBathList: UITableView!
    @IBOutlet weak var tblBedList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Utility.shared.bedcount)
        tblBedList.delegate = self
        tblBathList.delegate = self
        tblBedList.dataSource = self
        tblBathList.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return Utility.shared.bedcount
        }else{
            return Utility.shared.bathcount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BedListTVC", for: indexPath) as! BedListTVC
            cell.addDetails.addTarget(self, action: #selector(goToBedDetailsPage), for: .touchUpInside)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "BathListTVC", for: indexPath) as! BathListTVC
            cell.addDetails.addTarget(self, action: #selector(goToBathDetailsPage), for: .touchUpInside)
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @objc func goToBedDetailsPage(){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addBedVC = mainStoryboard.instantiateViewController(withIdentifier: "AddBedVC") as! AddBedVC
        addBedVC.modalPresentationStyle = .fullScreen
        self.present(addBedVC, animated: false, completion: nil)
    }
    
    @objc func goToBathDetailsPage(){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addBathVC = mainStoryboard.instantiateViewController(withIdentifier: "AddBathVC") as! AddBathVC
        addBathVC.modalPresentationStyle = .fullScreen
        self.present(addBathVC, animated: false, completion: nil)
    }
    
    
}
