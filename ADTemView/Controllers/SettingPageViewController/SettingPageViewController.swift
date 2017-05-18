//
//  SettingPageViewController.swift
//  ADTemView
//
//  Created by 董安东 on 2017/5/16.
//  Copyright © 2017年 AD.org. All rights reserved.
//

import UIKit

class SettingPageViewController: ADBaseViewController ,UITextFieldDelegate{
    
    enum SliderTag : Int {
        case TemperatureUnitSliderTag = 0
        case AlarmSettingSliderTag = 1
        case AlarmModeSlider = 2
    }
    
    enum TextFieldTag : Int {
        case HighTemperatureTextField = 0
        case lowTemperatureTextField = 1
    }
    
    @IBOutlet weak var temperatureUnitCLable: UILabel!
    @IBOutlet weak var temperatureUnitSlider: UISlider!
    @IBOutlet weak var temperatureUnitFLabel: UILabel!
    @IBOutlet weak var alarmSettingOpenLabel: UILabel!
    @IBOutlet weak var alarmSettingSlider: UISlider!
    @IBOutlet weak var alarmSettingCloseLabel: UILabel!
    
    @IBOutlet weak var highTemperatureSwitch: UISwitch!
    @IBOutlet weak var highTemperatureTextField: UITextField!
    @IBOutlet weak var highTemperatureCLabel: UILabel!
    
    @IBOutlet weak var lowTemperatureSwitch: UISwitch!
    @IBOutlet weak var lowTemperatureTextField: UITextField!
    @IBOutlet weak var lowTemperatureCLabel: UILabel!
    
    @IBOutlet weak var alarmModeSlider: UISlider!
    @IBOutlet weak var alarmModeRingLabel: UILabel!
    @IBOutlet weak var alarmModeVibrationLabel: UILabel!
    @IBOutlet weak var alarmModeRing_VibrationLabel: UILabel!

    var settingPageViewModel : SettingPageViewModel?
    
    // MARK: UI
    func updateUIFromTemperatureMode()  {
        //温度单位行变化
        let modelInfo = settingPageViewModel?.getTemperatureUnitSliderValueAndSymbolLabelColor(temperatureMode:ADTemView.temperatureMode!)!
        if let temperatureMode = modelInfo {
            temperatureUnitSlider.value = temperatureMode.sliderValue
            temperatureUnitCLable.textColor = temperatureMode.leftSymbolLabelColor
            temperatureUnitFLabel.textColor = temperatureMode.rightSymbolLabelColor
        }
    }
    
    func updateUIFromAlarmSetting() {
        //报警设置行变化
        let alarmSettingSwitch = settingPageViewModel?.getAlarmSettingSliderValueAndSwitchLabelColor(alarmSwitch: ADTemView.alarmSwitch!)
        alarmSettingSlider.value = (alarmSettingSwitch?.sliderValue)!
        alarmSettingOpenLabel.textColor = alarmSettingSwitch?.leftSymbolLabelColor
        alarmSettingCloseLabel.textColor = alarmSettingSwitch?.rightSymbolLabelColor
        
    }
    
    func updateUIFromTemperature(){
        
        highTemperatureSwitch.isOn = ADTemView.highTemperatureSwitch!
        lowTemperatureSwitch.isOn = ADTemView.lowTemperatureSwitch!
        highTemperatureCLabel.text = ADTemView.temperatureMode
        lowTemperatureCLabel.text = ADTemView.temperatureMode
        
        if ADTemView.temperatureMode == Enum.TemperatureMode.centigrade.rawValue {
            highTemperatureTextField.text = String(format: "%.1f", ADTemView.highTemperatureValue!)
            lowTemperatureTextField.text = String(format: "%.1f", ADTemView.lowTemperatureValue!)
        } else {
            highTemperatureTextField.text = String(format: "%.1f", ADTemView.centigradeToFahrenheit(centigrade:ADTemView.highTemperatureValue!))
            lowTemperatureTextField.text = String(format: "%.1f", ADTemView.centigradeToFahrenheit(centigrade:ADTemView.lowTemperatureValue!))
        }
        
    }
    
