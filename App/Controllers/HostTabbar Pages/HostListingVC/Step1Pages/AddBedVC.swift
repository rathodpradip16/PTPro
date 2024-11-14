//
//  AddBedVC.swift
//  App
//
//  Created by Phycom on 21/10/24.
//  Copyright © 2024 RADICAL START. All rights reserved.
//

import UIKit

class AddBedVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var lblSleepingArragements: UILabel!
    @IBOutlet weak var lblReqInfo2: UILabel!
    @IBOutlet weak var lblReqInfo1: UILabel!
    @IBOutlet weak var lblMainTitle: UILabel!
    @IBOutlet weak var lblRoomName: CustomUITextField!
    @IBOutlet weak var tblBedList: UITableView!
    @IBOutlet weak var btnDeleteBedType: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeFooterView()
    }
    
    func initializeFooterView(){
        // Create a footer view
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tblBedList.frame.width, height: 80))
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
        print("Add Another Bed Type button tapped")
        // Add your logic here for the "Add Another Bed Type" action
    }
    
    @objc func cancelButtonTapped() {
        print("Cancel button tapped")
        // Add your logic here for the "Cancel" action
    }
    
    @objc func saveButtonTapped() {
        print("Save button tapped")
        // Add your logic here for the "Save" action
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return UITableView.automaticDimension
    //    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddMoreBedTVC", for: indexPath)as! AddMoreBedTVC
        cell.btnBedPlus.tag = indexPath.row
        cell.btnBedMinus.tag = indexPath.row
        cell.btnBedPlus.addTarget(self, action: #selector(onClickBedCountPlus(_:)), for: .touchUpInside)
        cell.btnBedMinus.addTarget(self, action: #selector(onClickBedCountMinus(_:)), for: .touchUpInside)
        return cell
    }
    
    // Action functions for the buttons
    @objc func onClickBedCountPlus(_ sender: UIButton) {
        // Find the cell based on the sender's tag or position
        if let cell = tblBedList.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as? AddMoreBedTVC {

        }
    }
    
    // Action functions for the buttons
    @objc func onClickBedCountMinus(_ sender: UIButton) {
        // Find the cell based on the sender's tag or position
        if let cell = tblBedList.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as? AddMoreBedTVC {

        }
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
