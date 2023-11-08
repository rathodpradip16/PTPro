//
//  SetValueFormatter.swift
//  App
//
//  Created by Phycom Mac Pro on 05/11/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import UIKit
import DGCharts

class SetValueFormatter: NSObject,ValueFormatter{
  
    var selectedGraphFilter:GraphFilterType = .PleaseSelect
    var selectedGraphType:PropertyGraphType = .None

    init(filterType:GraphFilterType, graphType:PropertyGraphType) {
        self.selectedGraphType = graphType
        self.selectedGraphFilter = filterType
    }

    func stringForValue(_ value: Double, entry: DGCharts.ChartDataEntry, dataSetIndex: Int, viewPortHandler: DGCharts.ViewPortHandler?) -> String {
        if self.selectedGraphType == .Inquiry || self.selectedGraphType == .Occupancy{
            return "\(Int(value))"
        }
        return String(format: "%.02f", value)
    }
}
