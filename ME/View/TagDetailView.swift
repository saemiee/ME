//
//  TagDetailView.swift
//  ME
//
//  Created by 새미 on 2023/09/07.
//

import UIKit
import SnapKit
import Then

final class TagDetailView: UIView {
    
    var tagItem: Tag? {
        didSet {
            guard var tagItem = tagItem else { return }
            tagLabel.text = tagItem.tagName
            tagDescription.text = tagItem.tagDescription
            tagImage.image = tagItem.tagImage
        }
    }
    
    let tagLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 31, weight: .bold)
    }
    
    let tagDescription = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    let tagImage = UIImageView()
    
    let checkButton = UIButton().then {
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        $0.backgroundColor = .yellow
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
        [tagLabel, tagDescription, tagImage, checkButton].forEach { self.addSubview($0) }
    }
    
    // MARK: - Layout
    private func setLayout() {
        tagLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(123)
            $0.centerX.equalToSuperview()
        }
        
        tagDescription.snp.makeConstraints {
            $0.top.equalTo(tagLabel.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
        }
        
        tagImage.snp.makeConstraints {
            $0.top.equalTo(tagDescription.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
        }
        
        checkButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(57)
            $0.bottom.equalToSuperview().inset(57)
        }
    }
}
