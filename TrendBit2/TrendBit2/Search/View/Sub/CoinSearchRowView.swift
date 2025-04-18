//
//  CoinSearchRowView.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import SwiftUI

struct CoinSearchRowView: View {
    
    @Binding var item: CoinSearchItem
    let keyword: String

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: item.iconName)
                .resizable().scaledToFit()
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(item.name.highlighting(keyword, color: Color("point")))
                Text(item.ticker).textStyle(font: .footnote, color: .secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Button {
                item.isFavorite.toggle()
            } label: {
                Image(systemName: item.isFavorite ? "star.fill" : "star")
                    .foregroundColor(.point)
                    .imageScale(.large)
            }
        }
    }
}
