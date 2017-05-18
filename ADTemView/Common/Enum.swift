//
//  Enum.swift
//  ADTemView
//
//  Created by andong on 2017/5/15.
//  Copyright © 2017年 AD.org. All rights reserved.
//

import Foundation
import UIKit

class Enum: NSObject {
    
    enum AppMode        : NSString {
        case testMode    = "testMode"
        case releaseMode = "releaseMode"
    }
    
    enum TemperatureMode      : String {
        case centigrade = "℃"
        case fahrenheit = "℉"
    }
    
    enum AlarmModel           : String {
        case ring            = "ring"
        case vibration       = "vibration"
        case ring_vibration  = "ring_vibration"
    }
    
    enum StoryboardIdentifier : String {
        case ADStartPageSelectBLETableViewController = "ADStartPageSelectBLETableViewController"
        case ADEditProbeInfoTableViewController      = "ADEditProbeInfoTableViewController"
        case ADBLETableViewController                = "ADBLETableViewController"

    }
    
    enum CellIdentifier       : String {
        case ADStartPageSelectBLETableViewCell       = "ADStartPageSelectBLETableViewCell"
        case ADHomePageBLETableViewCell              = "ADHomePageBLETableViewCell"
    }
    
    enum StoryboardSegueIndentifier      : String {
        case ADPushToHomePageSegue                   = "ADPushToHomePageSegue"
    }
    
}
