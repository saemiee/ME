//
//  ExerciseTableViewCell.swift
//  ME
//
//  Created by 새미 on 2023/08/10.
//

import UIKit
import SnapKit
import Then

final class ExerciseTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    lazy var exerciseImage = UIImageView()
    
    lazy var exerciseLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    

}
