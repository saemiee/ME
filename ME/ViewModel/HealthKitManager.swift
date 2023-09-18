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

    
    // MARK: - Request Authorization
//    func requestAuthorization() {
//        self.healthStore.requestAuthorization(toShare: nil, read: readWorkoutTypes) { workoutSuccess, workoutError in
//            if workoutError != nil {
//                print(workoutError.debugDescription)
//            } else {
//                if workoutSuccess {
//                    print("권한이 허락되었습니다.")
//                } else {
//                    print("권한이 아직 허용되지 않았어요.")
//                }
//            }
//        }
//
//        self.healthStore.requestAuthorization(toShare: nil, read: readActiveEnergyTypes) { kcalSuccess, kcalError in
//            if kcalError != nil {
//                print(kcalError.debugDescription)
//            } else {
//                if kcalSuccess {
//                    print("권한이 허락되었습니다.")
//                } else {
//                    print("권한이 아직 허용되지 않았어요.")
//                }
//            }
//        }
//    }
    
    // MARK: - Get Workout Data
//    func getWorkoutActivityTypeData(completion: @escaping ([HKWorkoutActivityType: Double]) -> Void) {
//        let now = Date()
//        let startOfDay = Calendar.current.startOfDay(for: now)
//        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
//
//        let workoutTypeSamples: Set<HKSampleType> = [HKObjectType.workoutType()]
//
//        let query = HKSampleQuery(sampleType: HKObjectType.workoutType(), predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (_, samples, error) in
//            guard let workoutSamples = samples as? [HKWorkout] else {
//                print("Error: \(error?.localizedDescription ?? "Unknown error")")
//                completion([:])
//                return
//            }
//
//            var activityTypeData: [HKWorkoutActivityType: Double] = [:]
//
//            for workout in workoutSamples {
//                let activityType = workout.workoutActivityType
//
//                // 해당 활동 유형에 대한 칼로리 합산 계산
//                if let caloriesBurned = workout.totalEnergyBurned?.doubleValue(for: HKUnit.kilocalorie()) {
//                    activityTypeData[activityType] = (activityTypeData[activityType] ?? 0) + caloriesBurned
//                }
//            }
//
//            DispatchQueue.main.async {
//                completion(activityTypeData)
//            }
//        }
//
//        healthStore.execute(query)
//    }
//
//    // MARK: - Get ActiveEnergy Data
//    func getActiveEnergyBurnedData(completion: @escaping (Double) -> Void) {
//        guard let activeEnergyBurned = HKSampleType.quantityType(forIdentifier: .activeEnergyBurned) else { return }
//
//        let now = Date()
//        let startData = Calendar.current.startOfDay(for: now)
//        let predicate = HKQuery.predicateForSamples(withStart: startData, end: now, options: .strictStartDate)
//
//        let query = HKStatisticsQuery(quantityType: activeEnergyBurned, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
//            var kcal: Double = 0
//
//            guard let result = result, let sum = result.sumQuantity() else {
//                print("fail")
//                return
//            }
//            kcal = sum.doubleValue(for: HKUnit.kilocalorie())
//            DispatchQueue.main.async {
//                completion(kcal)
//            }
//        }
//    }
//
//
//}
//
