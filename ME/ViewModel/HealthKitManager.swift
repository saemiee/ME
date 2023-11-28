//
//  HealthKitManager.swift
//  ME
//
//  Created by 새미 on 2023/09/17.
//

import HealthKit
import UIKit

final class HealthKitManager {
    
    let healthStore = HKHealthStore()
    
    // MARK: - Authority Request
    func requestAuthorization(completion: @escaping (Bool, Error?) -> Void) {
        guard HKHealthStore.isHealthDataAvailable() else {
            completion(false,nil)
            return
        }
        
        let typesToRead: Set<HKObjectType> = [HKObjectType.workoutType()]
        
        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { success, error in
            completion(success, error)
        }
    }
    
    // MARK: - Get Workout Data
    func getWorkoutData(workoutType: HKWorkoutActivityType, completion: @escaping (Double?, Error?) -> Void) {
        guard let activeEnergyBurned = HKSampleType.quantityType(forIdentifier: .activeEnergyBurned) else {
            return
        }
        
        let now = Date()
        let startDate = Calendar.current.startOfDay(for: now)
        let endDate = Calendar.current.date(byAdding: .day, value: 1, to: startDate) ?? now
        
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)
        let workoutPredicate = HKQuery.predicateForWorkouts(with: workoutType)
        
        let compound = NSCompoundPredicate(andPredicateWithSubpredicates: [predicate, workoutPredicate])
        
        let query = HKStatisticsQuery(quantityType: activeEnergyBurned, quantitySamplePredicate: compound, options: .cumulativeSum) { _, result, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let result = result, let sum = result.sumQuantity() else {
                completion(nil, nil)
                return
            }
            
            let calories = sum.doubleValue(for: HKUnit.kilocalorie())
            DispatchQueue.main.async{
                completion(calories, nil)
            }
        }
        healthStore.execute(query)
    }

}
