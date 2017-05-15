//
//  Constant.swift
//  ADTemView
//
//  Created by andong on 2017/5/15.
//  Copyright © 2017年 AD.org. All rights reserved.
//

import Foundation
import UIKit

class Constant: NSObject {
    
    struct SCREEN_DIMENSION {
        static let BOUNDS                   = UIScreen.main.bounds
        static let WIDTH                    = UIScreen.main.bounds.size.width
        static let HEIGHT                   = UIScreen.main.bounds.size.height
        static let STATUS_BAR_HEIGHT        = UIApplication.shared.statusBarFrame.size.height
    }
    
    struct TEXT_ATTRIBUTE {
        
        static let emptyMessageTextAttributeNormal : [String:AnyObject] = {
            
            let attribute : [String:AnyObject] = [NSForegroundColorAttributeName : UIColor.white, NSFontAttributeName : UIFont(name: "Helvetica", size: 18)!]
            return attribute
            
        }()
        
//        static let navigationBarTextAttribute : [String:AnyObject] = {
//            
//            let attribute : [String:AnyObject] = [NSForegroundColorAttributeName : UIColor.white, NSFontAttributeName : (UIDevice.screen == .inches_3_5 || UIDevice.screen == .inches_4_0) ? UIFont(name: "Avenir-Light", size: 14)! : UIFont(name: "Avenir-Light", size: 18)!]
//            return attribute
//            
//        }()
        
    }
    
    struct FONTS {
        
//        static let  avenirLightFont =  (Device.screen == .inches_3_5 || Device.screen == .inches_4_0) ? UIFont(name: "Avenir-Light", size: 14) : UIFont(name: "Avenir-Light", size: 18)
//        static let  avenirHeavyFont =  (Device.screen == .inches_3_5 || Device.screen == .inches_4_0) ? UIFont(name: "Avenir-Heavy", size: 14) : UIFont(name: "Avenir-Heavy", size: 18)
        static let  fontSettingContent =  UIFont(name: "Avenir-Heavy", size: 16)
        static let  fontSettingSubContent =  UIFont(name: "Avenir-Book", size: 16)
        static let  fontSettingTitle =  UIFont(name: "Avenir-Light", size: 20)
    }
    
    struct COLORS {
        
//        static let kAPP_BACKGROUND_COLOR                                    = UIColor(hex6: 0x474A50)
//        static let kCLEAR_COLOR                                             = UIColor.clear
//        static let kBLACK_COLOR                                             = UIColor.black
//        static let kWHITE_COLOR                                             = UIColor.white
//        static let kBLUE_COLOR                                              = UIColor(hex6: 0x007AFF)
//        static let kGRAY_ACTION_BUTTON_DISABLED                             = UIColor(hex6: 0x4A4A4A)
//        static let kYELLOW_COLOR                                              = UIColor(hex6: 0xF6D431)
//        static let kLIGHT_RED_COLOR                                              = UIColor(hex6: 0xEE635A)
        
    }
}
