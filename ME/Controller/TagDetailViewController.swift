//
//  TagDetailViewController.swift
//  ME
//
//  Created by 새미 on 2023/09/07.
//

import UIKit
import SnapKit
import Then

final class TagDetailViewController: UIViewController {

    // MARK: - Properties
    let tagLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 31, weight: .bold)
    }
    
    // MARK: - Life Cycel
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
