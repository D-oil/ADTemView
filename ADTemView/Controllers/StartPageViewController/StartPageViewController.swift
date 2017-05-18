//
//  StartPageViewController.swift
//  ADTemView
//
//  Created by andong on 2017/5/15.
//  Copyright © 2017年 AD.org. All rights reserved.
//

import UIKit


class StartPageViewController: ADBaseViewController {

    @IBOutlet weak var selectBLETableViewConnectView: UIView!
    @IBOutlet weak var selectBLETableView: UIView!
    var startPageSelectBLETableViewController : StartPageSelectBLETableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        BLEManager.shared()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func StartButtonAction(_ sender: UIButton) {

        if BLEManager.shared().state != .poweredOn {
            MBProgressHUD.showMessageToView(view: (self.navigationController?.view)!, message: "请先打开蓝牙开关", delay: 3)
            return
        }
        
        if startPageSelectBLETableViewController == nil {
            startPageSelectBLETableViewController = Constant.STORYBOARDS.MAIN_STORYBOARD.instantiateViewController(withIdentifier: Enum.StoryboardIdentifier.ADStartPageSelectBLETableViewController.rawValue) as? StartPageSelectBLETableViewController
            
            self.addChildViewController(startPageSelectBLETableViewController!)
            selectBLETableView.addSubview(startPageSelectBLETableViewController!.view)
            startPageSelectBLETableViewController?.view.frame.size = selectBLETableView.frame.size
            startPageSelectBLETableViewController!.didMove(toParentViewController: self)
        }
        
        MBProgressHUD.showAdded(to: self.navigationController?.view, animated: true)
        BLEManager.shared().startScanOnce(withDelay: 2) { (success : Bool,CBPeripherals : NSMutableArray?) in
            MBProgressHUD.hide(for: self.navigationController?.view, animated: true)
            if success {
                self.showSelectBLETableViewController(isShow: true)
            } else {
                
            }
        }
        
    }

    @IBAction func hideSelectBLETableViewButtonAction() {
        showSelectBLETableViewController(isShow: false)
    }

    func showSelectBLETableViewController(isShow:Bool) {
        if isShow {
            view.addSubview(selectBLETableViewConnectView)
            selectBLETableViewConnectView.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
            UIView.transition(with: selectBLETableViewConnectView, duration: 0.1, options: .curveEaseInOut, animations: {
                self.selectBLETableViewConnectView.isHidden = false
                self.selectBLETableViewConnectView.transform = CGAffineTransform.identity
            })
        } else {
            
             UIView.transition(with: selectBLETableViewConnectView, duration: 0.1, options: .curveLinear, animations: {
                self.selectBLETableViewConnectView.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
             }, completion: { (finished) in
                self.selectBLETableViewConnectView.isHidden = true
             })
        }
    }
    
    

    
}
