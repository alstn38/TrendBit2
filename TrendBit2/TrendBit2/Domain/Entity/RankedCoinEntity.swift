//
//  RankedCoinEntity.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import Foundation

struct RankedCoinEntity: Identifiable {
    let id: String
    let rank: Int
    let name: String
    let ticker: String
    let price: String
    let change: Double
    let iconName: String
}
