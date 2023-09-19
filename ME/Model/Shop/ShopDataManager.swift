//
//  ShopDataManager.swift
//  ME
//
//  Created by 새미 on 2023/08/27.
//

import UIKit

final class ShopDataManager {
    
    private var shopDataArray: [Shop] = []
    
    let starbucksNotice = "- 상기 이미지는 연출된 것으로 실제와 다를 수 있습니다.\n- 본 상품은 매장 재고 상황에 따라 동일 상품으로 교환이 불가능할 수 있습니다.\n- 동일 상품 교환이 불가한 경우 동일 가격 이상의 다른 상품으로 교환이 가능합니다.(차액 발생 시 차액 지불) 만약 다른 상품으로 교환을 원치 않을 경우 매장에서 환불 요청 접수가 가능하며, 환불 요청 접수 시 카카오에서 쿠폰 수신자에게 환불 진행을 위한 알림톡을 발송합니다.\n- 스타벅스 앱의 사이렌 오더를 통해서도 주문 및 결제가 가능합니다. (일부 MD제외)\n- 미군부대 매장, 워터파크 입점 매장 등 일부 매장에서는 사용이 불가합니다.\n- 해당 쿠폰과 스타벅스 카드의 복합결제 거래는 스타벅스 카드의 고유 혜택인 Free Extra 및 별 적립은 적용 대상이 아닌 점 이용에 참고하시기 바랍니다.\n- 정식 판매처 외의 장소나 경로를 통하여 구매하거나, 기타의 방법으로 보유하신 쿠폰은 정상적인 사용 (환불, 재전송 등 포함)이 금지되거나 제한될 수 있으니 주의하시기 바랍니다"
    let twosomeplaceNotice = "- 상기 이미지는 연출된 것으로 실제와 다를 수 있습니다.\n- 일부 제품의 과일 데코레이션은 다른 과일로 대체될 수 있습니다.\n- 본 쿠폰은 해당 제품으로 교환 가능합니다.\n- 본 상품은 매장 재고 상황에 따라 동일 상품으로 교환이 불가능 할 수 있습니다.\n- 방문하실 매장에 사전 예약 또는 제품 확인 후 방문하시기 바랍니다.\n- 매장별 재고 및 판매 상황에 따라 해당 제품 구매가 불가능한 경우에는 동일 가격 이상의 다른 제품으로 교환 가능하며,차액은 추가 지불해야 합니다\n- 매장에서 해당 제품 구매가 어려운 경우, 다른 매장을 이용하거나 모바일쿠폰 구매처를 통해서 취소 환불할 수 있습니다\n- 매장별 금액이 상이할 수 있으며, 일부 매장에서는 추가 금액 결제 후 교환 가능합니다.\n- 본 쿠폰의 포인트 적립 및 제휴/할인 혜택 적용과 매장 내 운영하는 세트 메뉴 및 행사 상품의 교환 여부는 교환처의 정책에 따릅니다.\n- 시즌성 상품, 기업 경품(B2B), 할인 상품의 경우 유효기간이 상이할 수 있습니다."
    let baskinrobbinsNotice = "- 본 상품은 예시 이미지로서 실제 상품과 다를 수 있습니다.\n- 본 상품은 매장 재고 상황에 따라 동일 상품으로 교환이 불가능할 수 있습니다.\n- 동일 상품 교환이 불가한 경우와 기타 사유의 경우 동일 가격 이상의 다른 상품으로 교환이 가능합니다. (차액 발생 시 차액 지불 필요)\n※ 단, 2023년 3월 9일 이전 구매한 모바일교환권으로는 단종 또는 품절여부와 관계없이 타제품 교환 가능합니다.\n- 휴게소, 백화점, 공항 등 일부 매장에서는 사용이 제한될 수 있습니다."
    let sulbiingNotice = "- 전국 설빙 매장에서 사용 가능합니다. (단, 일부 매장, 백화점/특수매장에서 사용 불가)\n- 결제 시 모바일 쿠폰을 제시해 주시면 됩니다. (교환 시 각종 적립, 할인은 설빙 본사의 규정에 따릅니다.)\n- 본 상품이 매장 내 재고가 없을 경우 동일 가격의 단일 상품으로 교환 가능하며, 금액이초과되는 단일 상품으로 교환하실 경우 추가 금액 결제 시 교환 가능합니다.\n- 환불, 교환, 승인에 대한문의는 상품권 구매처에 문의해주시기 바랍니다. (설빙은 상품권 구매처가 아니고 사용처입니다.)\n- 본 모바일 쿠폰 및 상품권은 매장 방문 시에만 사용이 가능합니다. (배달주문 시 사용 불가합니다.)\n- 매장별 가격이 상이 할 수 있습니다."
    let momsTouchNotice = "- 본 상품은 매장 방문 또는 맘스터치 앱에서 사용 가능하며, 배달앱 주문시에는 사용이 불가합니다.\n- 일부 매장 및 특수매장(휴게소, 특설매장 등)에서는 사용이 불가합니다.\n- 사용불가매장은 홈페이지를 확인바랍니다.\n- 본 상품은 매장 재고 상황에 따라 동일 상품으로 교환이 불가능할 수 있습니다.\n- 동일 상품 교환이 불가능한 경우, 동일 가격 이상의 타 제품으로 교환이 가능하며, 초과금액은 추가 지불하셔야 합니다.\n- 매장별 재고 및 판매 상황에 따라 해당 제품 구매가 불가능한 경우에는 구매처에 환불을 요청할 수 있습니다.\n- 보유하신 쿠폰의 제품 가격이 인상/인하 되었을 경우, 브랜드사 정책에 따릅니다. (맘스터치 홈페이지 참조)\n- 유효기간 이내 사용 가능합니다."
    let gs25Notice = "- 본 상품권 매장 이용 시 통신사 할인, GS&포인트 적립 가능합니다.\n- 본 상품권은 기타 할인쿠폰과 같이 사용 가능합니다.\n- 본 상품권은 현금과 교환되지 않습니다.\n- 매장 내 행사 (1+1, 2+1) 적용 가능합니다. (단, 매장 행사기간 중에만 적용 가능)\n- 사용 후 잔액은 상품권 유효기간 내 사용 가능합니다.\n- 현금, 신용카드 등 다른 결제수단과 복합 결제 가능합니다.\n- 매장 교환 시 현금영수증 발급 가능합니다.\n- 구매 불가 품목 : 서비스/수탁 상품 (복권, 담배, 교통카드 충전, 택배, 세금&공과금 등) 결제는 불가합니다."
    let cuNotice = "- 구매불가품목 : 담배/택배/로또/토토/교통카드/기프트카드/프리페이드상품/쓰레기봉투 및 상품권류\n- 공과금 및 세금등 납부불가\n- 권면가액 내 여러번 분할 사용가능 (사용 후 잔액은 재 사용이 가능)\n- 권면가액 이상 구매시 현금/카드 등 추가 결제가능\n- 행사상품 2+1 등 이벤트 상품 구매가능\n- CU 멤버십 적용 또는 통신사 할인 가능\n- 현금과 교환불가"
    let gubneNotice = "- 유효기간 이내 사용 가능합니다.\n- 매장 상황에 따라 매장에서 드시는 것이 제한될 수 있습니다.\n- 모바일쿠폰 서비스는 교환 완료 후 주문 취소 불가합니다."
    let bbqNotice = "- E쿠폰 판매가는 부가세 포함가 입니다.\n-교환은 표기된 유효기간 내에 사용 가능합니다.\n- 상품권 사용 후에는 주문 취소가 불가합니다.\n- 배달료 등의 추가비용이 발생할 수 있으며, 매장별 비용이 상이할 수 있습니다.\n- 매장 상황 및 거리에 따가 배달 불가 지역이 발생할 수 있습니다.\n- 내점사용은 매장별로 일부 가격이 상이할 수 있습니다."
    let kyochonNotice = "배달 주문 시, 배달료가 별도로 부과됩니다.\n-이용 전 상단 이용불가 매장을 확인해주시길 바랍니다.\n- 홀 매장 이용 시, 모바일 쿠폰을 사전에 제시 해주셔야 사용 가능 합니다.\n- 음료는 매장에 따라 상품이 다를 수 있습니다.\n- 상기 이미지는 실제와 다를 수 있습니다.\n- 일부 매장에서는 홀 이용 시, 추가 요금이 발생할 수 있습니다.\n- 매장 재고 상황에 따라 해당 치킨 제품 제공이 불가능한 경우 동일 가격 이상의 다른 치킨 제품으로 교환이 가능하며, 추가 금액이 발생할 경우 추가 결제 후 교환이 가능 합니다.\n단, 본 쿠폰은 세트메뉴 쿠폰이므로 음료는 필수 제공 품목이며 메뉴 교환 시 치킨 메뉴에 한하여 교환이 가능 합니다."
    
