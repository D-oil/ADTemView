//
//  BLETableViewController.swift
//  ADTemView
//
//  Created by 董安东 on 2017/5/16.
//  Copyright © 2017年 AD.org. All rights reserved.
//

import UIKit

class BLETableViewController: ADBaseViewController,UITableViewDataSource,UITableViewDelegate
{

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var messageBackgroundView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Enum.CellIdentifier.ADHomePageBLETableViewCell.rawValue, for: indexPath)
        
        cell.textLabel?.text = "FMG 01"
        
        return cell
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
