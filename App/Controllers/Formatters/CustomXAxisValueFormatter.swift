//
//  CustomXAxisValueFormatter.swift
//  App
//
//  Created by Phycom Mac Pro on 27/10/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit
import DGCharts

class CustomXAxisValueFormatter: NSObject,AxisValueFormatter {

    var graphData = [PTProAPI.GetDashboardDataQuery.Data.GetDashboardData.GraphDatum?]()

    var selectedGraphFilter:GraphFilterType = .PleaseSelect

    
    init(arrData: [PTProAPI.GetDashboardDataQuery.Data.GetDashboardData.GraphDatum?],filterType:GraphFilterType) {
        self.graphData = arrData
        self.selectedGraphFilter = filterType
    }
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        if self.graphData.count > Int(value), let data = self.graphData[Int(value)]?.graphDate{
            if self.selectedGraphFilter == .PleaseSelect{
                return self.dayformatDate(strDate: data)
            }else if self.selectedGraphFilter == .last7Days{
                return self.weekDayformatDate(strDate: data)
            }else{
                return data
            }
        }else{
            return ""
        }
    }
    
    func dayformatDate(strDate:String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let dt = formatter.date(from: strDate){
            formatter.dateFormat = "MMM dd"
            return formatter.string(from: dt)
        }else{
            return ""
        }
    }
    
    func weekDayformatDate(strDate:String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let dt = formatter.date(from: strDate){
            formatter.dateFormat = "EEE"
            return formatter.string(from: dt)
        }else{
            return ""
        }
    }
}
