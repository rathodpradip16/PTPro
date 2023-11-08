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
    
    var graphData1 = [PTProAPI.GetPropertyManagersDataQuery.Data.GetPropertyManagersData.GraphData.Data1?]()
    var graphData2 = [PTProAPI.GetPropertyManagersDataQuery.Data.GetPropertyManagersData.GraphData.Data2?]()

    var selectedGraphFilter:GraphFilterType = .PleaseSelect
    var selectedGraphType:PropertyGraphType = .None

    init(arrData1: [PTProAPI.GetPropertyManagersDataQuery.Data.GetPropertyManagersData.GraphData.Data1?],arrData2: [PTProAPI.GetPropertyManagersDataQuery.Data.GetPropertyManagersData.GraphData.Data2?],filterType:GraphFilterType,GraphType:PropertyGraphType) {
        self.graphData1 = arrData1
        self.graphData2 = arrData2
        self.selectedGraphFilter = filterType
        self.selectedGraphType = GraphType
    }
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        
        let count = max(graphData1.count,graphData2.count)
        
        guard let axis = axis, count > 0 else {
            return ""
        }
        
        if selectedGraphType == .Occupancy {
  
            let factor = axis.axisMaximum / Double(count)
            
            let index = Int((value / factor).rounded())
            
            if index >= 0 && index < count {
                if index < self.graphData1.count, let data = self.graphData1[index]?.graphDate{
                    if self.selectedGraphFilter == .PleaseSelect {
                        return self.dayformatDate(strDate: data)
                    }else{
                        return data
                    }
                }else if index < self.graphData2.count,let data = self.graphData2[index]?.graphDate{
                    if self.selectedGraphFilter == .PleaseSelect{
                        return self.dayformatDate(strDate: data)
                    }else{
                        return data
                    }
                }
            }else{
                return ""
            }
            return ""
        }else{
            if value >= 0,value < Double(self.graphData1.count), let data = self.graphData1[Int(value)]?.graphDate{
                if self.selectedGraphFilter == .PleaseSelect {
                    return self.dayformatDate(strDate: data)
                }else{
                    return data
                }
            }else if value >= 0, value < Double(self.graphData2.count),let data = self.graphData2[Int(value)]?.graphDate{
                if self.selectedGraphFilter == .PleaseSelect{
                    return self.dayformatDate(strDate: data)
                }else{
                    return data
                }
            }
        }
        return ""
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
