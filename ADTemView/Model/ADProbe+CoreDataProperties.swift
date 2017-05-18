//
//  ADProbe+CoreDataProperties.swift
//  
//
//  Created by 董安东 on 2017/5/18.
//
//

import Foundation
import CoreData


extension ADProbe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ADProbe> {
        return NSFetchRequest<ADProbe>(entityName: "ADProbe")
    }

    @NSManaged public var identifier: String?
    @NSManaged public var name: String?
    @NSManaged public var list: ADProbeList?

}
