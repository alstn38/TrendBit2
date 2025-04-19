//
//  ToastView.swift
//  TrendBit2
//
//  Created by 강민수 on 4/19/25.
//

import SwiftUI

struct ToastView: View {
    
    let message: String

    var body: some View {
        Text(message)
            .font(.subheadline)
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color.black.opacity(0.8))
            .cornerRadius(12)
            .transition(.move(edge: .top).combined(with: .opacity))
            .padding(.top, 60)
    }
}
