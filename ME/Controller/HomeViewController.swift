//
//  HomeViewController.swift
//  ME
//
//  Created by 새미 on 2023/08/15.
//

import UIKit
import SnapKit
import Then

final class HomeViewController: UIViewController {
    
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
    
    private let exercisesMore = UIButton().then {
        $0.setTitle("더보기", for: .normal)
        $0.setTitleColor(.lightOrange, for: .normal)
        $0.backgroundColor = .clear
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        $0.addTarget(self, action: #selector(exerciseMoreTappend), for: .touchUpInside)
    }
    
    private let tagLabel = UILabel().then {
        $0.text = "태그"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    private let tagMore = UIButton().then {
        $0.setTitle("더보기", for: .normal)
        $0.setTitleColor(.lightOrange, for: .normal)
        $0.backgroundColor = .clear
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        $0.addTarget(self, action: #selector(tagMoreTapped), for: .touchUpInside)
    }
    
    private let exerciseCardView = ExerciseCardView()
    
    private let tagView = HomeTagView()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addView()
        setLayout()
    }
    
    // MARK: - Setting
    private func setup() {
        view.backgroundColor = .background
        
        let myButton = MyButton()
        myButton.addTarget(self, action: #selector(myTapped), for: .touchUpInside)
    
        let customBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: myButton)
        
        navigationItem.rightBarButtonItem = customBarButtonItem
    }
    
    // MARK: - Add View
    private func addView() {
        [myLabel, myView, exercisesLabel, exercisesMore, exerciseCardView, tagLabel, tagMore, tagView].forEach { view.addSubview($0) }
    }
    
    // MARK: - Layout
    private func setLayout() {
        myLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(164)
            $0.leading.equalToSuperview().inset(28)
            $0.height.equalTo(24)
        }
        
        myView.snp.makeConstraints {
            $0.top.equalTo(myLabel.snp.bottom).offset(14)
            $0.height.equalTo(170)
            $0.leading.trailing.equalToSuperview().inset(28)
        }
        
        exercisesLabel.snp.makeConstraints {
            $0.top.equalTo(myView.snp.bottom).offset(36)
            $0.leading.equalToSuperview().inset(28)
            $0.height.equalTo(24)
        }
        
        exercisesMore.snp.makeConstraints {
            $0.top.equalTo(myView.snp.bottom).offset(34)
            $0.trailing.equalToSuperview().inset(28)
        }
        
        exerciseCardView.snp.makeConstraints {
            $0.top.equalTo(exercisesLabel.snp.bottom).offset(14)
            $0.height.equalTo(140)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().inset(28)
        }
        
        tagLabel.snp.makeConstraints {
            $0.top.equalTo(exerciseCardView.snp.bottom).offset(36)
            $0.leading.equalToSuperview().inset(28)
            $0.height.equalTo(24)
        }
        
        tagMore.snp.makeConstraints {
            $0.top.equalTo(exerciseCardView.snp.bottom).offset(34)
            $0.trailing.equalToSuperview().inset(28)
        }
        
        tagView.snp.makeConstraints {
            $0.top.equalTo(tagLabel.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().inset(28)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-10)
        }
    }
    
    // MARK: - MyButton Action
    @objc func myTapped() {
        let myVC = MyViewController()
        myVC.modalPresentationStyle = .automatic
        present(myVC, animated: true)
    }
    
    // MARK: - MoreButton Action
    @objc func exerciseMoreTappend() {
        let exerciseVC = ExerciseViewController()
        navigationController?.pushViewController(exerciseVC, animated: true)
    }
    
    // MARK: - TagButton Action
    @objc func tagMoreTapped() {
        let tagVC = TagViewController()
        navigationController?.pushViewController(tagVC, animated: true)
    }
}
