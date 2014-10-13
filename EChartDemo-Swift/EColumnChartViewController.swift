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

    @protocol
    
    var eColumun = EColumnChart(frame: CGRectMake(0, 0, 100, 100))

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        

        self.view.addSubview(eColumun)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
