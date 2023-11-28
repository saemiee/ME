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
    
    let workoutTypes: [HKWorkoutActivityType] = [
        .walking, .swimming, .cycling, .pilates, .running, .elliptical, .coreTraining, .stepTraining, .socialDance, .functionalStrengthTraining, .hiking, .highIntensityIntervalTraining, .rowing
    ]
    
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
}
