//
//  EColumnDataModel.swift
//  EChartDemo-Swift
//
//  Created by Scott Zhu on 7/9/15.
//  Copyright (c) 2015 Scott Zhu. All rights reserved.
//

import Foundation

class EColumnDataModel
{
    var label: String?
    var value = 0.0
    var index: Int = 0
    var unit: String?
    
    init() {
        
    }
    
    init(label:String?, value: Double, index: Int, unit: String?)
    {
        self.label = label
        self.value = value
        self.index = index
        self.unit = unit
    }
}