    func makeShopData() {
        shopDataArray = [
            Shop(productImage: UIImage(named: "americano"), brandName: "스타벅스", productName: "아이스 아메리카노 T", price: 1, notice: starbucksNotice),
            Shop(productImage: UIImage(named: "icedCafeLatte"), brandName: "스타벅스", productName: "아이스 카페 라떼 T", price: 1, notice: starbucksNotice),
            Shop(productImage: UIImage(named: "caramelMacchiato"), brandName: "스타벅스", productName: "아이스 카라멜 마키아또 T", price: 1, notice: starbucksNotice),
            Shop(productImage: UIImage(named: "coldBrew"), brandName: "스타벅스", productName: "아이스 콜드 브루 T", price: 1, notice: starbucksNotice),
            Shop(productImage: UIImage(named: "iceBox"), brandName: "스타벅스", productName: "아이스 돌체라떼 T", price: 1, notice: starbucksNotice),
            Shop(productImage: UIImage(named: "grapefruitHoneyBlackTea"), brandName: "스타벅스", productName: "자몽 허니 블랙 티 T", price: 1, notice: starbucksNotice),
            Shop(productImage: UIImage(named: "strawberryChocolate"), brandName: "투썸플레이스", productName: "스트로베리 초콜릿 생크림", price: 1, notice: twosomeplaceNotice),
            Shop(productImage: UIImage(named: "iceBox"), brandName: "투썸플레이스", productName: "떠먹는 아이스박스", price: 1, notice: twosomeplaceNotice),
            Shop(productImage: UIImage(named: "baskinRobbinsPint"), brandName: "베스킨라빈스", productName: "파인트 아이스크림", price: 1, notice: baskinrobbinsNotice),
            Shop(productImage: UIImage(named: "injeolmiSulbing"), brandName: "설빙", productName: "인절미설빙", price: 1, notice: sulbiingNotice),
            Shop(productImage: UIImage(named: "cyBurgerSet"), brandName: "맘스터치", productName: "싸이버거 세트", price: 1, notice: momsTouchNotice),
            Shop(productImage: UIImage(named: "gs25"), brandName: "GS25", productName: "모바일 상품권 5,000", price: 1, notice: gs25Notice),
            Shop(productImage: UIImage(named: "cu"), brandName: "CU", productName: "모바일 상품권 5,000", price: 1, notice: cuNotice),
            Shop(productImage: UIImage(named: "redRepperChicken"), brandName: "굽네치킨", productName: "고추바사삭 + 콜라 1.25L", price: 1, notice: gubneNotice),
            Shop(productImage: UIImage(named: "goldenOlive"), brandName: "BBQ", productName: "황금올리브 + 콜라 1.25L", price: 1, notice: bbqNotice),
            Shop(productImage: UIImage(named: "honeyCombo"), brandName: "교촌치킨", productName: "허니콤보 + 콜라 1.25L", price: 1, notice: kyochonNotice)
        ]
    }
    
    // MARK: - Get Exercise Data
    func getShopData() -> [Shop] {
        return shopDataArray
    }
    
    subscript(index: Int) -> Shop {
        get {
            return shopDataArray[index]
        }
    }
    
}
