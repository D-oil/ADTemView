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
    struct STORYBOARDS {
        static let MAIN_STORYBOARD            =   UIStoryboard(name: "Main", bundle: nil)
    }
    
    enum StoryboardIdentifier : String {
        case ADStartPageSelectBLETableViewController = "ADStartPageSelectBLETableViewController"

    }
    
    enum CellIdentifier : String {
        case ADStartPageSelectBLETableViewCell = "ADStartPageSelectBLETableViewCell"
    }
    
    enum StoryboardSegue : String {
        case ADPushToHomePageSegue = "ADPushToHomePageSegue"
    }
    
}
