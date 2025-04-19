//
//  CoinSearchRowView.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import SwiftUI

struct CoinSearchRowView: View {
    
    @Binding var item: CoinSearchItem
    @Binding var keyword: String
    let toggleFavorite: (String) -> Void

    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: item.iconName)) { phase in
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
            
            VStack(alignment: .leading, spacing: 2) {
                Text(item.name.highlighting(keyword, color: .point))
                Text(item.ticker).textStyle(font: .footnote, color: .secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Button {
                toggleFavorite(item.id)
            } label: {
                Image(systemName: item.isFavorite ? "star.fill" : "star")
                    .foregroundColor(.point)
                    .imageScale(.large)
            }
            .buttonStyle(.plain)
        }
    }
}
