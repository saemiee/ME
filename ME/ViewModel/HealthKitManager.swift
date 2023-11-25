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
    func requestAuthorization() {
        let typesToRead: Set<HKSampleType> =
        [HKObjectType.workoutType()]
        
        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { sucess, error in
            if sucess {
                self.requestAuthorization()
            } else {
                print("error")
            }
        }
    }
        
}
