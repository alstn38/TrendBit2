//
//  FavoriteCoinEntity.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import Foundation

struct FavoriteCoinEntity: Identifiable {
    let id = UUID()
    let name: String
    let ticker: String
    let price: String
    let change: Double
    let iconName: String
}

let sampleFavorites: [FavoriteCoinEntity] = [
    .init(name: "Bitcoin",         ticker: "BTC",   price: "₩69,234,245", change: +0.64,  iconName: "bitcoin.circle.fill"),
    .init(name: "Wrapped Bitcoin", ticker: "BTC",   price: "₩67,886,314", change: -2.73, iconName: "bitcoin.circle")
]
