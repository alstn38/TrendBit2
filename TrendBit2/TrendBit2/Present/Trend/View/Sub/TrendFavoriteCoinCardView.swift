//
//  TrendFavoriteCoinCardView.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import SwiftUI

struct TrendFavoriteCoinCardView: View {
    
    @Binding var coin: FavoriteCoinEntity
    
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
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12) {
                AsyncImage(url: URL(string: coin.iconName)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 40, height: 40)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.secondary)
                    @unknown default:
                        EmptyView()
                            .frame(width: 40, height: 40)
                    }
                }
                .padding(8)
                .background(Color.white)
                .clipShape(Circle())

                VStack(alignment: .leading, spacing: 4) {
                    Text(coin.name)
                        .textStyle(font: .headline, weight: .bold)
                    Text(coin.ticker)
                        .textStyle(font: .subheadline, color: .secondary)
                }
            }

            Text("₩\(coin.price)")
                .textStyle(font: .title3, weight: .semibold)
            
            Text(String(format: "%+.2f%%", coin.change))
                .textStyle(
                    font: .subheadline,
                    color: coinColor,
                    weight: .bold
                )
        }
        .padding()
        .frame(width: 260, alignment: .leading)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }
}
