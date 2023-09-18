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
    
    let workoutType = HKObjectType.workoutType()
    let readWorkoutTypes: Set<HKSampleType>
    
    let activeEnergyType = HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!
    let readActiveEnergyTypes: Set<HKSampleType>
    
    init() {
        self.readWorkoutTypes = [workoutType]
        self.readActiveEnergyTypes = [activeEnergyType]
    }
    
    // MARK: - Configure
    func configure() {
        if !HKHealthStore.isHealthDataAvailable() {
            requestAuthorization()
        } else {
            print("")
        }
    }
    
    // MARK: - Request Authorization
    func requestAuthorization() {
        self.healthStore.requestAuthorization(toShare: nil, read: readWorkoutTypes) { workoutSuccess, workoutError in
            if workoutError != nil {
                print(workoutError.debugDescription)
            } else {
                if workoutSuccess {
                    print("권한이 허락되었습니다.")
                } else {
                    print("권한이 아직 허용되지 않았어요.")
                }
            }
        }
        
        self.healthStore.requestAuthorization(toShare: nil, read: readActiveEnergyTypes) { kcalSuccess, kcalError in
            if kcalError != nil {
                print(kcalError.debugDescription)
            } else {
                if kcalSuccess {
                    print("권한이 허락되었습니다.")
                } else {
                    print("권한이 아직 허용되지 않았어요.")
                }
            }
        }
    }
    
    // MARK: - Get Workout Data
    func getWorkoutData() {
        
    }
    
    // MARK: - Get ActiveEnergy Data
    func getActiveEnergyBurnedData(completion: @escaping (Double) -> Void) {
        guard let activeEnergyBurned = HKSampleType.quantityType(forIdentifier: .activeEnergyBurned) else { return }
        
        let now = Date()
        let startData = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startData, end: now, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: activeEnergyBurned, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
            var kcal: Double = 0
            
            guard let result = result, let sum = result.sumQuantity() else {
                print("fail")
                return
            }
            kcal = sum.doubleValue(for: HKUnit.kilocalorie())
            DispatchQueue.main.async {
                completion(kcal)
            }
        }
    }
    
    
}