    func updateUIFromAlarmModel(){
        //报警方式slider变化
        
        let alarmModelInfo = settingPageViewModel?.getAlarmModelSliderValueAndLabelColor(alarmModel: ADTemView.alarmMode!)
        if let alarmModel = alarmModelInfo {
            alarmModeSlider.value = alarmModel.sliderValue
            alarmModeRingLabel.textColor = alarmModel.leftSymbolLabelColor
            alarmModeVibrationLabel.textColor = alarmModel.middleSymbolLabelColor
            alarmModeRing_VibrationLabel.textColor = alarmModel.rightSymbolLabelColor
        }
        
    }
    
    func updateUIFromSettingInfo() {
        
        updateUIFromTemperatureMode()
        updateUIFromAlarmSetting()
        updateUIFromTemperature()
        updateUIFromAlarmModel()

    }
    
    // MARK: life cyc
    @IBAction func backButtonAction() {
        onCloseClicked()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        settingPageViewModel = SettingPageViewModel.init()
        
        updateUIFromSettingInfo()
        
        addSliderTargetAction()
        
        registerNotification()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: Notification Center
    
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateUIFromTemperature), name: NSNotification.Name.TemperatureSymbolChange, object: nil)
    }
    
    // MARK: Slider
    func addSliderTargetAction() {
        temperatureUnitSlider.addTarget(self, action: #selector(sliderEndDragging(slider:)), for: .touchUpInside)
        temperatureUnitSlider.addTarget(self, action: #selector(sliderEndDragging(slider:)), for: .touchUpOutside)
        alarmSettingSlider.addTarget(self, action: #selector(sliderEndDragging(slider:)), for: .touchUpInside)
        alarmSettingSlider.addTarget(self, action: #selector(sliderEndDragging(slider:)), for: .touchUpOutside)
        alarmModeSlider.addTarget(self, action: #selector(sliderEndDragging(slider:)), for: .touchUpInside)
        alarmModeSlider.addTarget(self, action: #selector(sliderEndDragging(slider:)), for: .touchUpOutside)
    }
    
    @objc
    func sliderEndDragging(slider:UISlider){
        switch slider.tag {
            case SliderTag.TemperatureUnitSliderTag.rawValue:
                
            ADTemView.temperatureMode = settingPageViewModel?.temperatureUnitSliderDraggingEnd(currentValue: slider.value).rawValue
            
            updateUIFromTemperatureMode()
            
            case SliderTag.AlarmSettingSliderTag.rawValue:
                
            ADTemView.alarmSwitch = settingPageViewModel?.alarmSettingSliderDraggingEnd(currentValue: slider.value)
            updateUIFromAlarmSetting()
            
            case SliderTag.AlarmModeSlider.rawValue:
                
            ADTemView.alarmMode = settingPageViewModel?.alarmModelSliderDraggingEnd(currentValue: slider.value).rawValue
            updateUIFromAlarmModel()
 
            default :break
        }
    }

    //MARK: TextField and KeyBoard
    
    //监听值变化，暂时不需要
//    func addTextFieldTargetAction() {
//        highTemperatureTextField.addTarget(self, action: #selector(textFieldEditingChange(textField:)), for: .editingChanged)
//        lowTemperatureTextField.addTarget(self, action: #selector(textFieldEditingChange(textField:)), for: .editingChanged)
//    }
//    
//    @objc
//    func textFieldEditingChange(textField : UITextField) {
//        
//        print("\(String(describing: textField.text))")
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        let backInfo = (settingPageViewModel?.resolveTextFieldIsEndEditing(text: textField.text!))!
        if backInfo.isEndEdit {
            if textField.tag == TextFieldTag.HighTemperatureTextField.rawValue {
                ADTemView.highTemperatureValue = backInfo.centigrade;
            } else if textField.tag == TextFieldTag.lowTemperatureTextField.rawValue {
                ADTemView.lowTemperatureValue = backInfo.centigrade;
            }
            return true
        } else {
            return false
        }

    }


}
