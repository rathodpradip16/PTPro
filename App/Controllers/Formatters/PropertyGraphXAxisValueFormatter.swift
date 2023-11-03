//
//  PropertyGraphXAxisValueFormatter.swift
//  App
//
//  Created by Phycom Mac Pro on 03/11/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit
import DGCharts

class PropertyGraphXAxisValueFormatter: NSObject ,AxisValueFormatter {
    
    var graphData = [PTProAPI.GetPropertyManagersDataQuery.Data.GetPropertyManagersData.GraphData.Data1?]()

    var selectedGraphFilter:GraphFilterType = .PleaseSelect

    
    init(arrData: [PTProAPI.GetPropertyManagersDataQuery.Data.GetPropertyManagersData.GraphData.Data1?],filterType:GraphFilterType) {
        self.graphData = arrData
        self.selectedGraphFilter = filterType
    }
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        if self.graphData.count > Int(value), let data = self.graphData[Int(value)]?.graphDate{
            if self.selectedGraphFilter == .PleaseSelect || self.selectedGraphFilter == .last7Days{
                return self.dayformatDate(strDate: data)
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
}
