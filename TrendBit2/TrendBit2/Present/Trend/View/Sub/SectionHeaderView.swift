//
//  SectionHeaderView.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import SwiftUI

struct SectionHeaderView: View {
    
    private let title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .textStyle(font: .system(size: 24), weight: .bold)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
