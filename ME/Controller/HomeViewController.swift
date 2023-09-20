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
    
    lazy var exerciseCardView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let exerciseCard1 = ExerciseCard()
    private let exerciseCard2 = ExerciseCard()
    private let exerciseCard3 = ExerciseCard()
    private let exerciseCard4 = ExerciseCard()
    
    private let tagView = HomeTagView()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        setNavigationButton()
        addView()
        setLayout()
    }
    
    // MARK: - Setting NavigationItem
    private func setNavigationButton() {
        let myButton = MyButton(target: self, action: #selector(myTapped))
        
        navigationItem.rightBarButtonItem = myButton
    }
    
    // MARK: - Add View
    private func addView() {
        [exerciseCard1, exerciseCard2, exerciseCard3, exerciseCard4].forEach { self.exerciseCardView.addSubview($0)}
        [myLabel, myView, exercisesLabel, exercisesMore, exerciseCardView, tagLabel, tagMore, tagView].forEach { view.addSubview($0) }
    }
    
    // MARK: - Layout
    private func setLayout() {
        myLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(164)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(24)
        }
        
        myView.snp.makeConstraints {
            $0.top.equalTo(myLabel.snp.bottom).offset(9)
            $0.bottom.equalToSuperview().inset(488)
            $0.leading.trailing.equalToSuperview().inset(22)
        }
        
        exercisesLabel.snp.makeConstraints {
            $0.top.equalTo(myView.snp.bottom).offset(34)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(24)
        }
        
        exercisesMore.snp.makeConstraints {
            $0.top.equalTo(myView.snp.bottom).offset(34)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        exerciseCard1.snp.makeConstraints {
            $0.width.equalTo(164)
            $0.height.equalTo(67)
            $0.leading.equalTo(exerciseCardView.snp.leading)
            $0.top.equalTo(exerciseCardView.snp.top)
        }
        
        exerciseCard2.snp.makeConstraints {
            $0.width.equalTo(164)
            $0.height.equalTo(67)
            $0.trailing.equalTo(exerciseCardView.snp.trailing)
            $0.top.equalTo(exerciseCardView.snp.top)
        }
        
        exerciseCard3.snp.makeConstraints {
            $0.width.equalTo(164)
            $0.height.equalTo(67)
            $0.leading.equalTo(exerciseCardView.snp.leading)
            $0.bottom.equalTo(exerciseCardView.snp.bottom)
        }
        
        exerciseCard4.snp.makeConstraints {
            $0.width.equalTo(164)
            $0.height.equalTo(67)
            $0.trailing.equalTo(exerciseCardView.snp.trailing)
            $0.bottom.equalTo(exerciseCardView.snp.bottom)
        }
        
        exerciseCardView.snp.makeConstraints {
            $0.top.equalTo(exercisesLabel.snp.bottom).offset(9)
            $0.bottom.equalToSuperview().inset(276)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().inset(26)
        }
        
        tagLabel.snp.makeConstraints {
            $0.top.equalTo(exerciseCardView.snp.bottom).offset(34)
            $0.leading.equalToSuperview().inset(20)
        }
        
        tagMore.snp.makeConstraints {
            $0.top.equalTo(exerciseCardView.snp.bottom).offset(34)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        tagView.snp.makeConstraints {
            $0.top.equalTo(tagLabel.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(107)
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



