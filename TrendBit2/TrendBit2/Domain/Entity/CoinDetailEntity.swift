//
//  CoinDetailEntity.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import Foundation

struct CoinDetailEntity {
    let name: String
    let iconName: String
    let price: String
    let change: Double
    let high: String
    let low: String
    let recordHigh: String
    let recordLow: String
    let changePrices: [Double]
    let lastUpdated: String
    var isFavorite: Bool
}

let sampleDetail = CoinDetailEntity(
    name: "Solana",
    iconName: "ethereum.sign.circle",
    price: "₩69,234,245",
    change: +3.22,
    high: "₩69,234,243",
    low: "₩69,234,245",
    recordHigh: "₩2,869,234,243",
    recordLow: "₩6,364",
    changePrices: [
        50, 52, 53, 55, 54, 57, 60, 59, 63, 67, 65, 70, 68, 64, 60, 58, 55, 56, 58, 61, 64, 66, 65, 63, 62
    ],
    lastUpdated: "2/21 11:53:50 업데이트",
    isFavorite: true
)
