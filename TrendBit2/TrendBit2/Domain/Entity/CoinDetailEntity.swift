//
//  CoinDetailEntity.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import Foundation

struct CoinDetailEntity: Identifiable {
    let id: String
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
    var isFavorite: Bool = false
}
