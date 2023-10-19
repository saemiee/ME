//
//  ExerciseCardView.swift
//  ME
//
//  Created by 새미 on 2023/10/19.
//

import UIKit
import SnapKit

final class ExerciseCardView: UIView {
    
    private let exerciseCard1 = ExerciseCard()
    private let exerciseCard2 = ExerciseCard()
    private let exerciseCard3 = ExerciseCard()
    private let exerciseCard4 = ExerciseCard()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addView() {
        [exerciseCard1, exerciseCard2, exerciseCard3,
         exerciseCard4].forEach { self.addSubview($0) }
    }
    
    private func setLayout() {
        exerciseCard1.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.49)
            $0.height.equalTo(66)
        }
        
        exerciseCard2.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.49)
            $0.height.equalTo(66)
        }
        
        exerciseCard3.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview()
            $0.height.equalTo(66)
            $0.width.equalToSuperview().multipliedBy(0.49)
        }
        
        exerciseCard4.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview()
            $0.height.equalTo(66)
            $0.width.equalToSuperview().multipliedBy(0.49)
        }
    }

}
