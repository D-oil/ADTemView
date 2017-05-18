//
//  ProbeManager.swift
//  ADTemView
//
//  Created by 董安东 on 2017/5/18.
//  Copyright © 2017年 AD.org. All rights reserved.
//

import UIKit
import CoreData

class ProbeManager: NSObject {
    
    static let shared = ProbeManager.init()
    
    let persistentContainer = AppDelegate.shared.persistentContainer
    
    var currentProbe : ADProbe?
    
    private override init() {}
    
    //        NSEntityDescription.entity(forEntityName: Constant.ENTITIYNAME.ADPROBE, in: persistentContainer)

    
    func cerateADProbe(identifier:String,name:String) -> NSManagedObject {
        
        let probe = NSEntityDescription.insertNewObject(forEntityName: Constant.ENTITIYNAME.ADPROBE, into: persistentContainer.viewContext)
        currentProbe = probe as? ADProbe
        currentProbe?.name = name
        currentProbe?.identifier = identifier
        return probe
    }
   
    
}
