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
import Lottie

class OccupancyInsightsVC: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet weak var LocationAnimationView: UIView!
    var lottieWholeView = UIView()
    var lottieView =  LottieAnimationView()
    

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
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
    
    let baseUrl = "https://maps.googleapis.com/maps/api/geocode/json?"
    
    var locManager = CLLocationManager()
    var currentLocation: CLLocation!
    var currentNeedleValue = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lottieView = LottieAnimationView.init(name: "loading_qwe")
        self.meterView.blinkAnimate = false
        self.meterView.needleValue = 0.0
        self.centerMainView.isHidden = true
        self.scrollView.isHidden = true
        self.btnRefreshData.isHidden = true
        self.stackView.isHidden = true
        
        let animationView = LottieAnimationView(name: "animation_location")
        animationView.frame = self.LocationAnimationView.bounds
        self.LocationAnimationView.addSubview(animationView)
        self.LocationAnimationView.contentMode = UIView.ContentMode.scaleAspectFill
        animationView.sizeToFit()
        // animationView.sizeThatFits(self.LocationAnimationView.frame.size)
        animationView.play{ (finished) in
            // Do Something
            animationView.removeFromSuperview()
            self.LocationAnimationView.willRemoveSubview(animationView)
            self.centerMainView.isHidden = false
            self.scrollView.isHidden = false
            self.btnRefreshData.isHidden = false
            self.stackView.isHidden = false
        }
        
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
            self.getAddressForLatLng(latitude: "\(loc.coordinate.latitude)", longitude: "\(loc.coordinate.longitude)")
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
        self.lottieAnimation()
        self.calculateOccupancyRateAPICall()
    }
    
    @objc func doneEndDatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd,yyyy"
        txtToDateValue.text = formatter.string(from: datePickerEndDate!.date)
        formatter.dateFormat = "yyyy-MM-dd"
        selectedEndDate = formatter.string(from: datePickerEndDate!.date)
        self.updateDateMaxMin()
        self.view.endEditing(true)
        self.lottieAnimation()
        self.calculateOccupancyRateAPICall()
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    func getAddressForLatLng(latitude: String, longitude: String) {
        let url = URL(string: "\(baseUrl)latlng=\(latitude),\(longitude)&key=\(GOOGLE_API_KEY)")
        let data = try! Data(contentsOf: url!)
        let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
        if let result = json["results"] as? [[String: Any]] {
            if let address = result[0]["formatted_address"] as? String {
                self.lblLocation.text = address
            }
        }
    }
    
    func lottieAnimation()
    {
        self.lottieView.isHidden = false
        self.lottieWholeView.isHidden = false
        self.lottieWholeView.frame = CGRect(x: 0, y: 0, width: FULLWIDTH, height: FULLHEIGHT)
        self.lottieWholeView.backgroundColor =  UIColor.black.withAlphaComponent(0.5)
        self.view.addSubview(lottieWholeView)
        self.lottieView.frame = CGRect(x:FULLWIDTH/2-50, y: FULLHEIGHT/2-50, width: 100, height: 100)
        self.lottieWholeView.addSubview(self.lottieView)
        self.lottieView.backgroundColor = UIColor(named: "lottie-bg")
        self.lottieView.layer.cornerRadius = 6.0
        self.lottieView.clipsToBounds = true
        self.lottieView.play()
        Timer.scheduledTimer(timeInterval:0.3, target: self, selector: #selector(autoscroll), userInfo: nil, repeats: true)
    }
    
    @objc func autoscroll()
    {
        self.lottieView.play()
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
        self.lottieAnimation()
        self.calculateOccupancyRateAPICall()
    }
    
    @IBAction func onClickRefreshData(_ sender: Any) {
        self.lottieAnimation()
        self.calculateOccupancyRateAPICall()
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    //MARK: - API CALL
    func calculateOccupancyRateAPICall(){
        let calculateOccupancyRateQuery =  PTProAPI.CalculateOccupancyRateQuery(lat: .some(userLat), lng: .some(userLong), filter: .some(selectedFilterType) , startDate: .some(selectedStartDate), endDate: .some(selectedEndDate))
        Network.shared.apollo_headerClient.fetch(query: calculateOccupancyRateQuery, cachePolicy: .fetchIgnoringCacheData) { response in
            self.lottieWholeView.isHidden = true
            self.lottieView.isHidden = true
            switch response{
            case .success(let result):
                if let status = result.data?.calculateOccupancyRate?.status,status == 200,let occupancyRate = result.data?.calculateOccupancyRate?.occupancy_Rate {
                    if self.currentNeedleValue != occupancyRate{
                        self.currentNeedleValue = occupancyRate
                        self.meterView.needleValue = occupancyRate
                        self.lblOccupancyRate.text = "\(occupancyRate)%"
                    }
                }else{
                    if self.currentNeedleValue != 0.0{
                        self.currentNeedleValue = 0.0
                        self.meterView.needleValue = 0
                        self.lblOccupancyRate.text = "\(0.0)%"
                    }
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
                break
            }
        }
    }
    
}
