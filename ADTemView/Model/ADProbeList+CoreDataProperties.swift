//
//  ADProbeList+CoreDataProperties.swift
//  
//
//  Created by 董安东 on 2017/5/18.
//
//

import Foundation
import CoreData


extension ADProbeList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ADProbeList> {
        return NSFetchRequest<ADProbeList>(entityName: "ADProbeList")
    }

    @NSManaged public var probes: NSSet?

}

// MARK: Generated accessors for probes
extension ADProbeList {

    @objc(addProbesObject:)
    @NSManaged public func addToProbes(_ value: ADProbe)

    @objc(removeProbesObject:)
    @NSManaged public func removeFromProbes(_ value: ADProbe)

    @objc(addProbes:)
    @NSManaged public func addToProbes(_ values: NSSet)

    @objc(removeProbes:)
    @NSManaged public func removeFromProbes(_ values: NSSet)

}
