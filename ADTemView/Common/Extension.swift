//
//  Extension.swift
//  ADTemView
//
//  Created by 董安东 on 2017/5/17.
//  Copyright © 2017年 AD.org. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
    func setShadowColorFromUIColor(color:UIColor) {
        self.shadowColor = color.cgColor;
    }
}

//
extension Notification.Name{
    static let TutorialFromSetting    = Notification.Name(rawValue: "TutorialFromSetting")
    static let CheckAppVersionFailed  = Notification.Name(rawValue: "CheckAppVersionFailed")
    static let CheckAppVersionSuccess = Notification.Name(rawValue: "CheckAppVersionSuccess")
    static let RequireForceUpdate     = Notification.Name(rawValue: "RequireForceUpdate")
    static let TooltipFromSetting     = Notification.Name(rawValue: "TooltipFromSetting")
    static let LoadStatisticSuccess   = Notification.Name(rawValue: "LoadStatisticSuccess")
}

