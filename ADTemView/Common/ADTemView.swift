//
//  ADTemView.swift
//  ADTemView
//
//  Created by andong on 2017/5/15.
//  Copyright © 2017年 AD.org. All rights reserved.
//

import Foundation

public let ADUserDefault = UserDefaults.standard

struct ADTemView {
    //设置项
    static let kTemperatureMode = "kTemperatureMode"
    
    static var temperatureMode: String? {
        get {
            return ADUserDefault.value(forKey: ADTemView.kTemperatureMode) as? String
        }
        set {
            ADUserDefault.set(newValue, forKey: ADTemView.kTemperatureMode)
        }
    }
    
    static let kAlarmSwitch = "kAlarmSwitch"
    
    static var alarmSwitch: Bool? {
        get {
            return ADUserDefault.value(forKey: kAlarmSwitch) as? Bool
        }
        set {
            ADUserDefault.set(newValue, forKey: kAlarmSwitch)
        }
    }
    
    static let kHighTemperatureSwitch = "kHighTemperatureSwitch"
    
    static var highTemperatureSwitch: Bool? {
        get {
            return ADUserDefault.value(forKey: kHighTemperatureSwitch) as? Bool
        }
        set {
            ADUserDefault.set(newValue, forKey: kHighTemperatureSwitch)
        }
    }
    
    static let kHighTemperatureValue = "kHighTemperatureValue"
    
    static var highTemperatureValue: Double? {
        get {
            return ADUserDefault.value(forKey: kHighTemperatureValue) as? Double
        }
        set {
            ADUserDefault.set(newValue, forKey: kHighTemperatureValue)
        }
    }
    
    static let kLowTemperatureSwitch = "kLowTemperatureSwitch"
    
    static var lowTemperatureSwitch: Bool? {
        get {
            return ADUserDefault.value(forKey: kLowTemperatureSwitch) as? Bool
        }
        set {
            ADUserDefault.set(newValue, forKey: kLowTemperatureSwitch)
        }
    }
    
    static let kLowTemperatureValue = "kLowTemperatureValue"
    
    static var lowTemperatureValue: Double? {
        get {
            return ADUserDefault.value(forKey: kLowTemperatureValue) as? Double
        }
        set {
            ADUserDefault.set(newValue, forKey: kLowTemperatureValue)
        }
    }
    
    static let kAlarmModeSwitch = "kAlarmModeSwitch"
    
    static var alarmModeSwitch: Bool? {
        get {
            return ADUserDefault.value(forKey: kAlarmModeSwitch) as? Bool
        }
        set {
            ADUserDefault.set(newValue, forKey: kAlarmModeSwitch)
        }
    }
    
    static let kAlarmMode = "kAlarmMode"
    
    static var alarmMode: String? {
        get {
            return ADUserDefault.value(forKey: kAlarmMode) as? String
        }
        set {
            ADUserDefault.set(newValue, forKey: kAlarmMode)
        }
    }
    
}
