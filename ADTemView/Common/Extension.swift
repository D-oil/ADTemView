//
//  Extension.swift
//  ADTemView
//
//  Created by 董安东 on 2017/5/17.
//  Copyright © 2017年 AD.org. All rights reserved.
//

import Foundation
import UIKit
import Charts

extension CALayer {
    func setShadowColorFromUIColor(color:UIColor) {
        self.shadowColor = color.cgColor;
    }
}

//扩展一个属性，用来设置slider上的按钮图片，通过userdefault直接设置
extension UISlider {
    open var thumbImage: String? {
        get {
            return nil
        }
        set {
            self.setThumbImage(UIImage.init(named: newValue!), for: .normal)
            self.setThumbImage(UIImage.init(named: newValue!), for: .highlighted)
        }
    }
}

//通知拓展
extension Notification.Name{
    static let TemperatureSymbolChange    = Notification.Name(rawValue: "TemperatureSymbolChange")
    static let CurrentProbeChange    = Notification.Name(rawValue: "CurrentProbeChange")
}

extension MBProgressHUD {
    static func showMessageToView (view : UIView, message : String, delay : TimeInterval) {
        let openBLEMessageHUD = MBProgressHUD.showAdded(to: view, animated: true)!
        openBLEMessageHUD.mode = .text
        openBLEMessageHUD.labelText = message
        openBLEMessageHUD.show(true)
        openBLEMessageHUD.hide(true, afterDelay: delay)
    }
}


