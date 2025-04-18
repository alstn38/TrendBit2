//
//  CoinMetricGridView.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import SwiftUI

struct CoinMetricGridView: View {

    let coin: CoinDetailEntity

    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
            MetricItemView(title: "고가", value: coin.high, color: .red)
            MetricItemView(title: "저가", value: coin.low, color: .blue)
            MetricItemView(title: "신고점", value: coin.recordHigh, color: .red)
            MetricItemView(title: "신저점", value: coin.recordLow, color: .blue)
        }
    }
}
