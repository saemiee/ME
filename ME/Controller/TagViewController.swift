//
//  TagViewController.swift
//  ME
//
//  Created by 새미 on 2023/08/14.
//

import UIKit

final class TagViewController: UIViewController {
    
    // MARK: - Properties
    var tagList: [Tag] = []
    
    var tagDataManager = TagDataManager()
    
    private let mainLabel = UILabel().then {
        $0.text = "다양한 태그를 수집해 보세요"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init()).then {
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = true
        $0.backgroundColor = .clear
        $0.clipsToBounds = true
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
        title = "태그"
        
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
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        collectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: Cell.tagCellIdentifier)
    }

    // MARK: - Data Setting
    func setDatas() {
        tagDataManager.makeTagData()
        tagList = tagDataManager.getTagData()
    }
    
    // MARK: - Add View
    func addView() {
        [mainLabel, collectionView].forEach { view.addSubview($0) }
    }

    // MARK: - Layout
    func setupLayout() {
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(15)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(self.mainLabel.snp.bottom).offset(16)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(33)
        }
    }

}

// MARK: - TagViewController Extension
extension TagViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.tagCellIdentifier, for: indexPath) as! TagCollectionViewCell
        
        cell.tagImage.image = tagList[indexPath.row].tagImage
        cell.tagLabel.text = tagList[indexPath.row].tagName
    
        return cell
    }
}

extension TagViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return tagCell.lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return tagCell.interitemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.collectionView.bounds.width - tagCell.interitemSpacing * (tagCell.cellColumns - 1)) / tagCell.cellColumns
        let height = tagCell.cellHeight
        
        let size = CGSize(width: width, height: height)
        return size
    }
}
