//
//  FavoriteView.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import SwiftUI

struct FavoriteView: View {
    
    @StateObject private var viewModel = FavoriteViewModel()
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Favorite Coin")
                        .textStyle(font: .largeTitle, weight: .bold)
                        .padding(.horizontal, 16)
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach($viewModel.output.favoriteCoins) { $coin in
                            NavigationLink {
                                CoinDetailView(id: coin.id)
                            } label: {
                                FavoriteCoinCardView(coin: $coin)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.top, 24)
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ProfileAvatarView()
                }
            }
            .onAppear {
                viewModel.input.onAppear.send(())
            }
        }
    }
}
