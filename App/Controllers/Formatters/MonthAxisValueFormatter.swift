//
//  MonthAxisValueFormatter.swift
//  App
//
//  Created by Phycom Mac Pro on 26/10/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit
import DGCharts

class MonthAxisValueFormatter: NSObject, AxisValueFormatter{

    var graphData = [PTProAPI.GetDashboardDataQuery.Data.GetDashboardData.GraphDatum?]()

    init(arrData: [PTProAPI.GetDashboardDataQuery.Data.GetDashboardData.GraphDatum?]) {
        self.graphData = arrData
    }
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        if self.graphData.count > Int(value), let data = self.graphData[Int(value)]?.graphDate{
            return data
        }else{
            return ""
        }
    }
}

