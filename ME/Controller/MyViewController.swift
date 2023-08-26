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
    private let setting = UIImageView().then {
        $0.image = UIImage(systemName: "person.crop.circle")
        $0.tintColor = .yellow
        $0.isUserInteractionEnabled = true
    }
    
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
        $0.isUserInteractionEnabled = true
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
        $0.isUserInteractionEnabled = true
    }
    
    lazy var exerciseCardView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let exerciseCard1 = ExerciseCard()
    private let exerciseCard2 = ExerciseCard()
    private let exerciseCard3 = ExerciseCard()
    private let exerciseCard4 = ExerciseCard()
    
    private let tagView = MainTagView()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        addView()
        setLayout()
        setupTapGestures()
    }
    
    // MARK: - Add View
    private func addView() {
        [exerciseCard1, exerciseCard2, exerciseCard3, exerciseCard4].forEach { self.exerciseCardView.addSubview($0)}
        [setting, myLabel, myView, exercisesLabel, exercisesMore, exerciseCardView, tagLabel, tagMore, tagView].forEach { view.addSubview($0) }
    }
    
    // MARK: - Layout
    private func setLayout() {
        setting.snp.makeConstraints {
            $0.width.height.equalTo(34)
            $0.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().inset(130)
        }
        
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
        
        exerciseCard1.snp.makeConstraints {
            $0.width.equalTo(160)
            $0.height.equalTo(67)
            $0.leading.equalTo(exerciseCardView.snp.leading)
            $0.top.equalTo(exerciseCardView.snp.top)
        }
        
        exerciseCard2.snp.makeConstraints {
            $0.width.equalTo(160)
            $0.height.equalTo(67)
            $0.trailing.equalTo(exerciseCardView.snp.trailing)
            $0.top.equalTo(exerciseCardView.snp.top)
        }
        
        exerciseCard3.snp.makeConstraints {
            $0.width.equalTo(160)
            $0.height.equalTo(67)
            $0.leading.equalTo(exerciseCardView.snp.leading)
            $0.bottom.equalTo(exerciseCardView.snp.bottom)
        }
        
        exerciseCard4.snp.makeConstraints {
            $0.width.equalTo(160)
            $0.height.equalTo(67)
            $0.trailing.equalTo(exerciseCardView.snp.trailing)
            $0.bottom.equalTo(exerciseCardView.snp.bottom)
        }
        
        exerciseCardView.snp.makeConstraints {
            $0.top.equalTo(exercisesLabel.snp.bottom).offset(9)
            $0.bottom.equalToSuperview().inset(276)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().inset(30)
        }
        
        tagLabel.snp.makeConstraints {
            $0.top.equalTo(exerciseCardView.snp.bottom).offset(34)
            $0.leading.equalToSuperview().inset(30)
        }
        
        tagMore.snp.makeConstraints {
            $0.top.equalTo(exerciseCardView.snp.bottom).offset(34)
            $0.trailing.equalToSuperview().inset(30)
        }
        
        tagView.snp.makeConstraints {
            $0.top.equalTo(tagLabel.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().inset(30)
            $0.height.equalTo(107)
        }
    }
    
    // MARK: - Tab Gestures
    private func setupTapGestures() {
        let exerciseGesture = UITapGestureRecognizer(target: self, action: #selector(exerciseMoreTapped(_:)))
        exercisesMore.addGestureRecognizer(exerciseGesture)
        
        let tagGesture = UITapGestureRecognizer(target: self, action: #selector(tagMoreTapped(_:)))
        tagMore.addGestureRecognizer(tagGesture)
        
        let setGesture = UITapGestureRecognizer(target: self, action: #selector(settingTapped(_:)))
        setting.addGestureRecognizer(setGesture)
    }
    
    @objc func exerciseMoreTapped(_ sender: UITapGestureRecognizer) {
        let exerciseVC = ExerciseViewController()
        navigationController?.pushViewController(exerciseVC, animated: true)
    }
    
    @objc func tagMoreTapped(_ sender: UITapGestureRecognizer) {
        let tagVC = TagViewController()
        navigationController?.pushViewController(tagVC, animated: true)
    }
    
    @objc func settingTapped(_ sender: UITapGestureRecognizer) {
        let setVC = SettingViewController()
        setVC.modalPresentationStyle = .automatic
        present(setVC, animated: true)
    }
}



