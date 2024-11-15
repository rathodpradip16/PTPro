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
    var arrBedTypes = [BedroomType]()
    var arrBathTypes = [BathroomType]()

    @IBOutlet weak var tblBathList: UITableView!
    @IBOutlet weak var tblBedList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Utility.shared.bedcount)
        tblBedList.delegate = self
        tblBathList.delegate = self
        tblBedList.dataSource = self
        tblBathList.dataSource = self
        if(Utility.shared.createId == 0){
            for i in 0..<Utility.shared.bedcount {
                let bedType = BedroomType(isBedroom: true, bedroomName: "Bedroom \(i)", bedroomId: "\(i)", bedType:[])
                self.arrBedTypes.append(bedType)
            }
            for j in 0..<Utility.shared.bathcount {
                let bathType = BathroomType(isBathroom: true, bathroomName: "Bathroom \(j)", bathroomId: "\(j)", bathroomType: "Full", bathroomAmenities: "")
                self.arrBathTypes.append(bathType)
            }
            tblBedList.reloadData()
            tblBathList.reloadData()
        }else{
            GetdynamicbedbathQuery()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return arrBedTypes.count
        }else{
            return arrBathTypes.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BedListTVC", for: indexPath) as! BedListTVC
            cell.addDetails.addTarget(self, action: #selector(goToBedDetailsPage), for: .touchUpInside)
            cell.lblTitle.text = arrBedTypes[indexPath.row].bedroomName
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
    
    //MARK: - API CALL
    func GetdynamicbedbathQuery(){
        let getdynamicbedbathQuery = PTProAPI.GetdynamicbedbathQuery(userId: Utility.shared.ProfileAPIArray?.userId ?? "", listId: .some(Utility.shared.createId))
        
        Network.shared.apollo_headerClient.fetch(query: getdynamicbedbathQuery, cachePolicy: .fetchIgnoringCacheData) { response in
            switch response{
            case .success(let result):
                if let status = result.data?.getdynamicbedbath?.status,status == 200 {
                    if let data = result.data,let getdynamicbedbath = data.getdynamicbedbath,let results = getdynamicbedbath.results{
                        if let arrBathroomTypes =  results.bathroomTypes as? [PTProAPI.GetdynamicbedbathQuery.Data.Getdynamicbedbath.Results.BathroomType]{
                            Utility.shared.arrBathroomType = arrBathroomTypes
                            for dicData in arrBathroomTypes{
                                self.arrBathTypes.append(BathroomType(isBathroom: dicData.isBathroom ?? true, bathroomName: dicData.bathroomname ?? "", bathroomId: dicData.bathroomId ?? "", bathroomType: dicData.bathroomtype ?? "", bathroomAmenities: dicData.bathroomamenities ?? ""))
                            }
                        }
                        if let arrBedroomTypes =  results.bedroomTypes as? [PTProAPI.GetdynamicbedbathQuery.Data.Getdynamicbedbath.Results.BedroomType]{
                            print(arrBedroomTypes._jsonValue)
                            for dicData in arrBedroomTypes{
                                var arrBedType = [BedType]()
                                if let bedType = dicData.bedType{
                                    for dicBedType in bedType{
                                        arrBedType.append(BedType(bedCount: dicBedType?.bedCount ?? "", bedName: dicBedType?.bedname ?? "", bedId: dicBedType?.bedId ?? "", bedType: dicBedType?.bedtype ?? "", bedSize: dicBedType?.bedsize ?? ""))
                                    }
                                }
                                self.arrBedTypes.append(BedroomType(isBedroom: dicData.isbedroom ?? true, bedroomName: dicData.bedroomname ?? "", bedroomId: dicData.bedroomId ?? "" , bedType: arrBedType ))
                            }
                            Utility.shared.arrBedroomType = arrBedroomTypes
                        }
                    }
                } else {

                }
                self.tblBedList.reloadData()
                self.tblBathList.reloadData()
            case .failure(let error):
                break
            }
        }
    }
}
