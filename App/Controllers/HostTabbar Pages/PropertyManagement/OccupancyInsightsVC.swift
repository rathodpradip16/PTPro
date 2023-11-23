//
//  OccupancyInsightsVC.swift
//  App
//
//  Created by Phycom Mac Pro on 02/11/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit
import ABGaugeViewKit
import CoreLocation

class OccupancyInsightsVC: UIViewController, CLLocationManagerDelegate{

    @IBOutlet weak var lblFromDateTitle: UILabel!
    @IBOutlet weak var lblToDateTitle: UILabel!
    @IBOutlet weak var txtFromDateValue: UITextField!
    @IBOutlet weak var txtToDateValue: UITextField!
    @IBOutlet weak var btnFromDateValue: UIButton!
    @IBOutlet weak var btnToDateValue: UIButton!
    
    @IBOutlet weak var imgLocation: UIImageView!
    @IBOutlet weak var lblLocation: UILabel!
    
    @IBOutlet weak var segmentGraphFilter: UISegmentedControl!
    
    @IBOutlet weak var centerMainView: UIView!
    
    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var meterView: ABGaugeView!
    
    @IBOutlet weak var lblOccupancyRate: UILabel!
  
    @IBOutlet weak var btnRefreshData: UIButton!
   
    var datePickerStartDate : UIDatePicker?
    var datePickerEndDate: UIDatePicker?
    var selectedStartDate = ""
    var selectedEndDate = ""
    var selectedFilterType = "AllData"
    var userLat = 0.0
    var userLong = 0.0
    
    
    var locManager = CLLocationManager()
    var currentLocation: CLLocation!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnFromDateValue.setTitle("", for: .normal)
        self.btnToDateValue.setTitle("", for: .normal)
        self.segmentGraphFilter.selectedSegmentIndex = 3
        self.initialiseDatePicker()
        self.updateLocation()
    }
    
    func updateLocation(){
        locManager.delegate = self
        locManager.requestWhenInUseAuthorization()

        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            locManager.startUpdatingLocation()
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            locManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.first{
            self.userLat = loc.coordinate.latitude
            self.userLong = loc.coordinate.longitude
            self.getAddressFromLatLon(pdblLatitude: loc.coordinate.latitude , withLongitude: loc.coordinate.longitude)
            self.calculateOccupancyRateAPICall()
        }
        locManager.stopUpdatingLocation()
    }
    
    func initialiseDatePicker(){
        txtFromDateValue.tintColor = .clear
        txtToDateValue.tintColor = .clear
        
        let screenWidth = UIScreen.main.bounds.width
        datePickerStartDate = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        datePickerEndDate = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        
        //Start Date date Picker
        if #available(iOS 13.4, *) {
            datePickerStartDate!.preferredDatePickerStyle  = .wheels
            datePickerStartDate!.sizeToFit()
        }
        datePickerStartDate!.datePickerMode = .date
        datePickerStartDate!.sizeToFit()
        txtFromDateValue.inputView = datePickerStartDate
        //ToolBar
        let toolbarStartDate = UIToolbar();
        toolbarStartDate.sizeToFit()
        let doneButtonStartDate = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneStartDatePicker));
        let spaceButtonStartDate = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButtonStartDate = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        toolbarStartDate.setItems([cancelButtonStartDate,spaceButtonStartDate,doneButtonStartDate], animated: false)
        txtFromDateValue.inputAccessoryView = toolbarStartDate
        
        //End Date
        datePickerEndDate!.datePickerMode = .date
        
        if #available(iOS 13.4, *) {
            datePickerEndDate!.preferredDatePickerStyle  = .wheels
            datePickerEndDate!.sizeToFit()
        }
        txtToDateValue.inputView = datePickerEndDate
        
        //ToolBar
        let toolbarEndDate = UIToolbar();
        toolbarEndDate.sizeToFit()
        let doneButtonEndDate = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneEndDatePicker));
        let spaceButtonEndDate  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButtonEndDate  = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbarEndDate.setItems([cancelButtonEndDate,spaceButtonEndDate,doneButtonEndDate], animated: false)
        
        txtToDateValue.inputAccessoryView = toolbarEndDate
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd,yyyy"
        txtFromDateValue.text = formatter.string(from: Calendar.current.date(byAdding: .month, value: -1, to: Date())!)
        txtToDateValue.text = formatter.string(from: Date())
        datePickerStartDate!.date = Calendar.current.date(byAdding: .month, value: -1, to: Date())!
        datePickerEndDate!.date = Date()
        
        formatter.dateFormat = "yyyy-MM-dd"
        selectedStartDate = formatter.string(from: datePickerStartDate!.date)
        selectedEndDate = formatter.string(from: datePickerEndDate!.date)
        
        self.updateDateMaxMin()
    }
    
    func updateDateMaxMin(){
        datePickerStartDate!.maximumDate =  datePickerEndDate!.date
        datePickerEndDate!.maximumDate = Date()
        datePickerEndDate!.minimumDate = datePickerStartDate!.date
    }
    
    @objc func doneStartDatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd,yyyy"
        txtFromDateValue.text = formatter.string(from: datePickerStartDate!.date)
        formatter.dateFormat = "yyyy-MM-dd"
        selectedStartDate = formatter.string(from: datePickerStartDate!.date)
        self.updateDateMaxMin()
        self.view.endEditing(true)
     //   self.propertyDashboardDataAPICall()
    }
    
    @objc func doneEndDatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd,yyyy"
        txtToDateValue.text = formatter.string(from: datePickerEndDate!.date)
        formatter.dateFormat = "yyyy-MM-dd"
        selectedEndDate = formatter.string(from: datePickerEndDate!.date)
        self.updateDateMaxMin()
        self.view.endEditing(true)
     //   self.propertyDashboardDataAPICall()
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    
    func getAddressFromLatLon(pdblLatitude: Double, withLongitude pdblLongitude: Double) {
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let lat: Double = pdblLatitude
        //21.228124
        let lon: Double = pdblLongitude
        //72.833770
        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = lat
        center.longitude = lon
        
        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
        
        
        ceo.reverseGeocodeLocation(loc, completionHandler:
                                    {(placemarks, error) in
            if (error != nil)
            {
                print("reverse geodcode fail: \(error!.localizedDescription)")
            }
            let pm = placemarks! as [CLPlacemark]
            
            if pm.count > 0 {
                let pm = placemarks![0]
                print(pm.country ?? "")
                print(pm.locality ?? "")
                print(pm.subLocality ?? "")
                print(pm.thoroughfare ?? "")
                print(pm.postalCode ?? "")
                print(pm.subThoroughfare ?? "")
                var addressString : String = ""
                if pm.name != nil {
                    addressString = addressString + pm.name! + ", "
                }
                if pm.thoroughfare != nil {
                    addressString = addressString + pm.thoroughfare! + ", "
                }
                if pm.subThoroughfare != nil {
                    addressString = addressString + pm.subThoroughfare! + ", "
                }
                if pm.subLocality != nil {
                    addressString = addressString + pm.subLocality! + ", "
                }
                if pm.locality != nil {
                    addressString = addressString + pm.locality! + ", "
                }
                if pm.subAdministrativeArea != nil {
                    addressString = addressString + pm.subAdministrativeArea! + ", "
                }
                if pm.administrativeArea != nil {
                    addressString = addressString + pm.administrativeArea! + ", "
                }
                if pm.country != nil {
                    addressString = addressString + pm.country! + ", "
                }
                if pm.postalCode != nil {
                    addressString = addressString + pm.postalCode! + " "
                }
                
                self.lblLocation.text = addressString
                print(addressString)
            }
        })
        
    }
    
    //MARK: - Actions
    @IBAction func onClickToDate(_ sender: Any) {
        txtToDateValue.becomeFirstResponder()
    }
    
    @IBAction func onClickFromDate(_ sender: Any) {
        txtFromDateValue.becomeFirstResponder()
    }
    
    @IBAction func onClickSegmentGraphFilter(_ sender: Any) {
        if let segBtn = sender as? UISegmentedControl{
            if segBtn.selectedSegmentIndex == 0 {
                selectedFilterType = "Day"
            }else if segBtn.selectedSegmentIndex == 1{
                selectedFilterType = "Week"
            }else if segBtn.selectedSegmentIndex == 2{
                selectedFilterType = "Month"
            }else{
                selectedFilterType = "AllData"
            }
        }
    }
    
    @IBAction func onClickRefreshData(_ sender: Any) {
        self.calculateOccupancyRateAPICall()
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.dismiss(animated: true)
    }

        
    //MARK: - API CALL
    func calculateOccupancyRateAPICall(){
        let calculateOccupancyRateQuery =  PTProAPI.CalculateOccupancyRateQuery(lat: .some(userLat), lng: .some(userLong), filter: .some(selectedFilterType) , startDate: .some(selectedStartDate), endDate: .some(selectedEndDate))
        Network.shared.apollo_headerClient.fetch(query: calculateOccupancyRateQuery, cachePolicy: .fetchIgnoringCacheData) { response in
            switch response{
            case .success(let result):
                if let status = result.data?.calculateOccupancyRate?.status,status == 200,let occupancyRate = result.data?.calculateOccupancyRate?.occupancy_Rate {
                    self.meterView.needleValue = occupancyRate
                    self.lblOccupancyRate.text = "\(occupancyRate)%"
                } else {
                    self.view.makeToast(result.data?.calculateOccupancyRate?.errorMessage)
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
                break
            }
        }
    }
    
}
