//
//  ExerciseCollectionViewCell.swift
//  ME
//
//  Created by 새미 on 2023/08/14.
//

import UIKit

import SnapKit
import Then

final class ExerciseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    let circle = UIView().then {
        $0.backgroundColor = .darkGray
    }
    
    let exerciseImage = UIImageView().then {
        $0.tintColor = .yellow
    }
    
    let exerciseLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    let kcalLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.textAlignment = .left
    }
    
    let pointLabel = UILabel().then {
        $0.textColor = .lightOrange
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textAlignment = .left
    }
    
    lazy var stackView = UIStackView().then {
        $0.spacing = 1
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .leading
    }
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting
    private func setup() {
        backgroundColor = .gray
        
        self.layer.cornerRadius = 7
        self.clipsToBounds = true

        addView()
        setLayout()
    }
    
    // MARK: - Add View
    func addView() {
        [exerciseLabel, kcalLabel].forEach { self.stackView.addArrangedSubview($0) }
        [circle, exerciseImage, stackView, pointLabel].forEach { self.contentView.addSubview($0) }
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        circle.layer.cornerRadius = circle.frame.width / 2
        circle.layer.cornerRadius = circle.frame.height / 2
    }
    
    // MARK: - Layout
    func setLayout() {
        circle.snp.makeConstraints {
            $0.width.height.equalTo(48)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(12)
        }
        
        exerciseImage.snp.makeConstraints {
            $0.centerX.centerY.equalTo(circle.snp.center)
        }
        
        exerciseLabel.snp.makeConstraints {
            $0.height.equalTo(20)
        }
        
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.equalTo(40)
            $0.leading.equalTo(circle.snp.trailing).offset(10)
        }
        
        pointLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(30)
        }
    }
}
