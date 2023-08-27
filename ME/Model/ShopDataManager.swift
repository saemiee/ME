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
            Shop(brandName: "스타벅스", productName: "아이스 아메리카노 T", price: 1),
            Shop(brandName: "스타벅스", productName: "아이스 카페 아메리카노 T", price: 1)
            
        ]
    }
    
}
