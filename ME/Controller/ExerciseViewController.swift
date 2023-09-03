//
//  ExerciseViewController.swift
//  ME
//
//  Created by 새미 on 2023/08/10.
//

import UIKit
import SnapKit
import Then

final class ExerciseViewController: UIViewController {
    
    // MARK: - Properties
    private let flowLayout = UICollectionViewFlowLayout().then {
      $0.scrollDirection = .vertical
      $0.minimumLineSpacing = 18.0
      $0.minimumInteritemSpacing = 0
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout).then {
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = true
        $0.scrollIndicatorInsets = UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 4)
        $0.contentInset = .zero
        $0.backgroundColor = .clear
        $0.clipsToBounds = true
        $0.backgroundColor = .background
    }
    
    var exerciseList: [Exercise] = []
    
    var exerciseDataManager = ExerciseDataManager()
    
    private let mainLabel = UILabel().then {
        $0.text = "오늘도 운동으로 활기찬 하루를 보내보세요 !"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        setupNavBar()
        setupCollectionView()
        setDatas()
        addView()
        setupLayout()
    }
    
    // MARK: - Navigation Bar Setting
    func setupNavBar() {
        title = "운동"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        appearance.shadowColor = .clear
        
        navigationController?.navigationBar.tintColor = .lightOrange
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    // MARK: - Collection Setting
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(ExerciseCollectionViewCell.self, forCellWithReuseIdentifier: Cell.exerciseCellIdentifier)
    }

    // MARK: - Data Setting
    func setDatas() {
        exerciseDataManager.makeExerciseData()
        exerciseList = exerciseDataManager.getExerciseData()
    }
    
    // MARK: - Add View
    func addView() {
        view.addSubview(mainLabel)
        view.addSubview(collectionView)
    }

    // MARK: - Layout
    func setupLayout() {
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(15)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(self.mainLabel.snp.bottom).offset(33)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
    }

}

// MARK: - UICollectionView DataSource Extension
extension ExerciseViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.exerciseList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.exerciseCellIdentifier, for: indexPath) as! ExerciseCollectionViewCell
        
        cell.exerciseImage.image = exerciseList[indexPath.row].exerciseImage
        cell.exerciseLabel.text = exerciseList[indexPath.row].exercise
        cell.kcalLabel.text = "\(exerciseList[indexPath.row].kcal) Kcal"
        cell.pointLabel.text = " \(exerciseList[indexPath.row].point) p"

        return cell
    }
}

// MARK: - UICollextionView Extension
extension ExerciseViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: exerciseCell.cellWidth, height: exerciseCell.cellHeith)
  }
}


