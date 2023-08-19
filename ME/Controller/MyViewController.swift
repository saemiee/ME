//
//  MyViewController.swift
//  ME
//
//  Created by 새미 on 2023/08/15.
//

import UIKit
import SnapKit
import Then

final class MyViewController: UIViewController {
    
    // MARK: - Properties
    private let myLabel = UILabel().then {
        $0.text = "MY"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    private let myView = MyView()
    
    private let exercisesLabel = UILabel().then {
        $0.text = "운동"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    private let exercisesMore = UILabel().then {
        $0.text = "더보기"
        $0.textColor = .lightOrange
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    
    private let tagLabel = UILabel().then {
        $0.text = "태그"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    private let tagMore = UILabel().then {
        $0.text = "더보기"
        $0.textColor = .lightOrange
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        addView()
        setLayout()
    }
    
    // MARK: - Add View
    private func addView() {
        [myLabel, myView, exercisesLabel, exercisesMore, tagMore].forEach { view.addSubview($0) }
    }
    
    // MARK: - Layout
    private func setLayout() {
        myLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(164)
            $0.leading.equalToSuperview().inset(30)
            $0.height.equalTo(24)
        }
        
        myView.snp.makeConstraints {
            $0.top.equalTo(myLabel.snp.bottom).offset(9)
            $0.bottom.equalToSuperview().inset(488)
            $0.leading.trailing.equalToSuperview().inset(32)
        }
        
        exercisesLabel.snp.makeConstraints {
            $0.top.equalTo(myView.snp.bottom).offset(34)
            $0.leading.equalToSuperview().inset(30)
            $0.height.equalTo(24)
        }
        
        exercisesMore.snp.makeConstraints {
            $0.top.equalTo(myView.snp.bottom).offset(34)
            $0.trailing.equalToSuperview().inset(30)
        }
        
        
    }

}
