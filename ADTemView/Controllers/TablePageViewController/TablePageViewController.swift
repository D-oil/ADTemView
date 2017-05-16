//
//  TablePageViewController.swift
//  ADTemView
//
//  Created by 董安东 on 2017/5/16.
//  Copyright © 2017年 AD.org. All rights reserved.
//

import UIKit

class TablePageViewController: ADBaseViewController {

    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        get {
            return .landscapeRight
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonAction() {
        AppDelegate .deviceRotationTo(deviceOrientation: .portrait)
        onCloseClicked()
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
