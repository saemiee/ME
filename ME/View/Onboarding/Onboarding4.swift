//
//  Onboarding4.swift
//  ME
//
//  Created by 새미 on 2023/08/08.
//

import UIKit
import SnapKit
import Then

final class Onboarding4: UIView {

    // MARK: - Properties
    private let mainLabel = UILabel().then {
        $0.text = "다양한 기프티콘으로 교환 가능"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 24, weight: .medium)
    }
    
    private let explanationLabel = UILabel().then {
        $0.text = "운동을 통해 적립한 포인트는\n다양한 기프티콘으로 교환이 가능합니다."
        $0.textColor = .white
        $0.numberOfLines = 2
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.setLineSpacing(spacing: 2)
    }
    
    private let starbucksImage = UIImageView().then {
        $0.image = UIImage(named: "starbucks")
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
        [mainLabel, explanationLabel, starbucksImage].forEach { addSubview($0) }
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

        starbucksImage.snp.makeConstraints {
            $0.top.equalTo(explanationLabel.snp.bottom).offset(167)
            $0.leading.trailing.equalToSuperview().inset(69)
            $0.height.equalTo(252)
            
        }
    }


}
