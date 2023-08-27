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
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    }
    
    private let checkButton = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(UIColor.yellow, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.backgroundColor = .clear
        $0.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
    }
    
    private lazy var tableView = UITableView()

    // MARK: - Life Cycl
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        addView()
        setupLayout()
    }
    
    // MARK: - Add View
    func addView() {
        [titleLabel, checkButton].forEach { view.addSubview($0) }
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
    }
    
    @objc func checkButtonTapped() {
        dismiss(animated: true)
    }
    
}
