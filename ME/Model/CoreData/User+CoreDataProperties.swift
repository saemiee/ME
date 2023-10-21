//
//  User+CoreDataProperties.swift
//  ME
//
//  Created by 새미 on 2023/10/04.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var kcal: Int64
    @NSManaged public var point: Int64
    @NSManaged public var mainExercise: String?

}

extension User : Identifiable {

}
