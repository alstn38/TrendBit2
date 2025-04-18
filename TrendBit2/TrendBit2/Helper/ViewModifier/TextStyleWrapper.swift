//
//  TextStyleWrapper.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import SwiftUI

struct TextStyleWrapper: ViewModifier {
    
    let font: Font
    let color: Color
    let weight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(font.weight(weight))
            .foregroundColor(color)
    }
}

extension View {
    
    func textStyle(
        font: Font,
        color: Color = .black,
        weight: Font.Weight = .regular
    ) -> some View {
        return modifier(
            TextStyleWrapper(
                font: font,
                color: color,
                weight: weight
            )
        )
    }
}
