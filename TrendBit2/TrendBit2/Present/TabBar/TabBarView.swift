//
//  TabBarView.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            TrendView()
                .tabItem { Image(systemName: "chart.line.uptrend.xyaxis") }

            SearchView()
                .tabItem { Image(systemName: "magnifyingglass") }

            FavoriteView()
                .tabItem { Image(systemName: "star") }
        }
        .tint(.point)
    }
}

#Preview {
    TabBarView()
}
