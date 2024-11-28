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
        if(Utility.shared.createId == 0){
            Utility.shared.arrBedTypes.removeAll()
            Utility.shared.arrBathTypes.removeAll()
            for i in 0..<Utility.shared.bedcount {
                let bedType = BedroomType(isBedroom: true, bedroomName: "Bedroom \(i+1)", bedroomId: "\(i+1)", bedType:[])
                Utility.shared.arrBedTypes.append(bedType)
            }
            for j in 0..<Utility.shared.bathcount {
                let bathType = BathroomType(isBathroom: true, bathroomName: "Bathroom \(j+1)", bathroomId: "\(j+1)", bathroomType: "Full", bathroomAmenities: "")
                Utility.shared.arrBathTypes.append(bathType)
            }
        }else{
            GetdynamicbedbathQuery()
        }
        GetbathListQuery()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tblBedList.reloadData()
        tblBathList.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return Utility.shared.arrBedTypes.count
        }else{
            return Utility.shared.arrBathTypes.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BedListTVC", for: indexPath) as! BedListTVC
            cell.addDetails.tag = indexPath.row
            cell.addDetails.addTarget(self, action: #selector(goToBedDetailsPage(_ :)), for: .touchUpInside)
            cell.lblTitle.text = Utility.shared.arrBedTypes[indexPath.row].bedroomName
            if let arrBedType = Utility.shared.arrBedTypes[indexPath.row].bedType{
                cell.lblDescription.text = arrBedType.map{ "• \($0.bedCount) \($0.bedname) Bed" }.joined(separator: "\n" )
            }else{
                cell.lblDescription.text = ""
            }
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "BathListTVC", for: indexPath) as! BathListTVC
            cell.addDetails.tag = indexPath.row
            cell.addDetails.addTarget(self, action: #selector(goToBathDetailsPage), for: .touchUpInside)
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @objc func goToBedDetailsPage(_ sender: UIButton){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addBedVC = mainStoryboard.instantiateViewController(withIdentifier: "AddBedVC") as! AddBedVC
        addBedVC.selectedIndex = sender.tag
        addBedVC.arrBedType = Utility.shared.arrBedTypes[sender.tag].bedType ?? []
        addBedVC.bedroomName = Utility.shared.arrBedTypes[sender.tag].bedroomName
        addBedVC.modalPresentationStyle = .fullScreen
        self.present(addBedVC, animated: false, completion: nil)
    }
    
    @objc func goToBathDetailsPage(_ sender: UIButton){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addBathVC = mainStoryboard.instantiateViewController(withIdentifier: "AddBathVC") as! AddBathVC
        addBathVC.selectedIndex = sender.tag
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
                        Utility.shared.arrBedTypes.removeAll()
                        Utility.shared.arrBathTypes.removeAll()

                        if let arrBathroomTypes =  results.bathroomTypes as? [PTProAPI.GetdynamicbedbathQuery.Data.Getdynamicbedbath.Results.BathroomType]{
                            for dicData in arrBathroomTypes{
                                Utility.shared.arrBathTypes.append(BathroomType(isBathroom: dicData.isBathroom ?? true, bathroomName: dicData.bathroomname ?? "", bathroomId: dicData.bathroomId ?? "", bathroomType: dicData.bathroomtype ?? "", bathroomAmenities: dicData.bathroomamenities ?? ""))
                            }
                        }
                        if let arrBedroomTypes =  results.bedroomTypes as? [PTProAPI.GetdynamicbedbathQuery.Data.Getdynamicbedbath.Results.BedroomType]{
                            print(arrBedroomTypes._jsonValue)
                            for dicData in arrBedroomTypes{
                                var arrBedType = [BedType]()
                                if let bedType = dicData.bedType{
                                    for dicBedType in bedType{
                                        arrBedType.append(BedType(bedCount: dicBedType?.bedCount ?? "", bedname: dicBedType?.bedname ?? "", bedId: dicBedType?.bedId ?? "", bedtype: dicBedType?.bedtype ?? "", bedsize: dicBedType?.bedsize ?? ""))
                                    }
                                }
                                Utility.shared.arrBedTypes.append(BedroomType(isBedroom: dicData.isbedroom ?? true, bedroomName: dicData.bedroomname ?? "", bedroomId: dicData.bedroomId ?? "" , bedType: arrBedType ))
                            }
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
    
    func GetbathListQuery(){
        let getdynamicbedtypelistQuery = PTProAPI.GetdynamicbedtypelistQuery()
        
        Network.shared.apollo_headerClient.fetch(query: getdynamicbedtypelistQuery, cachePolicy: .fetchIgnoringCacheData) { response in
            switch response{
            case .success(let result):
                if let status = result.data?.getdynamicbedtypelist?.status,status == 200 {
                    if let data = result.data,let getdynamicbedbath = data.getdynamicbedtypelist,let results = getdynamicbedbath.results as? [PTProAPI.GetdynamicbedtypelistQuery.Data.Getdynamicbedtypelist.Result]{
                        Utility.shared.arrBedtypelist = results
                    }
                } else {

                }
            case .failure(let error):
                break
            }
        }
    }
}
