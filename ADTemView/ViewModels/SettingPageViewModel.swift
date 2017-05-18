//
//  SettingPageViewModel.swift
//  ADTemView
//
//  Created by 董安东 on 2017/5/17.
//  Copyright © 2017年 AD.org. All rights reserved.
//

import UIKit

class SettingPageViewModel: NSObject {
    

    override init() {
        super.init()
    }
    
    func getTemperatureUnitSliderValueAndSymbolLabelColor (temperatureMode: Enum.TemperatureMode.RawValue) ->
        (sliderValue: Float ,leftSymbolLabelColor : UIColor , rightSymbolLabelColor : UIColor)?
    {
        
        switch temperatureMode {
        case Enum.TemperatureMode.centigrade.rawValue:
            return (0 , Constant.COLORS.kSettingSwitchOpenTextColor , Constant.COLORS.kSettingSwitchCloseTextColor)
        case Enum.TemperatureMode.fahrenheit.rawValue:
            return (1, Constant.COLORS.kSettingSwitchCloseTextColor , Constant.COLORS.kSettingSwitchOpenTextColor)
        default:
            return nil
        }
        
    }
    
    func temperatureUnitSliderDraggingEnd(currentValue : Float) -> Enum.TemperatureMode {
        if currentValue < 0.5 {
            return Enum.TemperatureMode.centigrade
        } else {
            return Enum.TemperatureMode.fahrenheit
        }
    }
    
    
    func getAlarmSettingSliderValueAndSwitchLabelColor (alarmSwitch :Bool) -> (sliderValue: Float ,leftSymbolLabelColor : UIColor , rightSymbolLabelColor : UIColor) {
        if alarmSwitch {
            return (0 , Constant.COLORS.kSettingSwitchOpenTextColor , Constant.COLORS.kSettingSwitchCloseTextColor )
        } else {
            return (1 , Constant.COLORS.kSettingSwitchCloseTextColor , Constant.COLORS.kSettingSwitchOpenTextColor)
        }
    }
    
    func alarmSettingSliderDraggingEnd(currentValue : Float) -> Bool {
        if currentValue < 0.5 {
            return true
        } else {
            return false
        }
    }
    
    
    func getAlarmModelSliderValueAndLabelColor (alarmModel: Enum.AlarmModel.RawValue) -> (sliderValue: Float ,leftSymbolLabelColor : UIColor , middleSymbolLabelColor : UIColor , rightSymbolLabelColor : UIColor)? {
        
        switch alarmModel {
        case Enum.AlarmModel.ring.rawValue:
            return (0 , Constant.COLORS.kSettingSwitchOpenTextColor , Constant.COLORS.kSettingSwitchCloseTextColor , Constant.COLORS.kSettingSwitchCloseTextColor)
        case Enum.AlarmModel.vibration.rawValue:
            return (0.5 ,Constant.COLORS.kSettingSwitchCloseTextColor , Constant.COLORS.kSettingSwitchOpenTextColor , Constant.COLORS.kSettingSwitchCloseTextColor )
        case Enum.AlarmModel.ring_vibration.rawValue:
            return (1 , Constant.COLORS.kSettingSwitchCloseTextColor, Constant.COLORS.kSettingSwitchCloseTextColor, Constant.COLORS.kSettingSwitchOpenTextColor  )
        default:
            return nil
        }
        
    }
    
    func alarmModelSliderDraggingEnd(currentValue : Float) -> Enum.AlarmModel {
        if currentValue < 0.33 {
            return Enum.AlarmModel.ring
        } else if currentValue < 0.66 {
            return Enum.AlarmModel.vibration
        } else {
            return Enum.AlarmModel.ring_vibration
        }
    }
    
    //判断温度的textField能否结束编辑
    func resolveTextFieldIsEndEditing(text:String) -> (isEndEdit: Bool,centigrade: Double) {
        
        var centigrade : Double = 0.0
        
        if ADTemView.temperatureMode == Enum.TemperatureMode.centigrade.rawValue {
            //判断长度是否小于4个字符
            if text.characters.count > 4 {
                return (false,0)
            }
            //判断是否能转化成 Double 值
            if let tem = Double.init(text) {
                centigrade = tem
            }
        } else if  ADTemView.temperatureMode == Enum.TemperatureMode.fahrenheit.rawValue {
            //判断长度是否小于5个字符
            if text.characters.count > 5 {
                return (false,0)
            }
            //判断是否能转化成 Double 值
            if let tem = Double.init(text) {
                centigrade =  ADTemView.fahrenheitToCentigrade(fahrenheit: tem)
            }
        } else {
            assert(false, "暂时不支持出了 C 和 F 以外的温度单位")
        }
        //判断是否在 32-43度之间
        if (centigrade >= 32.0 && centigrade <= 43.0) {
            return (true,centigrade)
        } else {
            return (false,0)
        }
        

    }

}
