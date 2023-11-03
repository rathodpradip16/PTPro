//
//  PropertyInsightsVC.swift
//  App
//
//  Created by Phycom Mac Pro on 02/11/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit
import DGCharts
import DropDown

class PropertyInsightsVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var viewTotalInquiryToBooking: UIView!
    @IBOutlet weak var viewTotalOccupancyRate: UIView!
    @IBOutlet weak var viewTotalAverageDailyRate: UIView!
    @IBOutlet weak var viewTotalRevenuePerRoom: UIView!
    
    @IBOutlet weak var lblTotalInquiryToBookingConversionsValue: UILabel!
    @IBOutlet weak var lblTotalInquiryToBookingConversionsTitle: UILabel!
    @IBOutlet weak var lblTotalOccupancyRateValue:UILabel!
    @IBOutlet weak var lblTotalOccupancyRateTitle:UILabel!
    @IBOutlet weak var lblTotalAverageDailyRateValue:UILabel!
    @IBOutlet weak var lblTotalAverageDailyRateTitle:UILabel!
    @IBOutlet weak var lblTotalRevenuePerRoomValue:UILabel!
    @IBOutlet weak var lblTotalRevenuePerRoomTitle:UILabel!
    
    @IBOutlet weak var lblFilterTotal1Value: UILabel!
    @IBOutlet weak var lblFilterTotal1Title: UILabel!
    @IBOutlet weak var lblFilterTotal2Value:UILabel!
    @IBOutlet weak var lblFilterTotal2Title:UILabel!
    @IBOutlet weak var lblFilterConversionRateValue:UILabel!
    @IBOutlet weak var lblFilterConversionRateTitle:UILabel!
    
    @IBOutlet weak var lblStatisticsTitle: UILabel!
    @IBOutlet weak var lblStatisticsDesc: UILabel!
    @IBOutlet weak var viewStatisticsDot: UIView!
    @IBOutlet weak var viewStatisticsDesc: UIStackView!
    
    @IBOutlet weak var lblFromDateTitle: UILabel!
    @IBOutlet weak var lblToDateTitle: UILabel!
    @IBOutlet weak var txtFromDateValue: UITextField!
    @IBOutlet weak var txtToDateValue: UITextField!
    @IBOutlet weak var btnFromDateValue: UIButton!
    @IBOutlet weak var btnToDateValue: UIButton!
    
    @IBOutlet weak var btnFilterTotal1: UIButton!
    @IBOutlet weak var btnFilterTotal2: UIButton!
    @IBOutlet weak var btnFilterConversionRate: UIButton!
    
    @IBOutlet weak var dropDownFilter: DropDown!
    
    @IBOutlet weak var dropDownSelectPropertyGraphType: DropDown!
    
    @IBOutlet weak var lblNoResult: UILabel!
    @IBOutlet weak var imgNoResult: UIImageView!
    
    var propertyDashboardData: PTProAPI.GetPropertyManagersDataQuery.Data.GetPropertyManagersData?
    
    var graphData1 = [PTProAPI.GetPropertyManagersDataQuery.Data.GetPropertyManagersData.GraphData.Data1?]()
    var graphData2 = [PTProAPI.GetPropertyManagersDataQuery.Data.GetPropertyManagersData.GraphData.Data2?]()
    
    var datePickerStartDate : UIDatePicker?
    var datePickerEndDate: UIDatePicker?
    var selectedStartDate = ""
    var selectedEndDate = ""
    
    var selectedPropertyGraphType:PropertyGraphType = .None
    var selectedPropertyGraphFilterType:GraphFilterType = .PleaseSelect
    
    var revenueFromBookingsIsSelected = true
    var averageDailyRateSelected = true
    
    //charts
    @IBOutlet var chartView: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblStatisticsDesc.isHidden = true
        self.lblStatisticsTitle.isHidden = true
        self.viewStatisticsDesc.isHidden = true
        selectFilter()
        selectGraphType()
        intialSetup()
        setupChartView()
        self.initialiseDatePicker()
        self.propertyDashboardDataAPICall()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Custom Methods
    func intialSetup(){
        let glInquiryToBooking = CAGradientLayer()
        let colorRight = UIColor(red: 244.0 / 255.0, green: 151.0 / 255.0, blue: 13.0 / 255.0, alpha: 1.0).cgColor
        let colorCenter = UIColor(red: 237.0 / 255.0, green: 179.0 / 255.0, blue: 93.0 / 255.0, alpha: 1.0).cgColor
        let colorEnd = UIColor(red: 239.0 / 255.0, green: 212.0 / 255.0, blue: 172.0 / 255.0, alpha: 1.0).cgColor
        glInquiryToBooking.frame = viewTotalInquiryToBooking.bounds
        glInquiryToBooking.colors = [colorRight,colorCenter,colorEnd]
        glInquiryToBooking.startPoint = CGPointMake(0.0, 0.5);
        glInquiryToBooking.endPoint = CGPointMake(1.0, 0.5);
        glInquiryToBooking.cornerRadius = 15.0
        glInquiryToBooking.masksToBounds = true
        viewTotalInquiryToBooking.clipsToBounds = true
        viewTotalInquiryToBooking.layer.insertSublayer(glInquiryToBooking, at: 0)
        
        let glOccupancyRate = CAGradientLayer()
        let colorOccupancyRight = UIColor(red: 88.0 / 255.0, green: 182.0 / 255.0, blue: 5.0 / 255.0, alpha: 1.0).cgColor
        let colorOccupancyCenter = UIColor(red: 102.0 / 255.0, green: 189.0 / 255.0, blue: 96.0 / 255.0, alpha: 1.0).cgColor
        let colorOccupancyEnd = UIColor(red: 181.0 / 255.0, green: 243.0 / 255.0, blue: 176.0 / 255.0, alpha: 1.0).cgColor
        glOccupancyRate.frame = viewTotalOccupancyRate.bounds
        glOccupancyRate.colors = [colorOccupancyRight,colorOccupancyCenter,colorOccupancyEnd]
        glOccupancyRate.startPoint = CGPointMake(0.0, 0.5);
        glOccupancyRate.endPoint = CGPointMake(1.0, 0.5);
        glOccupancyRate.cornerRadius = 15.0
        glOccupancyRate.masksToBounds = true
        viewTotalOccupancyRate.clipsToBounds = true
        viewTotalOccupancyRate.layer.insertSublayer(glOccupancyRate, at: 0)
        
        let glAverageDailyRate = CAGradientLayer()
        let colorAverageDailyRateRight = UIColor(red: 20.0 / 255.0, green: 137.0 / 255.0, blue: 228.0 / 255.0, alpha: 1.0).cgColor
        let colorAverageDailyRateCenter = UIColor(red: 111.0 / 255.0, green: 185.0 / 255.0, blue: 240.0 / 255.0, alpha: 1.0).cgColor
        let colorAverageDailyRateEnd = UIColor(red: 165.0 / 255.0, green: 206.0 / 255.0, blue: 237.0 / 255.0, alpha: 1.0).cgColor
        glAverageDailyRate.frame = viewTotalAverageDailyRate.bounds
        glAverageDailyRate.colors = [colorAverageDailyRateRight,colorAverageDailyRateCenter,colorAverageDailyRateEnd]
        glAverageDailyRate.startPoint = CGPointMake(0.0, 0.5);
        glAverageDailyRate.endPoint = CGPointMake(1.0, 0.5);
        glAverageDailyRate.cornerRadius = 15.0
        glAverageDailyRate.masksToBounds = true
        viewTotalAverageDailyRate.clipsToBounds = true
        viewTotalAverageDailyRate.layer.insertSublayer(glAverageDailyRate, at: 0)
        
        let glRevenuePerRoom = CAGradientLayer()
        let colorRevenueRight = UIColor(red: 255.0 / 255.0, green: 56.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0).cgColor
        let colorRevenueCenter = UIColor(red: 253.0 / 255.0, green: 92.0 / 255.0, blue: 99.0 / 255.0, alpha: 1.0).cgColor
        let colorRevenueEnd = UIColor(red: 251.0 / 255.0, green: 206.0 / 255.0, blue: 177.0 / 255.0, alpha: 1.0).cgColor
        glRevenuePerRoom.frame = viewTotalRevenuePerRoom.bounds
        glRevenuePerRoom.colors = [colorRevenueRight,colorRevenueCenter,colorRevenueEnd]
        glRevenuePerRoom.startPoint = CGPointMake(0.0, 0.5);
        glRevenuePerRoom.endPoint = CGPointMake(1.0, 0.5);
        glRevenuePerRoom.cornerRadius = 15.0
        glRevenuePerRoom.masksToBounds = true
        viewTotalRevenuePerRoom.clipsToBounds = true
        viewTotalRevenuePerRoom.layer.insertSublayer(glRevenuePerRoom, at: 0)
        
        btnFromDateValue.setTitle("", for: .normal)
        btnToDateValue.setTitle("", for: .normal)
        btnFilterTotal1.setTitle("", for: .normal)
        btnFilterTotal2.setTitle("", for: .normal)
        btnFilterConversionRate.setTitle("", for: .normal)
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
        
        selectedPropertyGraphType = .None
        selectedPropertyGraphFilterType = .PleaseSelect
        dropDownFilter.text = (selectedPropertyGraphFilterType == .PleaseSelect) ? "Please Select" :  selectedPropertyGraphFilterType.rawValue
        dropDownSelectPropertyGraphType.text = "Select Graph"
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
        self.propertyDashboardDataAPICall()
    }
    
    @objc func doneEndDatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd,yyyy"
        txtToDateValue.text = formatter.string(from: datePickerEndDate!.date)
        formatter.dateFormat = "yyyy-MM-dd"
        selectedEndDate = formatter.string(from: datePickerEndDate!.date)
        self.updateDateMaxMin()
        self.view.endEditing(true)
        self.propertyDashboardDataAPICall()
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    override public func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(copy(_:)) || action == #selector(paste(_:)) {
            return false
        }
        return true
    }
    
    func getDateFromString(strDate:String,strformat:String) -> Date{
        let formatter = DateFormatter()
        formatter.dateFormat = strformat
        return formatter.date(from: strDate) ?? Date()
    }
    
    func getStringFromDate(date:Date,strformat:String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = strformat
        return formatter.string(from: date)
    }
    
    
    func selectFilter(){
        // The list of array to display. Can be changed dynamically
        dropDownFilter.optionArray = ["Please Select","Last 7 Days","Week","Months"]
        dropDownFilter.rowHeight = 40
        dropDownFilter.listHeight = 200
        dropDownFilter.borderC = UIColor.lightGray
        dropDownFilter.font = UIFont.boldSystemFont(ofSize: 17)
        dropDownFilter.didSelect{(selectedText , index ,id) in
            switch index{
            case 0:
                self.selectedPropertyGraphFilterType = .PleaseSelect
                break
            case 1:
                self.selectedPropertyGraphFilterType = .last7Days
                break
            case 2:
                self.selectedPropertyGraphFilterType = .week
                break
            case 3:
                self.selectedPropertyGraphFilterType = .months
                break
            default:
                self.selectedPropertyGraphFilterType = .PleaseSelect
                break
            }
            self.propertyDashboardDataAPICall()
        }
        dropDownFilter.delegate = self
    }
    
    func selectGraphType(){
        // The list of array to display. Can be changed dynamically
        dropDownSelectPropertyGraphType.optionArray = ["Select Graph","Inquiry","Occupancy","Average","RevPAR"]
        dropDownSelectPropertyGraphType.rowHeight = 40
        dropDownSelectPropertyGraphType.listHeight = 200
        dropDownSelectPropertyGraphType.borderC = UIColor.lightGray
        dropDownSelectPropertyGraphType.font = UIFont.boldSystemFont(ofSize: 17)
        dropDownSelectPropertyGraphType.didSelect{(selectedText , index ,id) in
            switch index{
            case 0:
                self.selectedPropertyGraphType = .None
                self.lblStatisticsDesc.isHidden = true
                self.lblStatisticsTitle.isHidden = true
                self.viewStatisticsDesc.isHidden = true
                break
            case 1:
                self.selectedPropertyGraphType = .Inquiry
                self.lblStatisticsDesc.isHidden = true
                self.lblStatisticsTitle.isHidden = false
                self.viewStatisticsDesc.isHidden = true
                self.lblStatisticsTitle.text = "Inquiry to Booking Statistics"
                break
            case 2:
                self.selectedPropertyGraphType = .Occupancy
                self.lblStatisticsDesc.isHidden = true
                self.lblStatisticsTitle.isHidden = false
                self.viewStatisticsDesc.isHidden = true
                self.lblStatisticsTitle.text = "Occupancy Rate statistics"
                break
            case 3:
                self.selectedPropertyGraphType = .Average
                self.lblStatisticsDesc.isHidden = false
                self.lblStatisticsTitle.isHidden = false
                self.viewStatisticsDesc.isHidden = false
                self.lblStatisticsTitle.text = "Average Daily Rate statistics"
                self.lblStatisticsDesc.text = "Total Revenue From Bookings"
                self.viewStatisticsDot.backgroundColor = Theme.propertyDashRedColor
                self.revenueFromBookingsIsSelected = true
                break
            default:
                self.selectedPropertyGraphType = .RevPAR
                self.lblStatisticsDesc.isHidden = false
                self.lblStatisticsTitle.isHidden = false
                self.viewStatisticsDesc.isHidden = false
                self.lblStatisticsTitle.text = "Revenue Per Available Room statistics"
                self.lblStatisticsDesc.text = "Average Daily Rate"
                self.viewStatisticsDot.backgroundColor = Theme.propertyDashRedColor
                self.averageDailyRateSelected = true
                break
            }
            self.propertyDashboardDataAPICall()
        }
        dropDownSelectPropertyGraphType.delegate = self
    }
    
    
    @objc func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == dropDownFilter{
            self.view.endEditing(true)
            DispatchQueue.main.async {
                self.dropDownFilter.showList()
            }
            return false
        }else if textField == dropDownSelectPropertyGraphType{
            self.view.endEditing(true)
            DispatchQueue.main.async {
                self.dropDownSelectPropertyGraphType.showList()
            }
            return false
        }
        return true
    }
    //MARK: - Actions
    
    @IBAction func onClickToDate(_ sender: Any) {
        txtToDateValue.becomeFirstResponder()
    }
    
    @IBAction func onClickFromDate(_ sender: Any) {
        txtFromDateValue.becomeFirstResponder()
    }
    
    @IBAction func onClickTotal1(_ sender: Any) {
        switch selectedPropertyGraphType {
        case .None:
            break
        case .Inquiry:
            break
        case .Occupancy:
            break
        case .Average:
            self.lblStatisticsTitle.text = "Average Daily Rate statistics"
            self.lblStatisticsDesc.text = "Total Revenue From Bookings"
            self.viewStatisticsDot.backgroundColor = Theme.propertyDashRedColor
            revenueFromBookingsIsSelected = true
            updateGraphData()
            break
        case .RevPAR:
            self.lblStatisticsTitle.text = "Revenue Per Available Room statistics"
            self.lblStatisticsDesc.text = "Average Daily Rate"
            self.viewStatisticsDot.backgroundColor = Theme.propertyDashRedColor
            revenueFromBookingsIsSelected = false
            updateGraphData()
            break
        }
    }
    
    
    @IBAction func onClickTotal2(_ sender: Any) {
        switch selectedPropertyGraphType {
        case .None:
            break
        case .Inquiry:
            break
        case .Occupancy:
            break
        case .Average:
            self.lblStatisticsTitle.text = "Average Daily Rate statistics"
            self.lblStatisticsDesc.text = "Total Number of Bookings"
            self.viewStatisticsDot.backgroundColor = Theme.propertyDashGreenColor
            averageDailyRateSelected = true
            updateGraphData()
            break
        case .RevPAR:
            self.lblStatisticsTitle.text = "Revenue Per Available Room statistics"
            self.lblStatisticsDesc.text = "Occupancy Rate"
            self.viewStatisticsDot.backgroundColor = Theme.propertyDashGreenColor
            averageDailyRateSelected = false
            updateGraphData()
            break
        }
    }
    
    
    @IBAction func onClickConversionRate(_ sender: Any) {
    }
    
    @IBAction func onClickBack(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    //MARK: - API CALL
    func propertyDashboardDataAPICall(){
        let getPropertyManagersDataQuery =  PTProAPI.GetPropertyManagersDataQuery(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""), filter: .some(selectedPropertyGraphFilterType.rawValue), graphType: .some(selectedPropertyGraphType.rawValue), startDate: .some(selectedStartDate), endDate: .some(selectedEndDate))
        
        Network.shared.apollo_headerClient.fetch(query: getPropertyManagersDataQuery, cachePolicy: .fetchIgnoringCacheData) { response in
            switch response{
            case .success(let result):
                if let data = result.data?.getPropertyManagersData{
                    self.propertyDashboardData = data
                    if let graphData1 = data.graphData?.data1 {
                        self.graphData1 = graphData1
                    }else{
                        self.graphData1.removeAll()
                    }
                    
                    if let graphData2 = data.graphData?.data2 {
                        self.graphData2 = graphData2
                    }else{
                        self.graphData2.removeAll()
                    }
                    DispatchQueue.main.async {
                        self.updateAffiliateData()
                        self.updateGraphData()
                    }
                } else {
                    self.view.makeToast(result.data?.getPropertyManagersData?.errorMessage)
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
                break
            }
        }
    }
}

