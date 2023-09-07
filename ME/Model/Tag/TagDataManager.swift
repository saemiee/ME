//
//  TagDataManager.swift
//  ME
//
//  Created by 새미 on 2023/08/31.
//

import UIKit

final class TagDataManager {
    
    private var tagDataArray: [Tag] = []
    
    func makeTagData() {
        tagDataArray = [
            Tag(tagImage: UIImage(named: "welcome"), tagName: "WELCOME!",tagDescription: ""),
            Tag(tagImage: UIImage(named: "pool"), tagName: "수영왕",tagDescription: ""),
            Tag(tagImage: UIImage(named: "dancing"), tagName: "댄싱머신",tagDescription: ""),
            Tag(tagImage: UIImage(named: "creditCard"), tagName: "결제담당", tagDescription: ""),
            Tag(tagImage: UIImage(named: "rerb"), tagName: "자연인", tagDescription: ""),
            Tag(tagImage: UIImage(named: "run"), tagName: "리틀 우사인볼트", tagDescription: ""),
            Tag(tagImage: UIImage(named: "chocolate"), tagName: "초콜릿 복근", tagDescription: ""),
            Tag(tagImage: UIImage(named: "pilates"), tagName: "바른자세", tagDescription: ""),
            Tag(tagImage: UIImage(named: "personBiking"), tagName: "Best 라이더", tagDescription: ""),
            Tag(tagImage: UIImage(named: "biceps"), tagName: "근력 UP", tagDescription: ""),
            Tag(tagImage: UIImage(named: "rowing"), tagName: "Boat", tagDescription: ""),
            Tag(tagImage: UIImage(named: "trophy"), tagName: "GOAT", tagDescription: "")
        ]
    }
    
    // MARK: - Get Exercise Data
    func getTagData() -> [Tag] {
        return tagDataArray
    }
    
}

