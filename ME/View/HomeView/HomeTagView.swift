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
    
    let tagImageView2 = UIImageView().then {
        $0.image = UIImage(named: "pool")
    }
    
    let tagLabel2 = UILabel().then {
        $0.text = "수영왕"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    
    let tagImageView3 = UIImageView().then {
        $0.image = UIImage(named: "rerb")
    }
    
    let tagLabel3 = UILabel().then {
        $0.text = "자연인"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    
    lazy var stackView = UIStackView().then {
        $0.spacing = 20
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .center
    }
    
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
        [tagImageView1, tagImageView2, tagImageView3].forEach { stackView.addArrangedSubview($0) }
        
        tagImageView1.addSubview(tagLabel1)
        tagImageView2.addSubview(tagLabel2)
        tagImageView3.addSubview(tagLabel3)
        
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
        tagLabel1.snp.makeConstraints {
            $0.centerX.equalTo(tagImageView1.snp.centerX)
            $0.bottom.equalTo(tagImageView1.snp.bottom)
        }
        
        tagLabel2.snp.makeConstraints {
            $0.centerX.equalTo(tagImageView2.snp.centerX)
            $0.bottom.equalTo(tagImageView2.snp.bottom)
        }
        
        tagLabel3.snp.makeConstraints {
            $0.centerX.equalTo(tagImageView3.snp.centerX)
            $0.bottom.equalTo(tagImageView3.snp.bottom)
        }
        
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().inset(20)
        }
    }
}
