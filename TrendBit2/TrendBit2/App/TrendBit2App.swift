//
//  TrendBit2App.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import SwiftUI

@main
struct TrendBit2App: App {
    
    @StateObject private var toastManager = ToastManager.shared
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .overlay(
                    VStack {
                        if toastManager.isPresented {
                            ToastView(message: toastManager.message)
                                .animation(.easeInOut, value: toastManager.isPresented)
                                .zIndex(1)
                        }
                        Spacer()
                    }
                )
        }
    }
}
