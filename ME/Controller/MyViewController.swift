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
    let barHeight: CGFloat = 100

    let displayWidth: CGFloat = 390
    let displayHeight: CGFloat = 755

    lazy var tableView =  UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight), style: .insetGrouped).then {
        $0.backgroundColor = .background
    }
    
    let sections = ["계정 관리", "쿠폰함", "앱 소개"]
    let memberItems = ["로그아웃", "탈퇴하기"]
    let couponBoxItem = ["쿠폰함"]
    let MEIntroductionItem = ["ME"]
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

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        setupTableView()
        addView()
        setupLayout()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyPageCell")
    }
    
    // MARK: - Add View
    func addView() {
        [titleLabel, checkButton, tableView].forEach { view.addSubview($0) }
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
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Cell Tapped
    func logoutCellTapped() {
        // 로그아웃
    }
    
    func membershipWithdrawalCellTapped() {
        // 회원탈퇴
    }
    
    func couponBoxCellTapped() {
        let couponVC = CouponBoxViewController()
        navigationController?.pushViewController(couponVC, animated: true)
    }
    
    func meCellTapped() {
        let meVC = MEViewController()
        navigationController?.pushViewController(meVC, animated: true)
    }
    
    // MARK: - Button Action
    @objc func checkButtonTapped() {
        dismiss(animated: true)
    }

}

// MARK: - MyViewController Extension
extension MyViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if memberItems[indexPath.row] == "로그아웃" {
                logoutCellTapped()
            } else if memberItems[indexPath.row] == "탈퇴하기" {
                membershipWithdrawalCellTapped()
            }
        } else if indexPath.section == 1 {
            couponBoxCellTapped()
        } else if indexPath.section == 2 {
            meCellTapped()
        } else {
            return
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .darkGray
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return memberItems.count
        } else if section == 1 {
            return couponBoxItem.count
        } else if section == 2 {
            return MEIntroductionItem.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageCell", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "\(memberItems[indexPath.row])"
            cell.textLabel?.textColor = .white
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "\(couponBoxItem[indexPath.row])"
            cell.textLabel?.textColor = .white
        } else if indexPath.section == 2 {
            cell.textLabel?.text = "\(MEIntroductionItem[indexPath.row])"
            cell.textLabel?.textColor = .white
        } else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
    

    
