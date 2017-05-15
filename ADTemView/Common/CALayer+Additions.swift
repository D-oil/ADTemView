//
//  CALayer+Additions.swift
//  ADTemView
//
//  Created by andong on 2017/5/15.
//  Copyright © 2017年 AD.org. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
    func setShadowColorFromUIColor(color:UIColor) {
        self.shadowColor = color.cgColor;
    }
}
