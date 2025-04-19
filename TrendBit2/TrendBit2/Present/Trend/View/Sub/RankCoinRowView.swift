//
//  RankCoinRowView.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import SwiftUI

struct RankCoinRowView: View {
    
    @Binding var coin: RankedCoinEntity
    
    private var coinColor: Color {
        if coin.change > 0 {
            return .red
        } else if coin.change < 0 {
            return .blue
        } else {
            return .black
        }
    }
    
    var body: some View {
        HStack(spacing: 16) {
            Text("\(coin.rank)")
                .textStyle(font: .title3, weight: .bold)
                .frame(width: 24, alignment: .leading)
            
            AsyncImage(url: URL(string: coin.iconName)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 28, height: 28)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.secondary)
                @unknown default:
                    EmptyView()
                        .frame(width: 28, height: 28)
                }
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(coin.name)
                    .textStyle(font: .headline)
                Text(coin.ticker)
                    .textStyle(font: .footnote, color: .secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .trailing, spacing: 2) {
                Text("＄\(coin.price)")
                    .textStyle(font: .headline, weight: .semibold)
                Text(String(format: "%+.2f%%", coin.change))
                    .textStyle(
                        font: .footnote,
                        color: coinColor,
                        weight: .bold
                    )
            }
        }
        .padding(.vertical, 12)
    }
}
