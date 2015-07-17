//
//  EColumnChart.swift
//  EChartDemo-Swift
//
//  Created by Scott Zhu on 14-10-10.
//  Copyright (c) 2014年 Scott Zhu. All rights reserved.
//

import UIKit

protocol EColumnChartDataSource: class
{
    /** How many Columns are there in total.*/
    func numberOfColumnsIn(eColumnChart: EColumnChart) -> Int?
    
    /** How many Columns should be presented on the screen each time*/
    func numberOfColumnsPresentedEveryTimeIn(eColumnChart: EColumnChart) -> Int?
    
    /** The hightest vaule among the whole chart*/
    func highestValueIn(eColumnChart: EColumnChart) -> EColumnDataModel?
    
    /** Value for each column*/
    func valueFor(eColumnChart: EColumnChart, atIndex index: Int) -> EColumnDataModel?
    
    /** Allow you to customize the color of every coloum as you wish.*/
    func colorFor(eColumn: EColumn) -> UIColor?
    
}

protocol EColumnChartDelegate: class
{
    /** When finger single taped the column*/
    func didSelect(eColumn: EColumn, inEColumnChart: EColumnChart)
    
    /** When finger enter specific column, this is dif from tap*/
    func fingerDidMoveIn(eColumn: EColumn, inEColumnChart: EColumnChart)
    
    /** When finger leaves certain column, will tell you which column you are leaving*/
    func fingerDidMoveOut(eColumn: EColumn, inEColumnChart: EColumnChart)
    
    /** When finger leaves wherever in the chart, will trigger both if finger is leaving from a column */
    func fingerDidMoveOutFrom(eColumnChart: EColumnChart)
}

@availability(iOS, introduced=7.0)
class EColumnChart: UIView
{
    //MARK: - Properties
    var leftMostIndex   :Int? = 0
    var rightMostIndex  :Int? = 0
    
    var minColumnColor      :UIColor = UIColor.redColor()
    var maxColumnColor      :UIColor = UIColor.greenColor()
    var normalColumnColor   :UIColor = UIColor.blueColor()
    
    var showHighAndLowColumnWithColor   :Bool = true
    /** If this switch in on, all horizontal labels will show in Integer. */
    var showHorizontalLabelsWithInteger :Bool = false
    /** IMPORTANT:
    This should be setted before datasoucre has been set.*/
    var columnsIndexStartFromLeft       :Bool = true
    
