//
//  ADBaseViewController.swift
//  ADTemView
//
//  Created by andong on 2017/5/15.
//  Copyright © 2017年 AD.org. All rights reserved.
//

import UIKit

class ADBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeStyle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)

        
    }
    
    override func viewDidAppear (_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        get {
            return .portrait
        }
    }
    
    func onCloseClicked() {
        navigationController!.popViewController(animated: true)
    }
    
    //MARK: - Helper methods
    
    func initializeStyle() {
        self.navigationItem.hidesBackButton = true
        //left back
//        let menuButton = Utils.createButtonWithIcon(icon: UIImage(named: "close")!)
//        menuButton.addTarget(self, action: #selector(onCloseClicked), for: .touchUpInside)
//        menuButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
//        
//        let acNavigation: ACNavigation = ACNavigation.instanceFromNib()
//        self.navigationItem.titleView = acNavigation
        
    }


}
