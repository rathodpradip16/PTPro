//
//  AddBedVC.swift
//  App
//
//  Created by Phycom on 21/10/24.
//  Copyright © 2024 RADICAL START. All rights reserved.
//

import UIKit

class AddBedVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate{
    
    @IBOutlet weak var lblSleepingArragements: UILabel!
    @IBOutlet weak var lblReqInfo2: UILabel!
    @IBOutlet weak var lblReqInfo1: UILabel!
    @IBOutlet weak var lblMainTitle: UILabel!
    @IBOutlet weak var lblRoomName: CustomUITextField!
    @IBOutlet weak var tblBedList: UITableView!
    @IBOutlet weak var btnDeleteBedType: UIButton!
    
    var arrImage = [String]()
    var selectedIndex = 0
    var arrBedType = [BedType]()
    var bedroomName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeFooterView()
        initialize()
        tblBedList.reloadData()
    }
    
    func initialize(){
        arrImage.removeAll()
        lblRoomName.text = bedroomName
        for _ in Utility.shared.arrBedtypelist{
            arrImage.append("ic_bed")
        }
    }
    
    func initializeFooterView(){
        // Create a footer view
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tblBedList.frame.width, height: 100))
        footerView.backgroundColor = .white
        
        // Add the "Add Another Bed Type" button
        let addButton = UIButton(type: .system)
        addButton.setTitle("+ Add Another Bed Type", for: .normal)
        addButton.tintColor = .systemBlue
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        footerView.addSubview(addButton)
        
        // Add the "Cancel" button
        let cancelButton = UIButton(type: .system)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.tintColor = .systemBlue
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        footerView.addSubview(cancelButton)
        
        // Add the "Save" button
        let saveButton = UIButton(type: .system)
        saveButton.setTitle("Save", for: .normal)
        saveButton.backgroundColor = .systemBlue
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.layer.cornerRadius = 5
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        footerView.addSubview(saveButton)
        
        // Add constraints for the buttons
        NSLayoutConstraint.activate([
            // Constraints for "Add Another Bed Type" button
            addButton.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 16),
            addButton.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 16),
            
            // Constraints for "Cancel" button
            cancelButton.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 16),
            cancelButton.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 8),
            cancelButton.heightAnchor.constraint(equalToConstant: 40),
            
            // Constraints for "Save" button
            saveButton.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -16),
            saveButton.leadingAnchor.constraint(equalTo: cancelButton.trailingAnchor, constant: 8),
            saveButton.centerYAnchor.constraint(equalTo: cancelButton.centerYAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 40),
            
            // Equal width constraint for "Cancel" and "Save" buttons
            cancelButton.widthAnchor.constraint(equalTo: saveButton.widthAnchor)
        ])
        
        // Set the footer view for the table view
        tblBedList.tableFooterView = footerView
    }
    
    // Action functions for the buttons
    @objc func addButtonTapped() {
        if self.arrBedType.count >= 6{
            return
        }
        var bedname = "Single"
        var bedId = "1"
        if arrBedType.count > 0{
            bedname = Utility.shared.arrBedtypelist[0].itemName ?? ""
            bedId = "\(Utility.shared.arrBedtypelist[0].typeId ?? 1)"
        }
        print("Add Another Bed Type button tapped")
        self.arrBedType.append(BedType(bedCount: "1", bedname: bedname, bedId: bedId, bedtype: bedname, bedsize: "") )
        tblBedList.reloadData()
        // Add your logic here for the "Add Another Bed Type" action
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrBedType.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    //    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    //  return UITableView.automaticDimension
    //  }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddMoreBedTVC", for: indexPath)as! AddMoreBedTVC
        cell.btnBedPlus.tag = indexPath.row
        cell.btnBedMinus.tag = indexPath.row
        cell.lblBedCount.text = self.arrBedType[indexPath.row].bedCount
        cell.btnBedPlus.setTitle("", for: .normal)
        cell.btnBedMinus.setTitle("", for: .normal)
        cell.btnBedPlus.addTarget(self, action: #selector(onClickBedCountPlus(_:)), for: .touchUpInside)
        cell.btnBedMinus.addTarget(self, action: #selector(onClickBedCountMinus(_:)), for: .touchUpInside)
      
        cell.btnDelete.tag = indexPath.row
        cell.btnDelete.addTarget(self, action: #selector(onClickDelete(_:)), for: .touchUpInside)

        cell.dropDownSelectBedType.optionArray = Utility.shared.arrBedtypelist.compactMap{ $0.itemName }
        cell.dropDownSelectBedType.optionIds = Utility.shared.arrBedtypelist.compactMap{ $0.typeId }
        cell.dropDownSelectBedType.optionImageArray = arrImage
        cell.dropDownSelectBedType.tag = indexPath.row
        cell.dropDownSelectBedType.rowHeight = 40
        cell.dropDownSelectBedType.listHeight = 200
        cell.dropDownSelectBedType.delegate = self
        cell.dropDownSelectBedType.text = self.arrBedType[indexPath.row].bedname
        cell.dropDownSelectBedType.selectedIndex = Utility.shared.arrBedtypelist.firstIndex(where: { $0.itemName == self.arrBedType[indexPath.row].bedname})
        cell.dropDownSelectBedType.didSelect { selectedText, index, id in
            cell.dropDownSelectBedType.text = selectedText
            self.arrBedType[indexPath.row].bedname = selectedText
        }
        return cell
    }
    
    @objc func goToTripsPage(){
        
    }
    
    @objc func cancelButtonTapped() {
        print("Cancel button tapped")
        self.navigationController?.popViewController(animated: true)
        // Add your logic here for the "Cancel" action
    }
    
    @objc func saveButtonTapped() {
        Utility.shared.arrBedTypes[selectedIndex].bedType = self.arrBedType
        Utility.shared.arrBedTypes[selectedIndex].bedroomName = self.bedroomName
        self.dismiss(animated: true)
        print("Save button tapped")
        // Add your logic here for the "Save" action
    }
    
    @objc func onClickDelete(_ sender: UIButton) {
        self.arrBedType.remove(at: sender.tag)
        tblBedList.reloadData()
    }
    
    // Action functions for the buttons
    @objc func onClickBedCountPlus(_ sender: UIButton) {
        let count = (Int(self.arrBedType[sender.tag].bedCount) ?? 0) + 1
        self.arrBedType[sender.tag].bedCount = "\(count)"
        tblBedList.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .none)
    }
    
    // Action functions for the buttons
    @objc func onClickBedCountMinus(_ sender: UIButton) {
        var count = Int(self.arrBedType[sender.tag].bedCount) ?? 0
        if count >= 2{
            count = count - 1
        }
        self.arrBedType[sender.tag].bedCount = "\(count)"
        tblBedList.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .none)
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        bedroomName = textField.text ?? ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == lblRoomName{
            return true
        }
        return false
    }
}