    weak var dataSource: EColumnChartDataSource?
    weak var delegate: EColumnChartDelegate?
    
//    /** Pull out the columns hidden in the left*/
//    - (void)moveLeft;
//    
//    /** Pull out the columns hidden in the right*/
//    - (void)moveRight;
//    
//    - (void)initData;
//    
//    /** Call to redraw the whole chart*/
//    - (void)reloadData;
//    
//    @property (weak, nonatomic) IBOutlet id <EColumnChartDataSource> dataSource;
//    @property (weak, nonatomic) IBOutlet id <EColumnChartDelegate> delegate;
    
    
    //MARK: - View Life Circle
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        println("EColumnChart init with frame called")
        self.backgroundColor = UIColor.blueColor()
        
    }

    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        println("EColumnChart init with coder called")
    }
    
    override func awakeFromNib()
    {
        println("EColumnChart awakeFromNib called")
    }
    
    override func layoutSubviews() {
        println(" EColumnChart layoutSubviews called; self.bound = \(self.bounds)")
    }
    
    override func drawRect(rect: CGRect) {
        println(" EColumnChart drawRect called with Rect = \(rect)")
    }
    
    //MARK: Setter
    override var frame:CGRect
    {
        didSet
        {
            println("EColumnChart frame didSet = \(frame)")
        }
    }
    
    override var bounds: CGRect {
        didSet{
            println("EColumnChart bounds didSet = \(self.bounds)")
            reloadDataInRect(bounds)
        }
    }
    
    //MARK: - Getter
    var boundsCenter: CGPoint{
        return convertPoint(center, fromView: superview)
    }
    
    //MARK: - Custom Methods
    func reloadData()
    {
        let test: EColumn = EColumn(frame: CGRectMake(boundsCenter.x, boundsCenter.y, 50, 50))
        test.backgroundColor = UIColor.redColor()
        addSubview(test)
    }
    
    func reloadDataInRect(rect: CGRect)
    {
        
    }
    
    func buildBackgroundInRect(rect: CGRect)
    {
        let totalColumnsRequired = self.dataSource?.numberOfColumnsPresentedEveryTimeIn(self);
        let totalColumns = self.dataSource?.numberOfColumnsIn(self)
        
        if (self.columnsIndexStartFromLeft)
        {
            self.leftMostIndex = 0;
            self.rightMostIndex = self.rightMostIndex! + totalColumnsRequired! - 1;
        }
        else
        {
            self.rightMostIndex = 0;
            self.leftMostIndex = self.rightMostIndex! + totalColumnsRequired! - 1;
        }
        
        /** Start construct horizontal lines*/
        /** Start construct value labels for horizontal lines*/
        if self.showHorizontalLabelsWithInteger
        {
            if let highestColumn = self.dataSource?.highestValueIn(self)
            {
                let valueGap = highestColumn.value / 10 + 1;
                let horizontalLabelsCount = Int(highestColumn.value / valueGap) + 1;
                let heightGap = Double(rect.height) / Double(horizontalLabelsCount)
                _fullValueOfTheGraph = valueGap * horizontalLabelsCount;
                for (int i = 0; i <= horizontalLabelsCount; i ++)
                {
                    UIView *horizontalLine = [[UIView alloc] initWithFrame:CGRectMake(0, heightGap * i, self.frame.size.width, HORIZONTAL_LINE_HEIGHT)];
                    horizontalLine.backgroundColor = ELightGrey;
                    [self addSubview:horizontalLine];
                    
                    EColumnChartLabel *eColumnChartLabel = [[EColumnChartLabel alloc] initWithFrame:CGRectMake(-1 * Y_COORDINATE_LABEL_WIDTH, -heightGap / 2.0 + heightGap * i, Y_COORDINATE_LABEL_WIDTH, heightGap)];
                    [eColumnChartLabel setTextAlignment:NSTextAlignmentCenter];
                    eColumnChartLabel.text = [[NSString stringWithFormat:@"%d ", valueGap * (horizontalLabelsCount - i)] stringByAppendingString:[_dataSource highestValueEColumnChart:self].unit];;
                    [self addSubview:eColumnChartLabel];
                }
            }
        }
        else
        {
            /** In order to leave some space for the heightest column */
            _fullValueOfTheGraph = [_dataSource highestValueEColumnChart:self].value * 1.1;
            float heightGap = self.frame.size.height / 10.0;
            float valueGap = _fullValueOfTheGraph / 10.0;
            for (int i = 0; i < 11; i++)
            {
                UIView *horizontalLine = [[UIView alloc] initWithFrame:CGRectMake(0, heightGap * i, self.frame.size.width, HORIZONTAL_LINE_HEIGHT)];
                horizontalLine.backgroundColor = ELightGrey;
                [self addSubview:horizontalLine];
                
                EColumnChartLabel *eColumnChartLabel = [[EColumnChartLabel alloc] initWithFrame:CGRectMake(-1 * Y_COORDINATE_LABEL_WIDTH, -heightGap / 2.0 + heightGap * i, Y_COORDINATE_LABEL_WIDTH, heightGap)];
                [eColumnChartLabel setTextAlignment:NSTextAlignmentCenter];
                eColumnChartLabel.text = [[NSString stringWithFormat:@"%.1f ", valueGap * (10 - i)] stringByAppendingString:[_dataSource highestValueEColumnChart:self].unit];;
                
                //eColumnChartLabel.backgroundColor = ELightBlue;
                [self addSubview:eColumnChartLabel];
            }
        }
    }
    
    func buildColumnsInRect(rect: CGRect)
    {
        
    }

}
