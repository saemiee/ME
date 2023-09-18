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
            readData()
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
    
    // MARK: - Read Workout Data
    func readData(){
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        let workoutType = HKObjectType.workoutType()
        
        let query = HKSampleQuery(sampleType: workoutType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { query, samples, error in
            if let workoutSamples = samples as? [HKWorkout] {
                var kcalByWorkoutType: [HKWorkoutActivityType: Double] = [:]
                
                for workout in workoutSamples {
                    let activityType = workout.workoutActivityType
                    
                    if let kcalBurned = workout.totalEnergyBurned?.doubleValue(for: HKUnit.kilocalorie()) {
                        kcalByWorkoutType[activityType] = (kcalByWorkoutType[activityType] ?? 0) + kcalBurned
                    }
                }
                
                DispatchQueue.main.async {
                    print("")
                }
            }
        }
        self.healthStore.execute(query)
    }
    
}
