//
//  StartPageSelectBLETableViewController.swift
//  ADTemView
//
//  Created by andong on 2017/5/15.
//  Copyright © 2017年 AD.org. All rights reserved.
//

import UIKit

class StartPageSelectBLETableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source and dalegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch AppDelegate.appMode {
        case .testMode :
            return 1
        case .releaseMode :
            return BLEManager.shared().cbPeripherals.count
        }
        
        
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Enum.CellIdentifier.ADStartPageSelectBLETableViewCell.rawValue, for: indexPath)
        
        switch AppDelegate.appMode {
        case .testMode :
            cell.textLabel?.text = "FMG 01"

        case .releaseMode :
            let peripheral = BLEManager.shared().cbPeripherals[indexPath.row] as! CBPeripheral
            cell.textLabel?.text = peripheral.name
        }

        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch AppDelegate.appMode {
        case .testMode :
            
            //如果没有id 为 ABCDEF的对象就创建一个假ADProbe对象用来测试，有就取出对象
            
            if let probe =  ProbeManager.shared.isExistProbe(identifier: "ABCDEF") {
                ProbeManager.shared.currentProbe = probe as? ADProbe
            } else {
               _ = ProbeManager.shared.cerateADProbe(identifier: "ABCDEF", name: "FMG 01")
            }

            parent!.performSegue(withIdentifier: Enum.StoryboardSegueIndentifier.ADPushToHomePageSegue.rawValue , sender: nil)
            (parent as! StartPageViewController).hideSelectBLETableViewButtonAction()
            
        case .releaseMode :
            
            let didSelectPeripheral = BLEManager.shared().cbPeripherals[indexPath.row] as! CBPeripheral
            
            (parent as! StartPageViewController).hideSelectBLETableViewButtonAction()
            
            MBProgressHUD.showAdded(to: self.navigationController?.view, animated: true)
            
            BLEManager.shared().connect(didSelectPeripheral ) { (success: Bool, peripheral : CBPeripheral?) in
                
                MBProgressHUD.hide(for: self.navigationController?.view, animated: true)
                if success {
                    //连接成功以后要创建数据库ADProbe对象,或者从数据库取对象
                    let peripheral = BLEManager.shared().cbPeripherals[indexPath.row] as! CBPeripheral
                    
                    if let probe =  ProbeManager.shared.isExistProbe(identifier: peripheral.identifier.uuidString) {
                        ProbeManager.shared.currentProbe = probe as? ADProbe
                    } else {
                        _ = ProbeManager.shared.cerateADProbe(identifier: peripheral.identifier.uuidString, name: peripheral.name!)
                    }
                    
                    self.parent!.performSegue(withIdentifier: Enum.StoryboardSegueIndentifier.ADPushToHomePageSegue.rawValue , sender: nil)
                } else {
                    MBProgressHUD.showMessageToView(view: (self.navigationController?.view)!, message: "连接失败,请重试", delay: 3)
                }
            }
        }
        
        
    }
    


}
