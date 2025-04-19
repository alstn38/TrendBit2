//
//  LazyView.swift
//  TrendBit2
//
//  Created by 강민수 on 4/19/25.
//

import SwiftUI

struct LazyView<Content: View>: View {
    
    private let content: () -> Content
    
    var body: some View {
        content()
    }
    
    init(content: @escaping () -> Content) {
        self.content = content
    }
}
