//
//  MyViewController.swift
//  ME
//
//  Created by 새미 on 2023/08/26.
//

import UIKit
import SnapKit
import Then

final class MyViewController: UIViewController {
    
    // MARK: - Properties
    private let titleLabel = UILabel().then {
        $0.text = "설정"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    private let checkButton = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(UIColor.yellow, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.backgroundColor = .clear
        $0.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
    }
    
    private let logoutButton = UIButton().then {
        $0.setTitle("로그아웃", for: .normal)
        $0.backgroundColor = .clear
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .darkGray
        $0.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 254);
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    }
    
    private let divLine = UIView().then {
        $0.backgroundColor = .lightGray
    }
    
    private let secessionButton = UIButton().then {
        $0.setTitle("탈퇴하기", for: .normal)
        $0.backgroundColor = .clear
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .darkGray
        $0.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 254);
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    }
    
    private lazy var logoutStackView = UIStackView().then {
        $0.spacing = 0
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .fill
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 7
    }
    
    private let couponBoxButton = UIButton().then {
        $0.setTitle("쿠폰함", for: .normal)
        $0.backgroundColor = .darkGray
        $0.setTitleColor(.white, for: .normal)
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 7
        $0.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 256);
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    }
    
    private let MEButton = UIButton().then {
        $0.setTitle("ME", for: .normal)
        $0.backgroundColor = .darkGray
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 7
        $0.setTitleColor(.white, for: .normal)
        $0.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 256);
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    }
    
    private lazy var stackView = UIStackView().then {
        $0.spacing = 46
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .fill
    }

    // MARK: - Life Cycl
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        addView()
        setupLayout()
    }
    
    // MARK: - Add View
    func addView() {
        [logoutButton, divLine, secessionButton].forEach { self.logoutStackView.addArrangedSubview($0) }
        [logoutStackView, couponBoxButton, MEButton].forEach { self.stackView.addArrangedSubview($0) }
        [titleLabel, checkButton, stackView].forEach { view.addSubview($0) }
    }

    // MARK: - Layout
    func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
        
        checkButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        logoutButton.snp.makeConstraints {
            $0.height.equalTo(54)
        }
        
        divLine.snp.makeConstraints {
            $0.height.equalTo(0.2)
        }
        
        secessionButton.snp.makeConstraints {
            $0.height.equalTo(54)
        }
        
        couponBoxButton.snp.makeConstraints {
            $0.height.equalTo(54)
        }
        
        MEButton.snp.makeConstraints {
            $0.height.equalTo(54)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
    }
    // MARK: - Check Button Action
    @objc func checkButtonTapped() {
        dismiss(animated: true)
        print("buttonTapped")
    }
    
}
