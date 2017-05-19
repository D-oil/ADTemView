//
//  EditProbeInfoTableViewController.swift
//  ADTemView
//
//  Created by 董安东 on 2017/5/16.
//  Copyright © 2017年 AD.org. All rights reserved.
//

import UIKit

class EditProbeInfoTableViewController: UITableViewController ,UITextFieldDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nameFieldCheckButton: UIButton!
    @IBOutlet weak var identifierLabel: UILabel!
    @IBOutlet weak var cleanCheckButton: UIButton!
    @IBOutlet weak var closeCheckButton: UIButton!
    
    var originalName : String = (ProbeManager.shared.currentProbe?.name)!
    
    func updateUIFromCurrentProbe() {
        self.nameFieldCheckButton.isEnabled = false
        self.nameFieldCheckButton.backgroundColor = UIColor.gray
        nameField.text = ProbeManager.shared.currentProbe?.name
        identifierLabel.text = ProbeManager.shared.currentProbe?.identifier
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUIFromCurrentProbe()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTextFieldTargetAction()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.endEditing(true)
    }
    
    //MARK: textField
    
    func addTextFieldTargetAction() {
        nameField.addTarget(self, action: #selector(textFieldEditingChange(textField:)), for: .editingChanged)
    }
    
    var text =  (ProbeManager.shared.currentProbe?.name)!
    @objc
    func textFieldEditingChange(textField : UITextField) {
        
        if (textField.text?.characters.count)! > 6 {
            textField.text = text
        } else {
            text = textField.text!
        }
        
        if originalName == textField.text {
            self.nameFieldCheckButton.isEnabled = false
            self.nameFieldCheckButton.backgroundColor = UIColor.gray
        } else {
            self.nameFieldCheckButton.isEnabled = true
            self.nameFieldCheckButton.backgroundColor = UIColor.init(red: 0.0, green: 142/255.0, blue: 183/255.0, alpha: 1.0)
        }
    
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        nameFieldCheckButton.isEnabled = false
        cleanCheckButton.isEnabled = false
        closeCheckButton.isEnabled = false
    }
    

    func textFieldDidEndEditing(_ textField: UITextField) {
        if originalName != textField.text {
            nameFieldCheckButton.isEnabled = true
        }
        cleanCheckButton.isEnabled = true
        closeCheckButton.isEnabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func renameCheckButtonClick(_ sender: UIButton) {
        ProbeManager.shared.currentProbe?.name = nameField.text
        updateUIFromCurrentProbe()
        tableView.endEditing(true)
    }
    
    @IBAction func cleanProbeCheckButtonClick(_ sender: UIButton) {
        
    }
    
    
    @IBAction func closeProbeCheckButtonClick(_ sender: UIButton) {
        
    }
    
    
    @IBAction func disMissButtonAction(_ sender: UIButton) {
        let homePageVC = parent as! HomePageViewController
        homePageVC.showProbeInfoTableViewController(isShow: false)
    }

 

}
