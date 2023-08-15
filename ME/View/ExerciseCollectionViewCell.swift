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
    
    static let identifier = "ExerciseCell"
    
    // MARK: - Properties
    let exerciseImage = UIImageView().then {
        $0.tintColor = .yellow

    }
    
    let exerciseLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    
    let kcalLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        $0.textAlignment = .left
    }
    
    let pointLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        $0.textAlignment = .left
    }
    
    lazy var kcalAndPointStackView = UIStackView().then {
        $0.spacing = 0
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .leading
    }
    
    lazy var stackView = UIStackView().then {
        $0.spacing = 1
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .leading
    }
    
    let divisionView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let descriptionLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        $0.numberOfLines = 0
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
        [kcalLabel, pointLabel].forEach { self.kcalAndPointStackView.addArrangedSubview($0) }
        [exerciseLabel, kcalAndPointStackView].forEach { self.stackView.addArrangedSubview($0) }
        [exerciseImage, stackView, divisionView, descriptionLabel].forEach { self.contentView.addSubview($0) }
    }
    
    // MARK: - Layout
    func setLayout() {
        exerciseImage.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12)
            $0.centerY.equalToSuperview()
        }
        
        exerciseLabel.snp.makeConstraints {
            $0.height.equalTo(20)
        }
        
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.equalTo(40)
            $0.leading.equalToSuperview().inset(52)
        }
        
        divisionView.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(1)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(186)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(divisionView.snp.trailing).offset(10)
        }
    }
    
}
