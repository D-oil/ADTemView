//
//  EditProbeInfoTableViewController.swift
//  ADTemView
//
//  Created by 董安东 on 2017/5/16.
//  Copyright © 2017年 AD.org. All rights reserved.
//

import UIKit

class EditProbeInfoTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

    }

 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func disMissButtonAction(_ sender: UIButton) {
        let homePageVC = parent as! HomePageViewController
        homePageVC.showProbeInfoTableViewController(isShow: false)
    }

 

}
