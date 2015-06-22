//
//  EColumnChart.swift
//  EChartDemo-Swift
//
//  Created by Scott Zhu on 14-10-10.
//  Copyright (c) 2014年 Scott Zhu. All rights reserved.
//

import UIKit

class EColumnChart: UIView
{

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blueColor()
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
    }

}
