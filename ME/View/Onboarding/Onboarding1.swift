//
//  Onboarding1.swift
//  ME
//
//  Created by 새미 on 2023/08/08.
//

import UIKit

import SnapKit
import Then

final class Onboarding1: UIView {
    
    // MARK: - Properties
    private let mainLabel = UILabel().then {
        $0.text = "Apple Watch 에서\n나의 운동 데이터를 측정"
        $0.textColor = .white
        $0.numberOfLines = 2
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        $0.setLineSpacing(spacing: 4)
    }
    
    private let explanationLabel = UILabel().then {
        $0.text = "Apple Watch 피트니스 앱을 통해\n나의 운동 데이터를 자동으로 측정합니다."
        $0.textColor = .white
        $0.numberOfLines = 2
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.setLineSpacing(spacing: 2)
    }
    
    private let appleWatchImage = UIImageView().then {
        $0.image = UIImage(named: "appleWatch")
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
        backgroundColor = .background
        addView()
        setLayout()
    }
    
    // MARK: - Add View
    private func addView() {
        [mainLabel, explanationLabel, appleWatchImage].forEach { addSubview($0) }
    }
    
    // MARK: - Layout
    private func setLayout() {
        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(110)
            $0.leading.equalToSuperview().inset(27)
        }
        
        explanationLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(25)
            $0.leading.equalToSuperview().inset(27)
        }

        appleWatchImage.snp.makeConstraints {
            $0.top.equalTo(explanationLabel.snp.bottom).offset(100)
            $0.leading.trailing.equalToSuperview().inset(62)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(288)
        }
    }
}
