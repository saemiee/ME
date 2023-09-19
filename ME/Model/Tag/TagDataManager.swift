//
//  TagDataManager.swift
//  ME
//
//  Created by 새미 on 2023/08/31.
//

import UIKit

final class TagDataManager {
    
    private var tagDataArray: [Tag] = []
    
    func makeTagData() {
        tagDataArray = [
            Tag(tagImage: UIImage(named: "welcome"), tagName: "WELCOME!",tagDescription: "ME에 오신걸 환영해요.\n앞으로 ME와 함께 건강한 삶을 만들어가요!"),
            Tag(tagImage: UIImage(named: "pool"), tagName: "수영왕",tagDescription: "물 만난 물고기 🐟"),
            Tag(tagImage: UIImage(named: "dance"), tagName: "댄싱머신",tagDescription: "둠칫둠칫 Best Dancer!"),
            Tag(tagImage: UIImage(named: "creditCard"), tagName: "결제담당", tagDescription: "ME에서 획득한 포인트로 5번 이상\n상품을 구매하셨네요!"),
            Tag(tagImage: UIImage(named: "rerb"), tagName: "자연인", tagDescription: "맑은 공기가 가득한 자연 속에서\n즐기는 하이킹!"),
            Tag(tagImage: UIImage(named: "run"), tagName: "리틀 우사인볼트", tagDescription: "달려라 달려!"),
            Tag(tagImage: UIImage(named: "chocolate"), tagName: "초콜릿 복근", tagDescription: "코어 트레이닝을 열심히 하셨네요.\n초콜릿 복근이 생기는 그날까지 화이팅!"),
            Tag(tagImage: UIImage(named: "pilates"), tagName: "바른자세", tagDescription: "필라테스로 다져진 바른자세.\n생활 속에서도 바른 자세를 유지하세요!"),
            Tag(tagImage: UIImage(named: "bicycle"), tagName: "Best 라이더", tagDescription: "바퀴 두 개만 있다면 어디든 ~"),
            Tag(tagImage: UIImage(named: "biceps"), tagName: "근력 UP", tagDescription: "근력 UPUPUP!"),
            Tag(tagImage: UIImage(named: "rowing"), tagName: "Boat", tagDescription: "I'm on a boat ~ 눈에 보이는 사방이 바다야\n갓 잡아 올린 생선을 회 쳐서 먹어"),
            Tag(tagImage: UIImage(named: "trophy"), tagName: "GOAT", tagDescription: "당신은 진정한 G.O.A.T")
        ]
    }
    
    // MARK: - Get Exercise Data
    func getTagData() -> [Tag] {
        return tagDataArray
    }
    
    subscript(index: Int) -> Tag {
        get {
            return tagDataArray[index]
        }
    }
    
}

