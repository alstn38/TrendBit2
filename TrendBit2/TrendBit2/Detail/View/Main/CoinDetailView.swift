//
//  CoinDetailView.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import SwiftUI

struct CoinDetailView: View {
    
    let coin: CoinDetailEntity
    
    @State private var isFavorite = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    DetailHeaderView(coin: coin)
                    CoinMetricGridView(coin: coin)
                    CoinChartView(coin: coin)

                    Text(coin.lastUpdated)
                        .textStyle(font: .footnote, color: .secondary)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isFavorite.toggle()
                    } label: {
                        Image(systemName: isFavorite ? "star.fill" : "star")
                            .foregroundColor(.point)
                    }
                }
            }
        }
    }
}
