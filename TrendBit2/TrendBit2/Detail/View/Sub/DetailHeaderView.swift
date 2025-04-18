//
//  DetailHeaderView.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import SwiftUI

struct DetailHeaderView: View {
    
    let coin: CoinDetailEntity
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
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: coin.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)

                Text(coin.name)
                    .textStyle(font: .title, weight: .bold)

                Spacer()
            }

            Text(coin.price)
                .textStyle(font: .largeTitle, weight: .black)

            HStack(spacing: 8) {
                Text(String(format: "%+.2f%%", coin.change))
                    .foregroundColor(coinColor)
                    .textStyle(font: .body, weight: .bold)
                Text("Today")
                    .textStyle(font: .footnote, color: .secondary)
            }
        }
    }
}
