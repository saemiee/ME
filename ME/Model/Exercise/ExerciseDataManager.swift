//
//  ExerciseDataManager.swift
//  ME
//
//  Created by 새미 on 2023/08/12.
//

import UIKit

final class ExerciseDataManager {
    
    private var exerciseDataArray: [Exercise] = []
    
    init() {
        makeExerciseData()
    }

    func makeExerciseData() {
        exerciseDataArray = [
            Exercise(exerciseImage: UIImage(systemName: "figure.walk", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), exercise: "걷기", kcal: 1000, point: 100),
            Exercise(exerciseImage: UIImage(systemName: "figure.open.water.swim", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), exercise: "수영", kcal: 200, point: 2),
            Exercise(exerciseImage: UIImage(systemName: "figure.outdoor.cycle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), exercise: "사이클링", kcal: 1000, point: 100),
            Exercise(exerciseImage: UIImage(systemName: "figure.pilates", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), exercise: "필라테스", kcal: 0, point: 0),
            Exercise(exerciseImage: UIImage(systemName: "figure.run", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), exercise: "달리기", kcal: 0, point: 0),
            Exercise(exerciseImage: UIImage(systemName: "figure.elliptical", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), exercise: "일립티컬", kcal: 0, point: 0),
            Exercise(exerciseImage: UIImage(systemName: "figure.core.training", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), exercise: "코어 트레이닝", kcal: 0, point: 0),
            Exercise(exerciseImage: UIImage(systemName: "figure.stair.stepper", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), exercise: "스텝퍼 운동", kcal: 0, point: 0),
            Exercise(exerciseImage: UIImage(systemName: "figure.dance", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), exercise: "댄스", kcal: 0, point: 0),
            Exercise(exerciseImage: UIImage(systemName: "figure.strengthtraining.functional", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), exercise: "기능성 근력 강화 운동", kcal: 0, point: 0),
            Exercise(exerciseImage: UIImage(systemName: "figure.hiking", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), exercise: "하이킹", kcal: 0, point: 0),
            Exercise(exerciseImage: UIImage(systemName: "figure.highintensity.intervaltraining", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), exercise: "고강도 인터벌 트레이닝", kcal: 0, point: 0),
            Exercise(exerciseImage: UIImage(systemName: "figure.rower", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), exercise: "로잉 운동", kcal: 1000, point: 10)
        ]
    }
    
    func getExerciseData() -> [Exercise] {
        return exerciseDataArray
    }
}
