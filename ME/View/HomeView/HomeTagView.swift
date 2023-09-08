//
//  MainTagView.swift
//  ME
//
//  Created by 새미 on 2023/08/23.
//

import UIKit
import SnapKit
import Then

final class HomeTagView: UIView {

    // MARK: - Properties
    let tagImageView1 = UIImageView().then {
        $0.image = UIImage(named: "welcome")
    }
    
    let tagLabel1 = UILabel().then {
        $0.text = "WELCOME"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    
    lazy var tag1StackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .center
    }
    
    let tagImageView2 = UIImageView().then {
        $0.image = UIImage(named: "pool")
    }
    
    let tagLabel2 = UILabel().then {
        $0.text = "수영왕"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    
    lazy var tag2StackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .center
    }
    
    let tagImageView3 = UIImageView().then {
        $0.image = UIImage(named: "rerb")
    }
    
    let tagLabel3 = UILabel().then {
        $0.text = "자연인"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    
    lazy var tag3StackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .center
    }
    
    lazy var stackView = UIStackView().then {
        $0.spacing = 32
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .center
    }
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Add View
    private func addView() {
        [tagImageView1,tagLabel1].forEach { tag1StackView.addArrangedSubview($0) }
        [tagImageView2,tagLabel2].forEach { tag2StackView.addArrangedSubview($0) }
        [tagImageView3,tagLabel3].forEach { tag3StackView.addArrangedSubview($0) }
        
        [tag1StackView,tag2StackView, tag3StackView].forEach { stackView.addArrangedSubview($0) }
        
        self.addSubview(stackView)
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = .gray
        
        layer.cornerRadius = 7
        layer.masksToBounds = true
        
        addView()
        setLayout()
    }
    
    private func setLayout() {
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(26)
            $0.top.equalToSuperview().inset(4)
            $0.bottom.equalToSuperview().inset(14)
        }
    }
}
