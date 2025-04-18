//
//  CoinChartView.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import SwiftUI
import Charts

struct CoinChartView: View {
    
    let coin: CoinDetailEntity
    
    /// 최소값에서 0.95배만큼의 값을 뺀다. (그래프가 더 잘보이기 위함)
    private var removePrice: Double {
        return (coin.changePrices.min() ?? 0.0) * 0.95
    }
    
    var body: some View {
        Chart {
            ForEach(Array(coin.changePrices.enumerated()), id: \.offset) { index, price in
                AreaMark(
                    x: .value("Index", index),
                    y: .value("Price", price - removePrice)
                )
                
                LineMark(
                    x: .value("Index", index),
                    y: .value("Price", price - removePrice)
                )
                .foregroundStyle(.point)
                .lineStyle(.init(lineWidth: 2))
                .interpolationMethod(.cardinal)
            }
        }
        .foregroundStyle(
            LinearGradient(
                gradient: Gradient(colors: [
                    .point.opacity(0.9),
                    .point.opacity(0.1)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .frame(height: 300)
    }
}

#Preview {
    CoinChartView(coin: sampleDetail)
}
