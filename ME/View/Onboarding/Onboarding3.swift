//
//  Onboarding3.swift
//  ME
//
//  Created by 새미 on 2023/08/08.
//

import UIKit
import SnapKit
import Then

final class Onboarding3: UIView {

    // MARK: - Properties
    private let mainLabel = UILabel().then {
        $0.text = "운동 태그 획득하기"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 24, weight: .medium)
    }
    
    private let explanationLabel = UILabel().then {
        $0.text = "표를 달성 할 때마다 다양한 태그 획득이 가능합니다.\n태그를 획득 할 때마다 5 포인트가 적립됩니다."
        $0.textColor = .white
        $0.numberOfLines = 2
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.setLineSpacing(spacing: 2)
    }
    
    private let dumbbellImage = UIImageView().then {
        $0.image = UIImage(named: "dumbbell")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .background
        addView()
        setLayout()
    }
    
    private func addView() {
        [mainLabel, explanationLabel, dumbbellImage].forEach { addSubview($0) }
    }
    
    private func setLayout() {
        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(110)
            $0.leading.equalToSuperview().inset(27)
        }
        
        explanationLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(23)
            $0.leading.equalToSuperview().inset(27)
        }

        dumbbellImage.snp.makeConstraints {
            $0.top.equalTo(explanationLabel.snp.bottom).offset(131)
            $0.leading.trailing.equalToSuperview().inset(50)
            $0.height.equalTo(255)
            
        }
    }
}
