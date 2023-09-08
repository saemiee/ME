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
    
    var tagItem: Tag?
    
    override func loadView() {
        view = detailView
    }
    
    // MARK: - Life Cycel
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
        setupButtonAction()
    }
    
    // MARK: - Data Setting
    private func setData() {
        detailView.tagItem = tagItem
    }
    
    // MARK: - Button Action
    func setupButtonAction() {
        detailView.checkButton.addTarget(self, action: #selector(chekButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - check Button Tapped
    @objc func chekButtonTapped() {
        dismiss(animated: true)
        print("Tapped")
    }
}
