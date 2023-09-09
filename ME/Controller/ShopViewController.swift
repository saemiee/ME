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
        return shopDataManager.getShopData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.shopCellIdentifier, for: indexPath) as! ShopCollectionViewCell
        
        cell.productImage.image = shopDataManager.getShopData()[indexPath.row].productImage
        cell.brandNameLabel.text = shopDataManager.getShopData()[indexPath.row].brandName
        cell.productLabel.text = shopDataManager.getShopData()[indexPath.row].productName
        cell.priceLabel.text = "\(shopDataManager.getShopData()[indexPath.row].price) p"
    
        return cell
    }
}

extension ShopViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return shopCell.lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return shopCell.interitemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = shopCell.cellWidth
        let height = shopCell.cellHeight
        
        let size = CGSize(width: width, height: height)
        return size
    }

}

extension ShopViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = ShopDetailViewController()
        let currentItem = shopDataManager.getShopData()[indexPath.row]
        
        detailVC.product = currentItem
        
        detailVC.modalPresentationStyle = .fullScreen
        present(detailVC, animated: true)
    }
}
