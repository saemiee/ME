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
    
    private lazy var logoutView = UIView().then {
        $0.backgroundColor = .darkGray
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 7
    }
    
    private let logoutButton = UIButton().then {
        $0.setTitle("로그아웃", for: .normal)
        $0.backgroundColor = .clear
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    }
    
    private let divisionLine = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let secessionButton = UIButton().then {
        $0.setTitle("탈퇴하기", for: .normal)
        $0.backgroundColor = .clear
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    }
    
    private lazy var logoutStackView = UIStackView().then {
        $0.spacing = 16
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .leading
    }
    
    private lazy var couponBoxView = UIView().then {
        $0.backgroundColor = .darkGray
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 7
    }
    
    private let couponBoxButton = UIButton().then {
        $0.setTitle("쿠폰함", for: .normal)
        $0.backgroundColor = .clear
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    }
    
    private lazy var MEView = UIView().then {
        $0.backgroundColor = .darkGray
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 7
    }
    
    private let MEButton = UIButton().then {
        $0.setTitle("ME", for: .normal)
        $0.backgroundColor = .clear
        $0.setTitleColor(.white, for: .normal)
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
        [logoutButton, divisionLine, secessionButton].forEach { self.logoutStackView.addArrangedSubview($0) }
        self.logoutView.addSubview(logoutStackView)
        self.couponBoxView.addSubview(couponBoxButton)
        self.MEView.addSubview(MEButton)
        [logoutView, couponBoxView, MEView].forEach { self.stackView.addArrangedSubview($0) }
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
            $0.height.equalTo(15)
        }
        
        divisionLine.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(0.2)
        }
        
        secessionButton.snp.makeConstraints {
            $0.height.equalTo(15)
        }
        
        logoutStackView.snp.makeConstraints {
            $0.centerX.centerY.equalTo(logoutView)
            $0.leading.equalTo(logoutView.snp.leading).offset(22)
            $0.top.equalTo(logoutView.snp.top).offset(26)
        }
        
        couponBoxButton.snp.makeConstraints {
            $0.leading.equalTo(couponBoxView.snp.leading).offset(22)
            $0.centerY.equalTo(couponBoxView.snp.centerY).offset(19)
            $0.width.equalTo(34)
        }
        
        couponBoxView.snp.makeConstraints {
            $0.height.equalTo(54)
        }
        
        MEView.snp.makeConstraints {
            $0.height.equalTo(54)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.centerX.equalToSuperview().inset(20)
        }
        
    }
    
    @objc func checkButtonTapped() {
        dismiss(animated: true)
    }
    
}
