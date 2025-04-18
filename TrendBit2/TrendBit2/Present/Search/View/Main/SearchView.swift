//
//  SearchView.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($viewModel.output.searchResults) { $item in
                    CoinSearchRowView(
                        item: $item,
                        keyword: $viewModel.input.query,
                        toggleFavorite: { id in
                            viewModel.input.toggleFavorite.send(id)
                        }
                    )
                }
            }
            .listStyle(.plain)
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ProfileAvatarView()
                }
            }
            .searchable(text: $viewModel.input.query, prompt: "Search coins")
            .onSubmit(of: .search) {
                viewModel.input.searchSubmitted.send(())
            }
        }
    }
}

#Preview {
    SearchView()
}
