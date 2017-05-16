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
            values.append(ChartDataEntry.init(x:Double(i), y: Double(val), icon: UIImage.init(named: "icon")))
        }
    
        var set1 :LineChartDataSet?
        
//        if (lineChartView.data?.dataSetCount)! > 0)
//        {
//            set1 = lineChartView.data?.dataSets.first as? LineChartDataSet;
//            set1?.values = values
//            lineChartView.data?.notifyDataChanged()
//            lineChartView.notifyDataSetChanged()
//
//        } else {
            set1 = LineChartDataSet.init(values: values, label: nil)
            set1?.drawIconsEnabled = false
            set1?.mode = .cubicBezier
            set1?.highlightLineDashLengths = [5.0, 2.5]
            set1?.setColors(UIColor.init(colorLiteralRed: 134.0/255.0, green: 0.0, blue: 72.0/255.0, alpha: 1.0))
            set1?.drawFilledEnabled = false
            set1?.setCircleColor(UIColor.black)
            set1?.lineWidth = 2.0
            set1?.circleRadius = 0.0
            set1?.drawCircleHoleEnabled = true
            set1?.valueFont = UIFont.systemFont(ofSize: 9.0)
            set1?.formLineDashLengths = [5.0, 5.0]
            set1?.formLineWidth = 1.0
            set1?.formSize = 15.0
        
            //背景渐变
            let gradientColors = [ChartColorTemplates.colorFromString("#00ff0000").cgColor,
                                  ChartColorTemplates.colorFromString("#ffff0000").cgColor]
        
            let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)
            
            set1?.fillAlpha = 1.0
            set1?.fill = Fill.fillWithLinearGradient(gradient!, angle: 90)
            set1?.drawFilledEnabled = true;
        
            var dataSets = Array<Any>.init()
            dataSets.append(set1!);
            
            let data = LineChartData.init(dataSets: dataSets as! [IChartDataSet])
            lineChartView.data = data;

//        }
        
        
    }
    

    
    
    
    func initChart() {
        //代理
        lineChartView.delegate = self
        
        lineChartView.legend.enabled = false //取消图例
        lineChartView.scaleYEnabled  = false //取消Y轴缩放
        lineChartView.doubleTapToZoomEnabled = false//取消双击缩放
        lineChartView.chartDescription!.enabled = false //取消描述
        lineChartView.noDataText = "暂无数据"
        lineChartView.maxVisibleCount = 24//设置能够显示的数据数量
        lineChartView.rightAxis.enabled = false//取消右边Y轴
        
        //左边Y轴
        let leftAxis = lineChartView.leftAxis
        leftAxis.removeAllLimitLines()
        leftAxis.axisMaximum = 43.0
        leftAxis.axisMinimum = 32.0
        leftAxis.gridLineDashLengths = [5.0, 5.0]
        leftAxis.drawZeroLineEnabled = false
        leftAxis.drawLimitLinesBehindDataEnabled = true
        leftAxis.drawGridLinesEnabled = false
        leftAxis.labelTextColor = UIColor.init(colorLiteralRed: 219.0/255.0, green: 33.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        leftAxis.labelFont = UIFont.init(name: "HelveticaNeue", size: 11.0)!
        leftAxis.labelCount = 8
        

        
        //X轴
        let xAxis = lineChartView.xAxis
        xAxis.granularityEnabled = true//设置重复的值不显示
        xAxis.labelPosition = .bottom//设置x轴数据在底部
        xAxis.gridColor = UIColor.clear
        xAxis.labelTextColor = UIColor.white//文字颜色
        xAxis.axisLineColor = UIColor.black
        xAxis.labelCount = 4
        xAxis.labelRotationAngle = 50.0

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTestData()
        initChart()
        
        // Do any additional setup after loading the view.
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
            editProbeInfoTableViewContoller = Enum.STORYBOARDS.MAIN_STORYBOARD.instantiateViewController(withIdentifier: Enum.StoryboardIdentifier.ADEditProbeInfoTableViewController.rawValue) as? EditProbeInfoTableViewController
            
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
            bleTableViewController = Enum.STORYBOARDS.MAIN_STORYBOARD.instantiateViewController(withIdentifier: Enum.StoryboardIdentifier.ADBLETableViewController.rawValue) as? BLETableViewController
            
            self.addChildViewController(bleTableViewController!)
            bleTableView.addSubview(bleTableViewController!.view)
            bleTableViewController?.view.frame.size = bleTableView.frame.size
            bleTableViewController!.didMove(toParentViewController: self)
        }
        showBLETableViewController(isShow: true)
    }
    
    @IBAction func tableButtonAction() {
        AppDelegate.deviceRotationTo(deviceOrientation: .landscapeRight)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
