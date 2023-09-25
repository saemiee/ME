//
//  TagViewModel.swift
//  ME
//
//  Created by 새미 on 2023/09/20.
//

import UIKit

final class TagViewModel {
    
    let dataManager: TagDataManager
    
    private var tagsList: [Tag] {
        return dataManager.getTagData()
    }
    
    init(dataManager: TagDataManager) {
        self.dataManager = dataManager
    }
}
