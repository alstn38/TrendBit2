//
//  CoinSearchEntity.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import Foundation

struct CoinSearchItem: Identifiable {
    let id: String
    let name: String
    let ticker: String
    let iconName: String
    var isFavorite: Bool = false
}
