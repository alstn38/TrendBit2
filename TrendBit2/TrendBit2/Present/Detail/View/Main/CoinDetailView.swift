//
//  CoinDetailView.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import SwiftUI

struct CoinDetailView: View {
    
    @StateObject private var viewModel = CoinDetailViewModel()
    let id: String

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    if let coin = viewModel.output.coinDetail {
                        DetailHeaderView(coin: coin)
                        CoinMetricGridView(coin: coin)
                        CoinChartView(coin: coin)
                        
                        Text(coin.lastUpdated)
                            .textStyle(font: .footnote, color: .secondary)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                    } else {
                        ProgressView()
                    }
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.input.toggleFavorite.send(())
                    } label: {
                        Image(systemName: viewModel.output.coinDetail?.isFavorite ?? false ? "star.fill" : "star")
                            .foregroundColor(.point)
                    }
                }
            }
            .onAppear {
                viewModel.input.onAppear.send(id)
            }
        }
    }
}
