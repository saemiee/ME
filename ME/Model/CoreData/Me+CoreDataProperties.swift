//
//  Me+CoreDataProperties.swift
//  ME
//
//  Created by 새미 on 2023/09/10.
//
//

import Foundation
import CoreData


extension Me {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Me> {
        return NSFetchRequest<Me>(entityName: "Me")
    }

    @NSManaged public var myPoint: Int64
    @NSManaged public var myKcal: Int64
    @NSManaged public var myTag: String?
    @NSManaged public var enjoyExercise: String?

}

extension Me : Identifiable {

}
