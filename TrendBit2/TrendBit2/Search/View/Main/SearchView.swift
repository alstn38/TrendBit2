//
//  SearchView.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import SwiftUI

struct SearchView: View {
    
    @State private var query: String = ""
    @State private var searchItems = sampleSearchItems
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($searchItems.filter { itemBinding in
                    query.isEmpty || itemBinding.wrappedValue.name.localizedCaseInsensitiveContains(query)
                }, id: \.id) { $item in
                    CoinSearchRowView(item: $item, keyword: query)
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
            .searchable(text: $query, prompt: "Search coins...")
            .onSubmit(of: .search) {
                print("검색내용: \(query)")
            }
        }
    }
}

#Preview {
    SearchView()
}
