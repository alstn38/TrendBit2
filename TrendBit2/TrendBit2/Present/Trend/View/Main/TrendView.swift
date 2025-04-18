//
//  TrendView.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import SwiftUI

struct TrendView: View {
    
    private let gridRows: [GridItem] = Array(
        repeating: GridItem(.fixed(60), spacing: 0),
        count: 3
    )
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 32) {

                    /// My Favorite
                    SectionHeaderView("My Favorite")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(sampleFavorites) { coin in
                                TrendFavoriteCoinCardView(coin: coin)
                            }
                        }
                        .padding(.horizontal, 16)
                    }

                    /// Top 15 Coin
                    SectionHeaderView("Top15 Coin")
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: gridRows, alignment: .top, spacing: 0) {
                            ForEach(sampleTopCoins) { coin in
                                RankCoinRowView(coin: coin)
                                    .frame(width: 300)
                                    .padding(.horizontal)
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .frame(height: 60 * 3 + 12 * 2)

                    /// Top 7 NFT (스켈레톤)
                    SectionHeaderView("Top7 NFT")
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: gridRows, alignment: .top, spacing: 0) {
                            ForEach(sampleTopCoins) { coin in
                                RankCoinRowView(coin: coin)
                                    .frame(width: 300)
                                    .padding(.horizontal)
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .frame(height: 60 * 3 + 12 * 2)
                }
                .padding(.top, 24)
            }
            .navigationTitle("TrendBit2 Coin")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ProfileAvatarView()
                }
            }
        }
    }
}

#Preview {
    TrendView()
}
