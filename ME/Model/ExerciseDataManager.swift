//
//  ExerciseDataManager.swift
//  ME
//
//  Created by 새미 on 2023/08/12.
//

import UIKit

class ExerciseDataManager {
    
    private var exerciseDataArray: [Exercise] = []
    
    func makeExerciseData() {
        exerciseDataArray = [
            Exercise(exerciseImage: UIImage(systemName: "figure.walk"), exercise: "걷기", kcal: 0, point: 0),
            Exercise(exerciseImage: UIImage(systemName: "figure.open.water.swim"), exercise: "수영", kcal: 0, point: 0),
            Exercise(exerciseImage: UIImage(systemName: "figure.outdoor.cycle"), exercise: "사이클링", kcal: 0, point: 0),
            Exercise(exerciseImage: UIImage(systemName: "figure.pilates"), exercise: "필라테스", kcal: 0, point: 0),
            Exercise(exerciseImage: UIImage(systemName: "figure.run"), exercise: "달리기", kcal: 0, point: 0),
            Exercise(exerciseImage: UIImage(systemName: "figure.elliptical"), exercise: "일립티컬", kcal: 0, point: 0),
            Exercise(exerciseImage: UIImage(systemName: "figure.core.training"), exercise: "코어 트레이닝", kcal: 0, point: 0),
            Exercise(exerciseImage: UIImage(systemName: "figure.stair.stepper"), exercise: "스텝퍼 운동", kcal: 0, point: 0),
            Exercise(exerciseImage: UIImage(systemName: "figure.dance"), exercise: "댄스", kcal: 0, point: 0),
            Exercise(exerciseImage: UIImage(systemName: "figure.strengthtraining.functional"), exercise: "기능성 근력 강화 운동", kcal: 0, point: 0),
            Exercise(exerciseImage: UIImage(systemName: "figure.hiking"), exercise: "하이킹", kcal: 0, point: 0),
            Exercise(exerciseImage: UIImage(systemName: "figure.highintensity.intervaltraining"), exercise: "고강도 인터벌 트레이닝", kcal: 0, point: 0),
            Exercise(exerciseImage: UIImage(systemName: "figure.rower"), exercise: "로잉 운동", kcal: 0, point: 0)
        ]
    }
    
    func getExerciseData() -> [Exercise] {
        return exerciseDataArray
    }
    
}
