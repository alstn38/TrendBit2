//
//  RankedCoinEntity.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import Foundation

struct RankedCoinEntity: Identifiable {
    let id = UUID()
    let rank: Int
    let name: String
    let ticker: String
    let price: String
    let change: Double
    let iconName: String
}

let sampleTopCoins: [RankedCoinEntity] = [
    .init(rank: 1,  name: "Solana",       ticker: "SOL",   price: "$158.17",  change: +21.18, iconName: "bitcoinsign.circle"),
    .init(rank: 2,  name: "Magic Square", ticker: "SQR",   price: "$0.5247", change: +1.38,  iconName: "square.grid.3x3.fill"),
    .init(rank: 3,  name: "Pixels",       ticker: "PIXEL", price: "$0.4889", change: -14.56, iconName: "diamond.fill"),
    .init(rank: 4,  name: "Ethereum",     ticker: "ETH",   price: "$3,376",  change: +3.42,  iconName: "ethereum.sign.circle"),
    .init(rank: 5,  name: "Cardano",      ticker: "ADA",   price: "$0.57",   change: -0.21,  iconName: "circle.grid.cross"),
    .init(rank: 6,  name: "Dogecoin",     ticker: "DOGE",  price: "$0.18",   change: +4.51,  iconName: "t.circle"),
    .init(rank: 7,  name: "XRP",          ticker: "XRP",   price: "$0.59",   change: +0.90,  iconName: "x.circle"),
    .init(rank: 8,  name: "Litecoin",     ticker: "LTC",   price: "$84.12",  change: -1.14,  iconName: "l.circle"),
    .init(rank: 9,  name: "Polygon",      ticker: "MATIC", price: "$1.04",   change: +2.78,  iconName: "m.circle"),
    .init(rank: 10, name: "Avalanche",    ticker: "AVAX",  price: "$42.75",  change: -0.85,  iconName: "a.circle"),
    .init(rank: 11, name: "Chainlink",    ticker: "LINK",  price: "$15.48",  change: +5.21,  iconName: "link.circle"),
    .init(rank: 12, name: "Polkadot",     ticker: "DOT",   price: "$7.26",   change: +0.33,  iconName: "p.circle"),
    .init(rank: 13, name: "Toncoin",      ticker: "TON",   price: "$2.90",   change: +1.12,  iconName: "t.circle.fill"),
    .init(rank: 14, name: "Uniswap",      ticker: "UNI",   price: "$11.37",  change: -2.02,  iconName: "u.circle"),
    .init(rank: 15, name: "Shiba Inu",    ticker: "SHIB",  price: "$0.00003",change: +8.44,  iconName: "s.circle")
]
