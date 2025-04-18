//
//  MetricItemView.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import SwiftUI

struct MetricItemView: View {

    let title: String
    let value: String
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .textStyle(font: .subheadline, color: color, weight: .bold)
            Text(value)
                .textStyle(font: .body)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
