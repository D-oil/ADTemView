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
    
    let context = AppDelegate.shared.persistentContainer.viewContext
    
    var currentProbe : ADProbe? {
        didSet{
            NotificationCenter.default.post(name: Notification.Name.CurrentProbeChange , object: oldValue)
        }
    }
 

    private override init() {}
    
    func cerateADProbe(identifier:String,name:String) -> NSManagedObject {
        
        let probe = NSEntityDescription.insertNewObject(forEntityName: Constant.ENTITIYNAME.ADPROBE, into: context) as? ADProbe
        probe?.name = name
        probe?.identifier = identifier
        
        currentProbe = probe

        return probe!
    }
   
    func isExistProbe(identifier:String) -> NSManagedObject? {
        
        let request = NSFetchRequest<NSManagedObject>.init(entityName:  Constant.ENTITIYNAME.ADPROBE)
        request.predicate = NSPredicate.init(format: "\(Constant.ADPROBEKEY.IDENTIFIER) = %@",argumentArray: [identifier])
        do {
            
            let result = try context.fetch(request) as? [ADProbe]
            if result?.count == 1 {
                return result?.first
            } else if result?.count == 0 {
                return nil
            } else {
                assert(false,"警告，数据库中存在相同identifier的设备，请查找原因")
            }
            
        } catch let error as NSError {
            print(error)
            return nil
        }
        
        
    }
    
}
