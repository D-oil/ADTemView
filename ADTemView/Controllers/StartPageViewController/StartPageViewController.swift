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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func StartButtonAction(_ sender: UIButton) {
        
//        self.navigationController?.performSegue(withIdentifier: Enum.StoryboardSegue.ADPushToHomePageSegue.rawValue, sender: nil)
        
        if startPageSelectBLETableViewController == nil {
            startPageSelectBLETableViewController = Enum.STORYBOARDS.MAIN_STORYBOARD.instantiateViewController(withIdentifier: Enum.StoryboardIdentifier.ADStartPageSelectBLETableViewController.rawValue) as? StartPageSelectBLETableViewController
            
            self.addChildViewController(startPageSelectBLETableViewController!)
            selectBLETableView.addSubview(startPageSelectBLETableViewController!.view)
            startPageSelectBLETableViewController!.didMove(toParentViewController: self)
        }
        
        showSelectBLETableViewController(isShow: true)
        
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
