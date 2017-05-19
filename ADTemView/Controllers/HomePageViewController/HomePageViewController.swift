//
//  HomePageViewController.swift
//  ADTemView
//
//  Created by andong on 2017/5/15.
//  Copyright © 2017年 AD.org. All rights reserved.
//

import UIKit
import Charts

class HomePageViewController: ADBaseViewController,ChartViewDelegate{

    @IBOutlet weak var lineChartView: LineChartView!
    
    @IBOutlet weak var editProbeInfoBackgroundView: UIView!
    @IBOutlet weak var editProbeInfoView: UIView!
    var editProbeInfoTableViewContoller : EditProbeInfoTableViewController?

    @IBOutlet weak var bleTableViewBackgroundView: UIView!
    @IBOutlet weak var bleTableView: UIView!
    var bleTableViewController : BLETableViewController?


    func initTestData()  {
       
        var values = Array<ChartDataEntry>.init()
        
        let count = 50
        let range = 300
        
        for i in 0..<count {
            let num = arc4random_uniform(UInt32(range))
            let val = ((Double)(num) * 0.01) + 36
            values.append(ChartDataEntry.init(x:Double(i), y: Double(val)))
        }
    
        var set1 :LineChartDataSet?                     //曲线集合
        
        if ((lineChartView.data?.dataSets) != nil)  {
            //由于这里只有一条线，所以用.first 就可以了
            set1 = lineChartView.data?.dataSets.first as? LineChartDataSet;
            set1?.values = values
            lineChartView.data?.notifyDataChanged()
            lineChartView.notifyDataSetChanged()

        } else {
            
            set1 = LineChartDataSet.init(values: values, label: nil)    //初始化一条温度曲线
            set1?.mode = .linear                                        //曲线的模式 cubicBezier平滑模式
            set1?.setColors(Constant.COLORS.kHomePageTableLineColor)    //线颜色
            set1?.lineWidth = 2.0                                       //线宽
            set1?.drawCirclesEnabled = false                            //取消在值上画圈
            set1?.drawValuesEnabled  = false                            //取消在线上的值显示
            set1?.drawHorizontalHighlightIndicatorEnabled = false       //点上的水平指示器
            set1?.drawVerticalHighlightIndicatorEnabled = false         //点上的竖直指示器
    
            //背景渐变
            let gradientColors = [ChartColorTemplates.colorFromString("#00ff0000").cgColor,
                                  ChartColorTemplates.colorFromString("#ffff0000").cgColor]
        
            let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)
            set1?.fillAlpha = 1.0
            set1?.fill = Fill.fillWithLinearGradient(gradient!, angle: 90)
            set1?.drawFilledEnabled = true;
        
            var dataSets = Array<Any>.init()
            dataSets.append(set1!);
            
            let data = LineChartData.init(dataSets: dataSets as? [IChartDataSet])
            lineChartView.data = data;

        }
        
        
    }
    

    
    // MARK: Chart 样式设计
    
    func initChart() {
        //代理
        lineChartView.delegate = self
        lineChartView.legend.enabled = false            //取消图例
        lineChartView.scaleYEnabled  = false            //取消Y轴缩放
//        lineChartView.scaleXEnabled  = false
        lineChartView.doubleTapToZoomEnabled = false    //取消双击缩放
        lineChartView.chartDescription!.enabled = false //取消描述
        lineChartView.noDataText = "暂无数据"
//        lineChartView.maxVisibleCount = 24              //设置能够显示的数据数量
        lineChartView.rightAxis.enabled = false         //取消右边Y轴
        lineChartView.dragDecelerationEnabled = true    //拖拽后是否有惯性效果
        lineChartView.dragDecelerationFrictionCoef = 0.8//惯性系数，越小惯性越大
        
        
        //左边Y轴
        let leftYAxis = lineChartView.leftAxis
        leftYAxis.labelCount = 11                                                //Y轴上label数量
        leftYAxis.forceLabelsEnabled = true                                      //强制绘制指定数量的label
        leftYAxis.axisMaximum = 43.0                                             //Y轴最大值
        leftYAxis.axisMinimum = 32.0                                             //Y轴最小值
        leftYAxis.axisLineColor = Constant.COLORS.kHomePageTableAxisLineColor    //Y轴颜色
        leftYAxis.axisLineWidth = 1.0                                            //Y轴线宽
        leftYAxis.labelTextColor = Constant.COLORS.kHomePageTableYAxisTextColor  //Y轴文字颜色
        leftYAxis.labelFont = Constant.FONTS.HomePageTableYAxisTextFont          //Y轴文字字体
        leftYAxis.drawGridLinesEnabled = false                                   //Y轴刻度线隐藏
        
        //X轴
        let bottomXAxis = lineChartView.xAxis
        bottomXAxis.labelCount = 5
        bottomXAxis.forceLabelsEnabled = true                                    //强制绘制指定数量的label
        bottomXAxis.labelPosition = .bottom                                        //设置x轴数据在底部
        bottomXAxis.drawGridLinesEnabled = false                                   //X轴刻度线隐藏
        bottomXAxis.labelTextColor = UIColor.white                                 //文字颜色
        bottomXAxis.labelFont = Constant.FONTS.HomePageTableXAxisTextFont
        bottomXAxis.axisLineColor = Constant.COLORS.kHomePageTableAxisLineColor    //Y轴颜色
        bottomXAxis.axisLineWidth = 1.0                                            //Y轴线宽
        bottomXAxis.labelRotationAngle = 50.0                                      //文字旋转角度
        bottomXAxis.granularityEnabled = true                                      //开启刻度尺
        bottomXAxis.granularity = 6.0                                              //刻度单位

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initTestData()
        initChart()

    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showProbeInfoTableViewController(isShow:Bool) {
        if isShow {
            view.addSubview(editProbeInfoBackgroundView)
            editProbeInfoBackgroundView.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
            UIView.transition(with: editProbeInfoBackgroundView, duration: 0.1, options: .curveEaseInOut, animations: {
                self.editProbeInfoBackgroundView.isHidden = false
                self.editProbeInfoBackgroundView.transform = CGAffineTransform.identity
            })
        } else {
            
            UIView.transition(with: editProbeInfoBackgroundView, duration: 0.1, options: .curveLinear, animations: {
                self.editProbeInfoBackgroundView.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
            }, completion: { (finished) in
                self.editProbeInfoBackgroundView.isHidden = true
            })
        }
    }
    
    
    
    @IBAction func probeNameButtonAction(_ sender: UIButton) {
        
        if editProbeInfoTableViewContoller == nil {
            editProbeInfoTableViewContoller = Constant.STORYBOARDS.MAIN_STORYBOARD.instantiateViewController(withIdentifier: Enum.StoryboardIdentifier.ADEditProbeInfoTableViewController.rawValue) as? EditProbeInfoTableViewController
            
            self.addChildViewController(editProbeInfoTableViewContoller!)
            editProbeInfoView.addSubview(editProbeInfoTableViewContoller!.view)
            editProbeInfoTableViewContoller?.view.frame.size = editProbeInfoView.frame.size
            editProbeInfoTableViewContoller!.didMove(toParentViewController: self)
        }
        showProbeInfoTableViewController(isShow: true)
    }
    
    
    func showBLETableViewController(isShow:Bool) {
        if isShow {
            view.addSubview(bleTableViewBackgroundView)
            bleTableViewBackgroundView.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
            UIView.transition(with: bleTableViewBackgroundView, duration: 0.1, options: .curveEaseInOut, animations: {
                self.bleTableViewBackgroundView.isHidden = false
                self.bleTableViewBackgroundView.transform = CGAffineTransform.identity
            })
        } else {
            
            UIView.transition(with: bleTableViewBackgroundView, duration: 0.1, options: .curveLinear, animations: {
                self.bleTableViewBackgroundView.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
            }, completion: { (finished) in
                self.bleTableViewBackgroundView.isHidden = true
            })
        }
    }
    
    @IBAction func BLEButtonAction(_ sender: UIButton) {
        
        if bleTableViewController == nil {
            bleTableViewController = Constant.STORYBOARDS.MAIN_STORYBOARD.instantiateViewController(withIdentifier: Enum.StoryboardIdentifier.ADBLETableViewController.rawValue) as? BLETableViewController
            
            self.addChildViewController(bleTableViewController!)
            bleTableView.addSubview(bleTableViewController!.view)
            bleTableViewController?.view.frame.size = bleTableView.frame.size
            bleTableViewController!.didMove(toParentViewController: self)
        }
        showBLETableViewController(isShow: true)
    }
    
    @IBAction func BLEDismissButtonAction(_ sender: UIButton) {
        showBLETableViewController(isShow: false)
        if bleTableViewController?.messageBackgroundView.isHidden == false {
            bleTableViewController?.messageViewDismiss(true)
        }
    }

    @IBAction func tableButtonAction() {
        AppDelegate.deviceRotationTo(deviceOrientation: .landscapeRight)
    }



}
