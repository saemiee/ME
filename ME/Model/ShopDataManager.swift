//
//  ShopDataManager.swift
//  ME
//
//  Created by 새미 on 2023/08/27.
//

import UIKit

final class ShopDataManager {
    
    private var shopDataArray: [Shop] = []
    
    func makeShopData() {
        shopDataArray = [
            Shop(productImage: UIImage(named: "iceBox"), brandName: "스타벅스", productName: "아이스 아메리카노 T", price: 1),
            Shop(productImage: UIImage(named: "iceBox"), brandName: "스타벅스", productName: "아이스 카페 라떼 T", price: 1),
            Shop(productImage: UIImage(named: "iceBox"), brandName: "스타벅스", productName: "아이스 카라멜 마키아또 T", price: 1),
            Shop(productImage: UIImage(named: "coldBrew"), brandName: "스타벅스", productName: "아이스 콜드 브루 T", price: 1),
            Shop(productImage: UIImage(named: "iceBox"), brandName: "스타벅스", productName: "아이스 돌체라떼 T", price: 1),
            Shop(productImage: UIImage(named: "iceBox"), brandName: "스타벅스", productName: "자몽 허니 블랙 티 T", price: 1),
            Shop(productImage: UIImage(named: "strawberryChocolate"), brandName: "투썸플레이스", productName: "스트로베리 초콜릿 생크림", price: 1),
            Shop(productImage: UIImage(named: "iceBox"), brandName: "투썸플레이스", productName: "떠먹는 아이스박스", price: 1),
            Shop(productImage: UIImage(named: "baskinRobbinsPint"), brandName: "베스킨라빈스", productName: "파인트 아이스크림", price: 1),
            Shop(productImage: UIImage(named: "injeolmiSulbing"), brandName: "설빙", productName: "인절미설빙", price: 1),
            Shop(productImage: UIImage(named: "cyBurgerSet"), brandName: "맘스터치", productName: "싸이버거 세트", price: 1),
            Shop(productImage: UIImage(named: "gs25"), brandName: "GS25", productName: "모바일 상품권 5,000", price: 1),
            Shop(productImage: UIImage(named: "cu"), brandName: "CU", productName: "모바일 상품권 5,000", price: 1),
            Shop(productImage: UIImage(named: "redRepperChicken"), brandName: "굽네치킨", productName: "고추바사삭 + 콜라 1.25L", price: 1),
            Shop(productImage: UIImage(named: "goldenOlive"), brandName: "BBQ", productName: "황금올리브 + 콜라 1.25L", price: 1),
            Shop(productImage: UIImage(named: "honeyCombo"), brandName: "교촌치킨", productName: "허니콤보 + 콜라 1.25L", price: 1)
        ]
    }
    
    // MARK: - Get Exercise Data
    func getShopData() -> [Shop] {
        return shopDataArray
    }
    
}
