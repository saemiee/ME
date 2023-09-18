//
//  HealthKitManager.swift
//  ME
//
//  Created by 새미 on 2023/09/17.
//

import UIKit
import HealthKit

class HealthKitManager {
    
    let healthStore = HKHealthStore()
    
    var readTypes: Set<HKObjectType> {
        let workoutType = HKObjectType.workoutType()
        let activeEnergyType = HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!
        
        return [workoutType, activeEnergyType]
    }
    
    // MARK: - Check HealthKit Availability
    func checkHealthKit() {
        if !HKHealthStore.isHealthDataAvailable() {
            requestAuthorization()
        } else {
            
        }
    }
    
    // MARK: - Request Authorization
    func requestAuthorization() {
        healthStore.requestAuthorization(toShare: nil, read: readTypes) { success, error in
            if error != nil{
                print(error.debugDescription)
            } else {
                if success {
                    print("권한이 허락되었습니다.")
                } else {
                    print("권한이 아직 허용되지 않았습니다.")
                }
            }
        }
    }

}
