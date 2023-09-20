//
//  Constants.swift
//  ME
//
//  Created by 새미 on 2023/09/03.
//

import Foundation

// MARK: - Name Space
public enum Cell {
    static let exerciseCellIdentifier = "ExerciseCell"
    static let shopCellIdentifier = "ShopCell"
    static let tagCellIdentifier = "TagCell"
}

// MARK: - Cell
public enum exerciseCell {
    static let cellWidth: CGFloat = 350
    static let cellHeith: CGFloat = 66
}

public enum shopCell {
    static let lineSpacing: CGFloat = 16
    static let interitemSpacing: CGFloat = 18
    static let cellHeight: CGFloat = 267
    static let cellWidth: CGFloat = 166
}

public enum tagCell {
    static let lineSpacing: CGFloat = 41
    static let interitemSpacing: CGFloat = 13
    static let cellHeight: CGFloat = 99
    static let cellColumns: CGFloat = 3
}


