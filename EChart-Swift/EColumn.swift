//
//  EColumn.swift
//  EChartDemo-Swift
//
//  Created by Scott Zhu on 6/21/15.
//  Copyright (c) 2015 Scott Zhu. All rights reserved.
//

import UIKit

class EColumn: UIView
{
    private var chartLine: CAShapeLayer = CAShapeLayer()
    
    
    //MARK: View Life Circle
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        println("EColumn init with frame called")
        self.backgroundColor = UIColor.blueColor()
        
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        println("EColumn init with coder called")
    }
    
    override func awakeFromNib()
    {
        println("EColumn awakeFromNib called")
    }
    
    override func layoutSubviews() {
        println("EColumn layoutSubviews called; self.bound = \(self.bounds)")
    }
    
    override func drawRect(rect: CGRect) {
        println("EColumn drawRect called with Rect = \(rect)")
    }

}
