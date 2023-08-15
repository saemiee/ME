//
//  AccessGuideView.swift
//  ME
//
//  Created by 새미 on 2023/08/15.
//

import UIKit
import SnapKit
import Then

final class AccessGuideView: UIView {
    
    // MARK: - Properties
    private let mainLabel = UILabel().then {
        $0.text = "앱 접근 권한 안내"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 24, weight: .medium)
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "편리한 ME 사용을 위해 다음 권한의\n허용이 필요합니다."
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.numberOfLines = 2
    }
    
    private let lineView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let okButton = UIButton().then {
        $0.backgroundColor = .yellow
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