//MARK: - ChartViewDelegate

extension PropertyInsightsVC: ChartViewDelegate{
    
    func setupChartView() {
        chartView.chartDescription.enabled = false
        chartView.backgroundColor = .white
        chartView.cornerRadius = 15
        
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = false
        chartView.rightAxis.enabled = false
        chartView.delegate = self
        chartView.dragXEnabled = true
        chartView.fitBars = false
        
        chartView.drawBarShadowEnabled = false
        chartView.drawValueAboveBarEnabled = true
        chartView.maxVisibleCount = 60
        chartView.drawGridBackgroundEnabled = false
        
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 10)
        xAxis.drawGridLinesEnabled = false
        xAxis.labelRotationAngle = 45
        xAxis.granularity = 1
        xAxis.labelCount = 12
        
        let leftAxisFormatter = NumberFormatter()
        leftAxisFormatter.minimumFractionDigits = 0
        leftAxisFormatter.maximumFractionDigits = 1
        leftAxisFormatter.negativePrefix = "\(Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency() ?? "") ?? "") "
        leftAxisFormatter.positivePrefix = "\(Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency() ?? "") ?? "") "
        
        let leftAxis = chartView.leftAxis
        leftAxis.labelFont = .systemFont(ofSize: 10)
        leftAxis.labelCount = 8
        leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: leftAxisFormatter)
        leftAxis.labelPosition = .outsideChart
        leftAxis.spaceTop = 0.15
        leftAxis.axisMinimum = 0 // FIXME: HUH?? this replaces startAtZero = YES
        leftAxis.drawGridLinesEnabled = false
        
        let l = chartView.legend
        l.horizontalAlignment = .left
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false
        l.form = .square
        l.formSize = 9
        l.font = UIFont(name: "HelveticaNeue-Light", size: 11)!
        l.xEntrySpace = 4
    }
    
    func updateAffiliateData(){
        if let data = propertyDashboardData{
            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency() ?? "") ?? ""
            self.lblTotalInquiryToBookingConversionsValue.text = "\(data.inquiry_to_Booking_Conversion_Rate ?? 0)"
            self.lblTotalOccupancyRateValue.text = "\(data.occupancy_Rate ?? 0)"
            self.lblTotalAverageDailyRateValue.text = "\(data.average_Daily_Rate ?? 0)"
            self.lblTotalRevenuePerRoomValue.text = "\(data.revPAR ?? 0)"
            self.lblFilterTotal1Value.text = "\(data.total1 ?? 0)"
            self.lblFilterTotal2Value.text = "\(data.total2 ?? 0)"
            self.lblFilterConversionRateValue.text = "\(data.rate ?? 0)"
            self.lblFilterConversionRateTitle.text = "Convestion Rate"
            switch selectedPropertyGraphType {
            case .None:
                self.lblFilterTotal1Title.text = "Inquiries"
                self.lblFilterTotal2Title.text = "Actual Bookings"
                break
            case .Inquiry:
                self.lblFilterTotal1Title.text = "Received Inquiries"
                self.lblFilterTotal2Title.text = "Actual Bookings"
                break
            case .Occupancy:
                self.lblFilterTotal1Title.text = "Booked Nights"
                self.lblFilterTotal2Title.text = "Available Nights"
                break
            case .Average:
                self.lblFilterTotal1Title.text = "Revenue From Bookings"
                self.lblFilterTotal2Title.text = "Number of Bookings"
                break
            case .RevPAR:
                self.lblFilterTotal1Title.text = "Average Daily Rate"
                self.lblFilterTotal2Title.text = "Occupancy Rate"
                break
            }
        }
    }
    
    func updateGraphData(){
        if graphData1.count != 0 || graphData2.count != 0{
            chartView.isHidden = false
            imgNoResult.isHidden = true
            lblNoResult.isHidden = true
            
            let xAxis = chartView.xAxis
            xAxis.valueFormatter = PropertyGraphXAxisValueFormatter(arrData: self.graphData1, filterType: selectedPropertyGraphFilterType)
            xAxis.labelCount = graphData1.count
            chartView.leftAxis.enabled = true

            switch selectedPropertyGraphType {
            case .None:
                chartView.isHidden = true
                imgNoResult.isHidden = false
                lblNoResult.isHidden = false
                break
            case .Inquiry:

                var arrChartEntry1 = [ChartDataEntry]()
                var i = 0
                for data in graphData1{
                    print("graphdata1 x:\(i) \(data?.value ?? 0)")
                    arrChartEntry1.append(ChartDataEntry(x: Double(i), y: data?.value ?? 0))
                    i = i + 1
                }
                
                var arrChartEntry2 = [ChartDataEntry]()
                i = 0
                for data in graphData2{
                    print("graphdata2 x:\(i) \(data?.value ?? 0)")
                    arrChartEntry2.append(ChartDataEntry(x: Double(i), y: data?.value ?? 0))
                    i = i + 1
                }
                
                let set1 = LineChartDataSet(entries: arrChartEntry1, label: "Inquiry")
                set1.axisDependency = .left
                set1.setColor(Theme.propertyDashRedColor)
               // set1.setCircleColor(.white)
                set1.lineWidth = 2
               // set1.circleRadius = 3
                //set1.fillAlpha = 65/255
                //set1.fillColor = UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)
                //set1.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
                //set1.drawCircleHoleEnabled = false
                
                let set2 = LineChartDataSet(entries: arrChartEntry2, label: "Bookings")
                set2.axisDependency = .left
                set1.setColor(Theme.propertyDashBlueColor)
                //set2.setCircleColor(.white)
                set2.lineWidth = 2
              //  set2.circleRadius = 3
               // set2.fillAlpha = 65/255
              //  set2.fillColor = .red
//                set2.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
//                set2.drawCircleHoleEnabled = false
                
                let data: LineChartData = [set1, set2]
                data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 10)!)
                
                chartView.data = data
                break
            case .Occupancy:
                var arrChartEntry1 = [BarChartDataEntry]()
                var i = 0
                for data in graphData1{
                    print("graphdata x:\(i) \(data?.value ?? 0)")
                    arrChartEntry1.append(BarChartDataEntry(x: Double(i), y: data?.value ?? 0))
                    i = i + 1
                }
                
                let set1 = BarChartDataSet(entries: arrChartEntry1, label: "Booked Nights")
                set1.drawValuesEnabled = true
                set1.colors = [Theme.propertyDashRedColor]
                
                var arrChartEntry2 = [BarChartDataEntry]()
                i = 0
                for data in graphData2{
                    print("graphdata x:\(i) \(data?.value ?? 0)")
                    arrChartEntry2.append(BarChartDataEntry(x: Double(i), y: data?.value ?? 0))
                    i = i + 1
                }
                let set2 = BarChartDataSet(entries: arrChartEntry2, label: "Available Nights")
                set2.drawValuesEnabled = true
                set1.colors = [Theme.propertyDashBlueColor]
                
                let data: BarChartData = [set1, set2]
                data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 10)!)
                data.barWidth = 0.9
                chartView.data = data
                break
            case .Average:
                if revenueFromBookingsIsSelected{
                    var arrChartEntry = [BarChartDataEntry]()
                    var i = 0
                    for data in graphData1{
                        print("graphdata x:\(i) \(data?.value ?? 0)")
                        arrChartEntry.append(BarChartDataEntry(x: Double(i), y: data?.value ?? 0))
                        i = i + 1
                    }
                    
                    var set1: BarChartDataSet! = nil
                    if let set = chartView.data?.first as? BarChartDataSet {
                        set1 = set
                        set1.label = "Revenue From  Bookings"
                        set1.colors = [Theme.propertyDashRedColor]
                        set1.replaceEntries(arrChartEntry)
                        chartView.data?.notifyDataChanged()
                        chartView.notifyDataSetChanged()
                    } else {
                        set1 = BarChartDataSet(entries: arrChartEntry, label: "Revenue From  Bookings")
                        set1.drawValuesEnabled = true
                        set1.colors = [Theme.propertyDashRedColor]
                        
                        let data = BarChartData(dataSet: set1)
                        data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 10)!)
                        data.barWidth = 0.9
                        chartView.data = data
                    }
                }else{
                    var arrChartEntry = [BarChartDataEntry]()
                    var i = 0
                    for data in graphData2{
                        print("graphdata x:\(i) \(data?.value ?? 0)")
                        arrChartEntry.append(BarChartDataEntry(x: Double(i), y: data?.value ?? 0))
                        i = i + 1
                    }
                    
                    var set1: BarChartDataSet! = nil
                    if let set = chartView.data?.first as? BarChartDataSet {
                        set1 = set
                        set1.colors = [Theme.propertyDashGreenColor]
                        set1.label = "Number of Bookings"
                        set1.replaceEntries(arrChartEntry)
                        chartView.data?.notifyDataChanged()
                        chartView.notifyDataSetChanged()
                    } else {
                        set1 = BarChartDataSet(entries: arrChartEntry, label: "Number of Bookings")
                        set1.drawValuesEnabled = true
                        set1.colors = [Theme.propertyDashGreenColor]
                        let data = BarChartData(dataSet: set1)
                        data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 10)!)
                        data.barWidth = 0.9
                        chartView.data = data
                    }
                }
                break
            case .RevPAR:
                if averageDailyRateSelected{
                    var arrChartEntry = [BarChartDataEntry]()
                    var i = 0
                    for data in graphData1{
                        print("graphdata x:\(i) \(data?.value ?? 0)")
                        arrChartEntry.append(BarChartDataEntry(x: Double(i), y: data?.value ?? 0))
                        i = i + 1
                    }
                    
                    var set1: BarChartDataSet! = nil
                    if let set = chartView.data?.first as? BarChartDataSet {
                        set1 = set
                        set1.label = "Average Daily Rate"
                        set1.colors = [Theme.propertyDashRedColor]
                        set1.replaceEntries(arrChartEntry)
                        chartView.data?.notifyDataChanged()
                        chartView.notifyDataSetChanged()
                    } else {
                        set1 = BarChartDataSet(entries: arrChartEntry, label: "Average Daily Rate")
                        set1.drawValuesEnabled = true
                        set1.colors = [Theme.propertyDashRedColor]
                        
                        let data = BarChartData(dataSet: set1)
                        data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 10)!)
                        data.barWidth = 0.9
                        chartView.data = data
                    }
                }else{
                    var arrChartEntry = [BarChartDataEntry]()
                    var i = 0
                    for data in graphData2{
                        print("graphdata x:\(i) \(data?.value ?? 0)")
                        arrChartEntry.append(BarChartDataEntry(x: Double(i), y: data?.value ?? 0))
                        i = i + 1
                    }
                    
                    var set1: BarChartDataSet! = nil
                    if let set = chartView.data?.first as? BarChartDataSet {
                        set1 = set
                        set1.colors = [Theme.propertyDashGreenColor]
                        set1.label = "Occupancy Rate"
                        set1.replaceEntries(arrChartEntry)
                        chartView.data?.notifyDataChanged()
                        chartView.notifyDataSetChanged()
                    } else {
                        set1 = BarChartDataSet(entries: arrChartEntry, label: "Occupancy Rate")
                        set1.drawValuesEnabled = true
                        set1.colors = [Theme.propertyDashGreenColor]
                        let data = BarChartData(dataSet: set1)
                        data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 10)!)
                        data.barWidth = 0.9
                        chartView.data = data
                    }
                }
                break
            }
            chartView.setNeedsDisplay()
        }else{
            chartView.isHidden = true
            imgNoResult.isHidden = false
            lblNoResult.isHidden = false
        }
    }
}

enum PropertyGraphType:String{
    case None = ""
    case Inquiry = "Inquiry"
    case Occupancy = "Occupancy"
    case Average = "Average"
    case RevPAR = "RevPAR"
}
