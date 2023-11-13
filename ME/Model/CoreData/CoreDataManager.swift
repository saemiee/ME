//
//  CoreDataManager.swift
//  ME
//
//  Created by 새미 on 2023/09/10.
//

import CoreData
import UIKit

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    private init() {}
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    let modelName: String = "Me"
    
    // MARK: - Read
    func getUserDataFromCoreData() -> [User] {
        var user: [User] = []
        
        if let context = context {
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            
            do {
                if let fetchedUser = try context.fetch(request) as? [User] {
                    user = fetchedUser
                }
            } catch {
                print("실패")
            }
        }
        return user
    }
    
}
