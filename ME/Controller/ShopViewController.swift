//
//  ShopViewController.swift
//  ME
//
//  Created by 새미 on 2023/08/15.
//

import UIKit
import SnapKit
import Then

final class ShopViewController: UIViewController {
    
    // MARK: - Properties
    var productList: [Shop] = []
    
    var shopDataManager = ShopDataManager()
    
    private let mainLabel = UILabel().then {
        $0.text = "포인트를 다양한 기프티콘으로 교환해 보세요."
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
    
    // MARK: - Life Cycel
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        setupLayout()
        setupCollectionView()
        setDatas()
    }
    
    // MARK: - Collection Setting
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        collectionView.register(ShopCollectionViewCell.self, forCellWithReuseIdentifier: Cell.shopCellIdentifier)
    }

    // MARK: - Data Setting
    func setDatas() {
        shopDataManager.makeShopData()
        productList = shopDataManager.getShopData()
    }
    
    // MARK: - Add View
    private func addView() {
        [mainLabel, collectionView].forEach { view.addSubview($0) }
    }
    
    // MARK: - Layout
    private func setupLayout() {
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(6)
            $0.leading.equalToSuperview().inset(15)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(self.mainLabel.snp.bottom).offset(16)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
}

// MARK: - ShopViewController Exension
extension ShopViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.shopCellIdentifier, for: indexPath) as! ShopCollectionViewCell
        
        cell.productImage.image = productList[indexPath.row].productImage
        cell.brandNameLabel.text = productList[indexPath.row].brandName
        cell.productLabel.text = productList[indexPath.row].productName
        cell.priceLabel.text = "\(productList[indexPath.row].price) p"
    
        return cell
    }
}

extension ShopViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 166
        let height = 267
        
        let size = CGSize(width: width, height: height)
        return size
    }

}
