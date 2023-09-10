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
    
    // MARK: - Properties
    var tagItem: Tag? {
        didSet {
            guard var tagItem = tagItem else { return }
            tagLabel.text = tagItem.tagName
            tagDescription.text = tagItem.tagDescription
            tagImage.image = tagItem.tagImage
        }
    }
    
    let background = UIView().then {
        $0.backgroundColor = .clear
    }
    
    let tagLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 31, weight: .bold)
    }
    
    let tagDescription = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.setLineSpacing(spacing: 10)
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
        [background, tagLabel, tagDescription, tagImage, checkButton].forEach { self.addSubview($0) }
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let blurEffect = UIBlurEffect(style: .dark)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = self.frame
        self.background.addSubview(visualEffectView)
    }
    
    private func setLayout() {
        background.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        tagLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(123)
            $0.centerX.equalToSuperview()
        }
        
        tagDescription.snp.makeConstraints {
            $0.top.equalTo(tagLabel.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
        }
        
        tagImage.snp.makeConstraints {
            $0.top.equalTo(tagDescription.snp.bottom)
            $0.bottom.equalTo(checkButton.snp.top).offset(-148)
            $0.leading.trailing.equalToSuperview()
        }
        
        checkButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(57)
            $0.bottom.equalToSuperview().inset(57)
        }
    }
}
