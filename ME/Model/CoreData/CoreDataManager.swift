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
    
    // MARK: - Create User
    func createUser(name: String, kcal: Int64, point: Int64, mainExercsie: String?) {
        guard let context = context else { return }
        
        let user = User(context: context)
        user.name = name
        user.kcal = kcal
        user.point = point
        user.mainExercise = mainExercsie
        
        saveContext()
    }
    
    // MARK: - Fetch Users
    func fetchUsers() -> [User] {
        guard let context = context else { return [] }
        
        let request: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let users = try context.fetch(request)
            return users
        } catch {
            print("Error fetching users: \(error.localizedDescription)")
            return []
        }
    }

    // MARK: - Core Data Context Save
    private func saveContext() {
        guard let context = context else { return }
        
        do {
            try context.save()
        } catch {
            print("Error")
        }
    }

}
