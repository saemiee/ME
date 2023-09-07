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
    private let detailView = TagDetailView()
    
    var tag: Tag?
    
    override func loadView() {
        view = detailView
    }
    
    // MARK: - Life Cycel
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
