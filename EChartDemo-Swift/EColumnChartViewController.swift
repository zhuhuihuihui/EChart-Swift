//
//  EColumnChartViewController.swift
//  EChartDemo-Swift
//
//  Created by Scott Zhu on 14-10-10.
//  Copyright (c) 2014年 Scott Zhu. All rights reserved.
//

import UIKit

class EColumnChartViewController: UIViewController
{
    @IBOutlet weak var eColumnChart: EColumnChart!
    
    var data = [EColumnDataModel]()
    var two = [EColumnDataModel](count: 50, repeatedValue: EColumnDataModel())

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.eColumnChart.delegate = self
        self.eColumnChart.dataSource = self
        
        for i in 0...50
        {
            let randomValue = arc4random() % 100
            data.append(EColumnDataModel(label: "\(i)", value: Double(randomValue), index: i, unit: "kWh"))
        }
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK: - EColumnChartDataSource
extension EColumnChartViewController: EColumnChartDataSource
{
    func numberOfColumnsIn(eColumnChart: EColumnChart) -> Int? {
        return data.count
    }
    
    func numberOfColumnsPresentedEveryTimeIn(eColumnChart: EColumnChart) -> Int? {
        return 5
    }
    
    func highestValueIn(eColumnChart: EColumnChart) -> EColumnDataModel? {
        var maxDataModel = EColumnDataModel()
        var maxValue = DBL_MIN
        for dataModel in self.data
        {
            if (dataModel.value > maxValue)
            {
                maxValue = dataModel.value;
                maxDataModel = dataModel;
            }
        }
        return maxDataModel
    }
    
    func valueFor(eColumnChart: EColumnChart, atIndex index: Int) -> EColumnDataModel? {
        if index > data.count || index < 0
        {
            return nil
        }
        return data[index]
    }
    
    func colorFor(eColumn: EColumn) -> UIColor? {
        return UIColor.redColor()
    }
}

//MARK: - EColumnChartDelegate
extension EColumnChartViewController: EColumnChartDelegate
{
    func didSelect(eColumn: EColumn, inEColumnChart: EColumnChart) {
        
    }
    
    func fingerDidMoveIn(eColumn: EColumn, inEColumnChart: EColumnChart) {
        
    }
    
    func fingerDidMoveOut(eColumn: EColumn, inEColumnChart: EColumnChart) {
        
    }
    
    func fingerDidMoveOutFrom(eColumnChart: EColumnChart) {
        
    }
}
