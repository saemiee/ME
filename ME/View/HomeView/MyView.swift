//
//  MyView.swift
//  ME
//
//  Created by 새미 on 2023/08/17.
//

import UIKit
import SnapKit
import Then

final class MyView: UIView {
    
    // MARK: - Properties
    private let amountOfActivityLabel = UILabel().then {
        $0.text = "활동량"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    }
    
    private let amountOfActivity = UILabel().then {
        $0.textColor = .yellow
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.text = "300 Kcal"
    }
    
    private lazy var amountOfActivityStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .leading
    }
    
    private let pointLabel = UILabel().then {
        $0.text = "포인트"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    }
    
    private let point = UILabel().then {
        $0.textColor = .yellow
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.text = "30 Point"
    }
    
    private lazy var pointStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .leading
    }
    
    private let bestExercisesLabel = UILabel().then {
        $0.text = "가장 많이 한 운동"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    }
    
    private let bestExercises = UILabel().then {
        $0.textColor = .yellow
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.text = "수영"
    }
    
    private lazy var bestExercisesStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .leading
    }
    
    private lazy var stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.alignment = .leading
        $0.spacing = 10
    }
    
    let activityRing = ActivityRingView().then {
        $0.backgroundColor = .clear
    }
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setting
    private func configureUI() {
        backgroundColor = .gray
        
        layer.cornerRadius = 7
        layer.masksToBounds = true
        
        addView()
        setLayout()
    }
    
    // MARK: - Add View
    private func addView() {
        [amountOfActivityLabel, amountOfActivity].forEach { amountOfActivityStackView.addArrangedSubview($0) }
        [pointLabel, point].forEach { pointStackView.addArrangedSubview($0) }
        [bestExercisesLabel, bestExercises].forEach { bestExercisesStackView.addArrangedSubview($0) }
        
        [amountOfActivityStackView, pointStackView, bestExercisesStackView].forEach { stackView.addArrangedSubview($0) }
        
        [stackView, activityRing].forEach { self.addSubview($0) }
    }
    
    // MARK: - Layout
    private func setLayout() {
        amountOfActivityStackView.snp.makeConstraints {
            $0.height.equalTo(20)
        }
        
        pointStackView.snp.makeConstraints {
            $0.height.equalTo(20)
        }
        
        bestExercisesStackView.snp.makeConstraints {
            $0.height.equalTo(20)
        }
        
        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(18)
            $0.leading.equalToSuperview().inset(20)
        }
        
        activityRing.snp.makeConstraints {
            $0.width.height.equalTo(200)
            $0.trailing.equalToSuperview().inset(12)
            $0.centerY.equalToSuperview()
        }
    }
}
