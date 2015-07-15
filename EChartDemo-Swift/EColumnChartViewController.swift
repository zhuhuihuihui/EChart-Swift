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
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.eColumnChart.delegate = self
        self.eColumnChart.dataSource = self
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
        return 6
    }
    
    func numberOfColumnsPresentedEveryTimeIn(eColumnChart: EColumnChart) -> Int? {
        return 5
    }
    
    func highestValueIn(eColumnChart: EColumnChart) -> EColumnDataModel? {
        return EColumnDataModel()
    }
    
    func valueFor(eColumnChart: EColumnChart, atIndex: Int) -> EColumnDataModel? {
        return EColumnDataModel()
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
