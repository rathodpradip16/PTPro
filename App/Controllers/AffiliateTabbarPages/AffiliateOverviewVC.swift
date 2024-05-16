//
//  AffiliateOverviewVC.swift
//  App
//
//  Created by Phycom Mac Pro on 02/10/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit
import DGCharts

class AffiliateOverviewVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var viewTotalConversions: UIView!
    @IBOutlet weak var viewTotalEarning: UIView!
    @IBOutlet weak var viewTotalClicks: UIView!

    @IBOutlet weak var lblTotalConversionsValue: UILabel!
    @IBOutlet weak var lblTotalConversionsTitle: UILabel!
    @IBOutlet weak var lblTotalEarningValue:UILabel!
    @IBOutlet weak var lblTotalEarningTitle:UILabel!
    @IBOutlet weak var lblTotalClicksValue:UILabel!
    @IBOutlet weak var lblTotalClicksTitle:UILabel!
    @IBOutlet weak var lblFilterConversionsValue: UILabel!
    @IBOutlet weak var lblFilterConversionsTitle: UILabel!
    @IBOutlet weak var lblFilterEarningValue:UILabel!
    @IBOutlet weak var lblFilterEarningTitle:UILabel!
    @IBOutlet weak var lblFilterClicksValue:UILabel!
    @IBOutlet weak var lblFilterClicksTitle:UILabel!
    
    @IBOutlet weak var lblStatisticsTitle: UILabel!
    @IBOutlet weak var lblStatisticsDesc: UILabel!
    @IBOutlet weak var viewStatisticsDot: UIView!
    
    @IBOutlet weak var lblFromDateTitle: UILabel!
    @IBOutlet weak var lblToDateTitle: UILabel!
    @IBOutlet weak var txtFromDateValue: UITextField!
    @IBOutlet weak var txtToDateValue: UITextField!
    @IBOutlet weak var btnFromDateValue: UIButton!
    @IBOutlet weak var btnToDateValue: UIButton!

    @IBOutlet weak var btnFilterCoversions: UIButton!
    @IBOutlet weak var btnFilterEarning: UIButton!
    @IBOutlet weak var btnFilterClicks: UIButton!

    @IBOutlet weak var dropDownFilter: DropDown!
    
    @IBOutlet weak var lblNoResult: UILabel!
    @IBOutlet weak var imgNoResult: UIImageView!

    var affiliateDashboardData: PTProAPI.GetDashboardDataQuery.Data.GetDashboardData?

    var graphData = [PTProAPI.GetDashboardDataQuery.Data.GetDashboardData.GraphDatum?]()

    var datePickerStartDate : UIDatePicker?
    var datePickerEndDate: UIDatePicker?
    var selectedStartDate = ""
    var selectedEndDate = ""

    
    var selectedGraphType:GraphType = .Conversions
    var selectedGraphfilterType:GraphFilterType = .PleaseSelect

    //charts
    @IBOutlet var chartView: BarChartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        selectFilter()
        intialSetup()
        setupChartView()
    //    chartView.isHidden = true
        self.initialiseDatePicker()
        self.affiliateDashboardDataAPICall()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Custom Methods
    func intialSetup(){
        let glConversion = CAGradientLayer()
        let colorRight = UIColor(red: 244.0 / 255.0, green: 151.0 / 255.0, blue: 13.0 / 255.0, alpha: 1.0).cgColor
        let colorCenter = UIColor(red: 237.0 / 255.0, green: 179.0 / 255.0, blue: 93.0 / 255.0, alpha: 1.0).cgColor
        let colorEnd = UIColor(red: 239.0 / 255.0, green: 212.0 / 255.0, blue: 172.0 / 255.0, alpha: 1.0).cgColor
        glConversion.frame = viewTotalConversions.bounds
        glConversion.colors = [colorRight,colorCenter,colorEnd]
        glConversion.startPoint = CGPointMake(0.0, 0.5);
        glConversion.endPoint = CGPointMake(1.0, 0.5);
        glConversion.cornerRadius = 15.0
        glConversion.masksToBounds = true
        viewTotalConversions.clipsToBounds = true
        viewTotalConversions.layer.insertSublayer(glConversion, at: 0)
        
        let glEarning = CAGradientLayer()
        let colorEarningRight = UIColor(red: 88.0 / 255.0, green: 182.0 / 255.0, blue: 5.0 / 255.0, alpha: 1.0).cgColor
        let colorEarningCenter = UIColor(red: 102.0 / 255.0, green: 189.0 / 255.0, blue: 96.0 / 255.0, alpha: 1.0).cgColor
        let colorEarningEnd = UIColor(red: 181.0 / 255.0, green: 243.0 / 255.0, blue: 176.0 / 255.0, alpha: 1.0).cgColor
        glEarning.frame = viewTotalEarning.bounds
        glEarning.colors = [colorEarningRight,colorEarningCenter,colorEarningEnd]
        glEarning.startPoint = CGPointMake(0.0, 0.5);
        glEarning.endPoint = CGPointMake(1.0, 0.5);
        glEarning.cornerRadius = 15.0
        glEarning.masksToBounds = true
        viewTotalEarning.clipsToBounds = true
        viewTotalEarning.layer.insertSublayer(glEarning, at: 0)
        
        let glClicks = CAGradientLayer()
        let colorClicksRight = UIColor(red: 20.0 / 255.0, green: 137.0 / 255.0, blue: 228.0 / 255.0, alpha: 1.0).cgColor
        let colorClicksCenter = UIColor(red: 111.0 / 255.0, green: 185.0 / 255.0, blue: 240.0 / 255.0, alpha: 1.0).cgColor
        let colorClicksEnd = UIColor(red: 165.0 / 255.0, green: 206.0 / 255.0, blue: 237.0 / 255.0, alpha: 1.0).cgColor
        glClicks.frame = viewTotalClicks.bounds
        glClicks.colors = [colorClicksRight,colorClicksCenter,colorClicksEnd]
        glClicks.startPoint = CGPointMake(0.0, 0.5);
        glClicks.endPoint = CGPointMake(1.0, 0.5);
        glClicks.cornerRadius = 15.0
        glClicks.masksToBounds = true
        viewTotalClicks.clipsToBounds = true
        viewTotalClicks.layer.insertSublayer(glClicks, at: 0)
        
        btnFromDateValue.setTitle("", for: .normal)
        btnToDateValue.setTitle("", for: .normal)
        btnFilterCoversions.setTitle("", for: .normal)
        btnFilterEarning.setTitle("", for: .normal)
        btnFilterClicks.setTitle("", for: .normal)
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

        selectedGraphType = .Conversions
        selectedGraphfilterType = .PleaseSelect
        dropDownFilter.text = (selectedGraphfilterType == .PleaseSelect) ? "Please Select" :  selectedGraphfilterType.rawValue
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
        selectedGraphfilterType = .PleaseSelect
        self.affiliateDashboardDataAPICall()
   }

    @objc func doneEndDatePicker(){
     let formatter = DateFormatter()
     formatter.dateFormat = "MMM dd,yyyy"
     txtToDateValue.text = formatter.string(from: datePickerEndDate!.date)
        formatter.dateFormat = "yyyy-MM-dd"
        selectedEndDate = formatter.string(from: datePickerEndDate!.date)
        self.updateDateMaxMin()
        self.view.endEditing(true)
        selectedGraphfilterType = .PleaseSelect
        self.affiliateDashboardDataAPICall()
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
        dropDownFilter.delegate = self
        dropDownFilter.didSelect{(selectedText , index ,id) in
            switch index{
            case 0:
                self.selectedGraphfilterType = .PleaseSelect
              //  self.dropDownFilter.text = "Please Select"
                break
            case 1:
                self.selectedGraphfilterType = .last7Days
               // self.dropDownFilter.text = "Last 7 Days"
                break
            case 2:
                self.selectedGraphfilterType = .week
               // self.dropDownFilter.text = "Week"
                break
            case 3:
                self.selectedGraphfilterType = .months
              //  self.dropDownFilter.text = "Months"
                break
            default:
                self.selectedGraphfilterType = .PleaseSelect
              //  self.dropDownFilter.text = "Please Select"
                break
            }
            self.affiliateDashboardDataAPICall()
        }
        dropDownFilter.delegate = self
    }
    
    func updateAffiliateData(){
        if let data = affiliateDashboardData{
            let currencysymbol = Utility.shared.getSymbol(forCurrencyCode: Utility.shared.getPreferredCurrency() ?? "") ?? ""
            self.lblTotalConversionsValue.text = "\(data.conversionOverviewCount ?? 0)"
            self.lblTotalEarningValue.text = "\(currencysymbol)\(data.earningOverviewCount ?? 0)"
            self.lblTotalClicksValue.text = "\(data.clickOverviewCount ?? 0)"
            self.lblFilterConversionsValue.text = "\(data.conversionFilterCount ?? 0)"
            self.lblFilterEarningValue.text = "\(currencysymbol)\(data.earningFilterCount ?? 0)"
            self.lblFilterClicksValue.text = "\(data.clickFilterCount ?? 0)"
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == dropDownFilter{
            self.view.endEditing(true)
            DispatchQueue.main.async {
                self.dropDownFilter.showList()
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
    
    @IBAction func onClickGraphTypeConversions(_ sender: Any) {
        selectedGraphType = .Conversions
        self.lblStatisticsTitle.text = "Conversions Statistics"
        self.lblStatisticsDesc.text = "Conversions"
        viewStatisticsDot.backgroundColor  = Theme.affiliateClicksColor
        self.affiliateDashboardDataAPICall()
    }
    
    
    @IBAction func onClickGraphTypeEarnings(_ sender: Any) {
        selectedGraphType = .Earning
        self.lblStatisticsTitle.text = "Earnings Statistics"
        self.lblStatisticsDesc.text = "Earnings"
        viewStatisticsDot.backgroundColor  = Theme.affiliateEarningColor
        self.affiliateDashboardDataAPICall()
    }
    
    
    @IBAction func OnClickGraphTypeClicks(_ sender: Any) {
        selectedGraphType = .Clicks
        self.lblStatisticsTitle.text = "Clicks Statistics"
        self.lblStatisticsDesc.text = "Clicks"
        viewStatisticsDot.backgroundColor  = Theme.affiliateClicksColor
        self.affiliateDashboardDataAPICall()
    }
    
    @IBAction func onClickBack(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    //MARK: - API CALL
    func   affiliateDashboardDataAPICall(){
        let getDashboardDataQuery = PTProAPI.GetDashboardDataQuery(userId: .some(Utility.shared.ProfileAPIArray?.userId ?? ""), fromDate: .some(selectedStartDate), toDate: .some(selectedEndDate), filter: .some(selectedGraphfilterType.rawValue), graphType: .some(selectedGraphType.rawValue))
        print("======== \(getDashboardDataQuery.__variables?._jsonEncodableValue ?? "")")
        Network.shared.apollo_headerClient.fetch(query: getDashboardDataQuery, cachePolicy: .fetchIgnoringCacheData) { response in
            switch response{
            case .success(let result):
                if let data = result.data?.getDashboardData{
                    self.affiliateDashboardData = data
                    self.graphData = data.graphData ?? []
                    print(self.graphData.count)
                    DispatchQueue.main.async {
                        self.updateAffiliateData()
                        self.updateGraphData()
                    }
                } else {
                    self.view.makeToast(result.data?.getDashboardData?.errorMessage)
                }
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
                break
            }
        }
    }
}

//MARK: - ChartViewDelegate

extension AffiliateOverviewVC: ChartViewDelegate{
    
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
    
    func updateGraphData(){
        if graphData.count != 0{
            chartView.isHidden = false
            imgNoResult.isHidden = true
            lblNoResult.isHidden = true

            let xAxis = chartView.xAxis
            xAxis.valueFormatter = CustomXAxisValueFormatter(arrData: self.graphData, filterType: selectedGraphfilterType)
            xAxis.labelCount = graphData.count
            print("selectedGraphfilterType x:\(selectedGraphfilterType)")

            var arrChartEntry = [BarChartDataEntry]()
            var i = 0
            for data in graphData{
                print("graphdata x:\(i) \(data?.value ?? 0)")
                arrChartEntry.append(BarChartDataEntry(x: Double(i), y: data?.value ?? 0))
                i = i + 1
            }

            var set1: BarChartDataSet! = nil
            if let set = chartView.data?.first as? BarChartDataSet {
                set1 = set
                set1.label = selectedGraphType.rawValue
                switch selectedGraphType {
                case .Conversions:
                    set1.colors = [Theme.affiliateConversionIconColor]
                    chartView.leftAxis.enabled = false
                    break
                case .Earning:
                    set1.colors = [Theme.affiliateEarningColor]
                    chartView.leftAxis.enabled = true
                    break
                case .Clicks:
                    set1.colors = [Theme.affiliateClicksColor]
                    chartView.leftAxis.enabled = false
                    break
                }
                set1.replaceEntries(arrChartEntry)
                chartView.data?.notifyDataChanged()
                chartView.notifyDataSetChanged()
            } else {
                set1 = BarChartDataSet(entries: arrChartEntry, label: selectedGraphType.rawValue)
                set1.drawValuesEnabled = true
                switch selectedGraphType {
                case .Conversions:
                    set1.colors = [Theme.affiliateConversionIconColor]
                    chartView.leftAxis.enabled = false
                    break
                case .Earning:
                    set1.colors = [Theme.affiliateEarningColor]
                    chartView.leftAxis.enabled = true
                    break
                case .Clicks:
                    set1.colors = [Theme.affiliateClicksColor]
                    chartView.leftAxis.enabled = false
                    break
                }
                let data = BarChartData(dataSet: set1)
                data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 10)!)
                data.barWidth = 0.4
                chartView.data = data
            }
            
            chartView.setVisibleXRangeMaximum(5)
            chartView.setNeedsDisplay()
        }else{
            chartView.isHidden = true
            imgNoResult.isHidden = false
            lblNoResult.isHidden = false
        }
    }
}

enum GraphType:String{
    case Conversions = "Conversions"
    case Earning = "Earnings"
    case Clicks = "Clicks"
}

enum GraphFilterType:String{
    case PleaseSelect = "Date"
    case last7Days = "Day"
    case months = "Month"
    case week = "Week"
}


