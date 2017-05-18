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
    
    struct STORYBOARDS {
        static let MAIN_STORYBOARD          =   UIStoryboard(name: "Main", bundle: nil)
    }
    
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
        
        static let  HomePageTableYAxisTextFont = UIFont.init(name: "HelveticaNeue", size: 11.0)!
        static let  HomePageTableXAxisTextFont = UIFont.init(name: "HelveticaNeue-Bold", size: 11.0)!

    }
    
    struct COLORS {
        
        static let kHomePageTableAxisLineColor = UIColor.black
        static let kHomePageTableYAxisTextColor = UIColor.init(colorLiteralRed: 219.0/255.0, green: 33.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        static let kHomePageTableLineColor = UIColor.init(colorLiteralRed: 134.0/255.0, green: 0.0, blue: 72.0/255.0, alpha: 1.0)
        static let kSettingSwitchOpenTextColor  = UIColor.init(colorLiteralRed: 132/255.0, green: 255/255.0, blue: 47/255.0, alpha: 1.0)
        static let kSettingSwitchCloseTextColor = UIColor.init(colorLiteralRed: 39/255.0, green: 46/255.0, blue: 57/255.0, alpha: 1.0)
        
    }
}
