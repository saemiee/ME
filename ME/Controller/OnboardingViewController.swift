//
//  OnboardingViewController.swift
//  ME
//
//  Created by 새미 on 2023/08/10.
//

import UIKit
import SnapKit
import Then

final class OnboardingViewController: UIViewController {
    
    // MARK: - Properties
    private let onboardingView1 = Onboarding1()
    private let onboardingView2 = Onboarding2()
    private let onboardingView3 = Onboarding3()
    private let onboardingView4 = Onboarding4()
    
    lazy var onboardingView = [onboardingView1, onboardingView2, onboardingView3, onboardingView4]
    
    lazy var pageControl = UIPageControl().then {
        $0.currentPage = 0
        $0.isHidden = false
        $0.numberOfPages = onboardingView.count
        $0.pageIndicatorTintColor = .lightGray
        $0.currentPageIndicatorTintColor = .white
    }
    
    private lazy var scrollView = UIScrollView(frame: view.bounds).then {
        $0.contentSize = CGSize(width: UIScreen.main.bounds.width * CGFloat(onboardingView.count), height: UIScreen.main.bounds.height)
        $0.alwaysBounceVertical = false
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = true
        $0.isPagingEnabled = true
        $0.bounces = false
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        setupUI()
    }
    
    // MARK: - UI Settings
    private func setupUI() {
        addContentScrollView()
        [scrollView, pageControl].forEach { self.view.addSubview($0) }
        setLayout()
    }
    
    // MARK: - Layout
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.bottom.left.trailing.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.bottom.equalToSuperview().inset(108)
        }
    }
    
    // MARK: - Add Content
    private func addContentScrollView() {
        for i in 0..<4 {
            let view = onboardingView[i]
            view.frame = UIScreen.main.bounds
            view.frame.origin.x = UIScreen.main.bounds.width * CGFloat(i)
            scrollView.addSubview(view)
        }
    }
    
}

// MARK: - UIScrollViewDelegate Extension
extension OnboardingViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(Float(scrollView.contentOffset.x / UIScreen.main.bounds.width))
    }
}
