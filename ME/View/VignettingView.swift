//
//  VignettingView.swift
//  ME
//
//  Created by 새미 on 2023/09/20.
//

import UIKit
import SwiftUI
import SnapKit

struct ContentView: View {
        
    var body: some View {
        Rectangle()
            .padding()
            .blur(radius: 50, opaque: false)
    }
}

final class VignettingView: UIView {
    
    let backgroundView = UIHostingController(rootView: ContentView())

    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = .gray
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        
        backgroundView.view.backgroundColor = .clear
        
        addSubview(backgroundView.view)
        
        backgroundView.view.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 86, height: 86))
            $0.center.equalToSuperview()
        }
    }
    
}
