//
//  HealthKitManager.swift
//  ME
//
//  Created by 새미 on 2023/09/17.
//

import UIKit
import HealthKit

final class HealthKitManager {
    
    let healthStore = HKHealthStore()
    
    let workoutTypes: Set<HKWorkoutActivityType> = [
        .walking,
        .swimming,
        .cycling,
        .pilates,
        .running,
        .elliptical,
        .coreTraining,
        .stepTraining,
        .socialDance,
        .cardioDance,
        .functionalStrengthTraining,
        .hiking,
        .highIntensityIntervalTraining,
        .rowing
    ]
    
    var typesToRequest: Set<HKSampleType> = []
    
    func configure() {
        if !HKHealthStore.isHealthDataAvailable() {
            authorizingAccess()
        } else {
            print("데이터 받아오기")
        }
    }

    func kcalCalculator() {
        for activityType in workoutTypes {
            let energyType = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!
            let predicate = HKQuery.predicateForWorkouts(with: activityType)
            typesToRequest.insert(energyType)
            typesToRequest.insert(HKObjectType.workoutType())
            
            let query = HKStatisticsQuery(quantityType: energyType, quantitySamplePredicate: predicate, options: .cumulativeSum) { (query, result, error) in
                if let sum = result?.sumQuantity() {
                    let caloriesBurned = sum.doubleValue(for: HKUnit.kilocalorie())
                }
            }
            
            healthStore.execute(query)
        }
    }
    
    func authorizingAccess() {
        healthStore.requestAuthorization(toShare: typesToRequest, read: typesToRequest) { (success, error) in
            if !success {
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("HealthKit 권한 요청 실패: 알 수 없는 오류")
                }
            } else {
                print("HealthKit 권한 요청 성공")
            }
        }
    }
    
}
