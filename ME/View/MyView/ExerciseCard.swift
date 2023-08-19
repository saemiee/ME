//
//  ExerciseCard.swift
//  ME
//
//  Created by 새미 on 2023/08/19.
//

import UIKit
import SnapKit
import Then

class ExerciseCard: UIView {
    
    // MARK: - Properties
    private let exerciseImage = UIImageView()
    
    private let exerciseLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    
    private let kcalLabel = UILabel().then {
        $0.textColor = .yellow
        $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
    }
    
    private let pointLabel = UILabel().then {
        $0.textColor = .yellow
        $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
    }
    
    lazy var stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
    }
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .background
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Add View
    private func addView() {
        [kcalLabel, pointLabel].forEach { self.stackView.addArrangedSubview($0) }
        [exerciseImage, exerciseLabel, stackView].forEach { self.addSubview($0) }
    }
    
    // MARK: - Layout
    private func setLayout() {
        exerciseImage.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
        }
        
        exerciseLabel.snp.makeConstraints {
            $0.leading.equalTo(exerciseImage.snp.trailing).offset(7)
            $0.top.equalToSuperview().inset(15)
        }
        
        stackView.snp.makeConstraints {
            $0.leading.equalTo(exerciseImage.snp.trailing).offset(7)
            $0.bottom.equalToSuperview().inset(15)
        }
    }
    
}
