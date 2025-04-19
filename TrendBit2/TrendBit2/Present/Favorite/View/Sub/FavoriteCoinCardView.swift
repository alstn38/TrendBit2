//
//  FavoriteCoinCardView.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import SwiftUI

struct FavoriteCoinCardView: View {
    
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
            HStack(spacing: 8) {
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
                        .textStyle(font: .headline, weight: .bold)
                    Text(coin.ticker)
                        .textStyle(font: .subheadline, color: .secondary)
                }
            }
            
            HStack {
                Spacer()
                Text("₩\(coin.price)")
                    .textStyle(font: .headline, weight: .bold)
            }
            .padding(.top, 20)
            
            HStack {
                Spacer()
                Text(String(format: "%+.2f%%", coin.change))
                    .textStyle(font: .footnote, color: coinColor, weight: .bold)
                    .foregroundColor(coinColor)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(coinColor.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 3)
    }
}
