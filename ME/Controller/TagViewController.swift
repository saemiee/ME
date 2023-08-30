//
//  TagViewController.swift
//  ME
//
//  Created by 새미 on 2023/08/14.
//

import UIKit

final class TagViewController: UIViewController {
    
    // MARK: - Properties
    private let mainLabel = UILabel().then {
        $0.text = "다양한 태그를 수집해 보세요"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        setupNavBar()
        addView()
        setupLayout()
    }

    // MARK: - Navigation Bar Setting
    func setupNavBar() {
        title = "태그"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        appearance.shadowColor = .clear
        
        navigationController?.navigationBar.tintColor = .lightOrange
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    // MARK: - Add View
    func addView() {
        view.addSubview(mainLabel)
    }

    // MARK: - Layout
    func setupLayout() {
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(15)
        }
    }

}
