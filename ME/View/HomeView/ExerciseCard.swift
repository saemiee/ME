//
//  ExerciseCard.swift
//  ME
//
//  Created by 새미 on 2023/08/19.
//

import UIKit

import SnapKit
import Then

final class ExerciseCard: UIView {
    
    // MARK: - Properties
    private let exerciseImage = UIImageView().then {
        $0.image = UIImage.init( systemName: "figure.open.water.swim", withConfiguration: UIImage.SymbolConfiguration(pointSize: 28))
        $0.tintColor = .yellow
    }
    
    private let exerciseLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        $0.text = "수영"
    }
    
    private let kcalLabel = UILabel().then {
        $0.textColor = .yellow
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        $0.text = "1000 Kcal"
    }
    
    lazy var stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .leading
        $0.spacing = 7
    }
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .gray
        
        layer.cornerRadius = 6
        layer.masksToBounds = true
        
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Add View
    private func addView() {
        [exerciseLabel, kcalLabel].forEach { self.stackView.addArrangedSubview($0) }
        [exerciseImage, stackView].forEach { self.addSubview($0) }
    }
    
    // MARK: - Layout
    private func setLayout() {
        exerciseImage.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
        
        exerciseLabel.snp.makeConstraints {
            $0.height.equalTo(12)
        }
        
        kcalLabel.snp.makeConstraints {
            $0.height.equalTo(12)
        }
        
        stackView.snp.makeConstraints {
            $0.leading.equalTo(exerciseImage.snp.trailing).offset(12)
            $0.centerY.equalToSuperview()
        }
    }
}
