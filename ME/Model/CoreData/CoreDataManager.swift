//
//  CoreDataManager.swift
//  ME
//
//  Created by 새미 on 2023/09/10.
//

import UIKit
import CoreData

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    private init() {}
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    let modelName: String = "Me"
    
    // MARK: - Get Data
    
    
    // MARK: -


    

}
