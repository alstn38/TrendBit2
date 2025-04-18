//
//  CoinSearchEntity.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import Foundation

struct CoinSearchItem: Identifiable {
    let id = UUID()
    let name: String
    let ticker: String
    let iconName: String
    var isFavorite: Bool = false
}

let sampleSearchItems: [CoinSearchItem] = [
    CoinSearchItem(name: "Bitcoin", ticker: "BTC", iconName: "bitcoinsign.circle.fill", isFavorite: true),
    CoinSearchItem(name: "Wrapped Bitcoin", ticker: "BTC", iconName: "bitcoinsign.circle"),
    CoinSearchItem(name: "BitTorrent", ticker: "BTT", iconName: "arrow.triangle.2.circlepath"),
    CoinSearchItem(name: "WhiteBIT Coin", ticker: "WBT", iconName: "w.circle.fill"),
    CoinSearchItem(name: "cWBTC", ticker: "cWBTC", iconName: "c.circle"),
    CoinSearchItem(name: "Bitcoin Gold", ticker: "BTG", iconName: "b.circle", isFavorite: true),
    CoinSearchItem(name: "Huobi BTC", ticker: "HBTC", iconName: "flame"),
    CoinSearchItem(name: "Bitcoin Avalanche Bridged", ticker: "BTC.B", iconName: "bitcoinsign.circle"),
    CoinSearchItem(name: "BTSE Token", ticker: "BTSE", iconName: "b.square.fill"),
    CoinSearchItem(name: "BitDAO", ticker: "BIT", iconName: "circle.fill")
]
