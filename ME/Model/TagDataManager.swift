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
            Tag(tagImage: UIImage(named: "pool"), tagName: "수영왕"),
            Tag(tagImage: UIImage(named: "pool"), tagName: "수영왕"),
            Tag(tagImage: UIImage(named: "pool"), tagName: "수영왕"),
            Tag(tagImage: UIImage(named: "pool"), tagName: "수영왕"),
            Tag(tagImage: UIImage(named: "pool"), tagName: "수영왕"),
            Tag(tagImage: UIImage(named: "pool"), tagName: "수영왕"),
            Tag(tagImage: UIImage(named: "pool"), tagName: "수영왕"),
            Tag(tagImage: UIImage(named: "pool"), tagName: "수영왕"),
            Tag(tagImage: UIImage(named: "pool"), tagName: "수영왕"),
            Tag(tagImage: UIImage(named: "pool"), tagName: "수영왕"),
            Tag(tagImage: UIImage(named: "pool"), tagName: "수영왕"),
            Tag(tagImage: UIImage(named: "pool"), tagName: "수영왕")
        ]
    }
    
    // MARK: - Get Exercise Data
    func getTagData() -> [Tag] {
        return tagDataArray
    }
    
}

