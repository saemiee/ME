//
//  ExerciseDataManager.swift
//  ME
//
//  Created by 새미 on 2023/08/12.
//

import UIKit

final class ExerciseDataManager {
    
    private var exerciseDataArray: [Exercise] = []
    
    // MARK: - Make Exercise Data
    func makeExerciseData() {
        exerciseDataArray = [
            Exercise(exerciseImage: UIImage(systemName: "figure.walk", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), exercise: "걷기", kcal: 0, point: 0, description: "일상 속 바르게 걷기 습관을 실천해 보세요."),
            Exercise(exerciseImage: UIImage(systemName: "figure.open.water.swim", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), exercise: "수영", kcal: 0, point: 0, description: "수영은 중력에 영향을 덜 받는 운동으로\n무리한 운동을 피해야 하는 사람들에게도\n적합한 운동입니다."),
            Exercise(exerciseImage: UIImage(systemName: "figure.outdoor.cycle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), exercise: "사이클링", kcal: 0, point: 0, description: "사이클링은 심폐지구력 강화와\n관절 및 근육 강화에 도움이 됩니다."),
            Exercise(exerciseImage: UIImage(systemName: "figure.pilates", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), exercise: "필라테스", kcal: 0, point: 0, description: "필라테스는 신체의 전 근육을\n과학적으로 단련하기 위한 운동입니다."),
            Exercise(exerciseImage: UIImage(systemName: "figure.run", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), exercise: "달리기", kcal: 0, point: 0, description: "달리기는 심폐 기능을 높일 수 있는\n대표적인 유산소 운동입니다."),
            Exercise(exerciseImage: UIImage(systemName: "figure.elliptical", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), exercise: "일립티컬", kcal: 0, point: 0, description: "일립티컬은 복부, 팔, 힙, 하체 운동으로\n심폐지구력 향상에 도움이 됩니다."),
            Exercise(exerciseImage: UIImage(systemName: "figure.core.training", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), exercise: "코어 트레이닝", kcal: 0, point: 0, description: "코어 트레이닝으로 복부와 등의\n근력을 강화해 보세요."),
            Exercise(exerciseImage: UIImage(systemName: "figure.stair.stepper", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), exercise: "스텝퍼 운동", kcal: 0, point: 0, description: "스텝퍼 운동은 체중과 다리,\n엉덩이 힘을 이용해  발판을 밟아\n유산소와 근력 운동에 도움이 됩니다."),
            Exercise(exerciseImage: UIImage(systemName: "figure.dance", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), exercise: "댄스", kcal: 0, point: 0, description: "신나는 음악에 맞춰 춤을 춰 보세요 !"),
            Exercise(exerciseImage: UIImage(systemName: "figure.strengthtraining.functional", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), exercise: "기능성 근력 강화 운동", kcal: 0, point: 0, description: "일상생활 속의 동작을 재연한 근력 강화\n운동으로 근력을 키워 보세요."),
            Exercise(exerciseImage: UIImage(systemName: "figure.hiking", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), exercise: "하이킹", kcal: 0, point: 0, description: "하이킹으로 건강과 아름다운 자연의 풍경\n2가지 모두 챙겨 보세요."),
            Exercise(exerciseImage: UIImage(systemName: "figure.highintensity.intervaltraining", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), exercise: "고강도 인터벌 트레이닝", kcal: 0, point: 0, description: "강렬한 운동과 함께 약한 운동이나\n짧은 휴식을 병행해 칼로리 소모를\n극대화해 보세요."),
            Exercise(exerciseImage: UIImage(systemName: "figure.rower", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), exercise: "로잉 운동", kcal: 0, point: 0, description: "로잉 운동은 근력과 폐 건강을 모두\n잡을 수 있는 대표적인 전신 운동입니다.")
        ]
    }
    
    // MARK: - Get Exercise Data
    func getExerciseData() -> [Exercise] {
        return exerciseDataArray
    }
    
}
