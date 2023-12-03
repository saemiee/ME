//
//  Onboarding2.swift
//  ME
//
//  Created by 새미 on 2023/08/08.
//

import UIKit

import SnapKit
import Then

final class Onboarding2: UIView {
    
    // MARK: - Properties
    private let mainLabel = UILabel().then {
        $0.text = "100 칼로리 당 1 포인트 적립"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 24, weight: .medium)
    }
    
    private let explanationLabel = UILabel().then {
        $0.text = "측정한 데이터를 바탕으로 10 칼로리를 소비 할 때마다\n1 포인트가 적립됩니다. (일일 최대 100 포인트)"
        $0.textColor = .white
        $0.numberOfLines = 2
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.setLineSpacing(spacing: 2)
    }
    
    private let pointImage = UIImageView().then {
        $0.image = UIImage(named: "point")
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
        [mainLabel, explanationLabel, pointImage].forEach { addSubview($0) }
    }
    
    // MARK: - Layout
    private func setLayout() {
        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(110)
            $0.leading.equalToSuperview().inset(27)
        }
        
        explanationLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(23)
            $0.leading.equalToSuperview().inset(27)
        }

        pointImage.snp.makeConstraints {
            $0.top.equalTo(explanationLabel.snp.bottom).offset(149)
            $0.leading.trailing.equalToSuperview().inset(85)
            $0.height.equalTo(220)
            
        }
    }
}
